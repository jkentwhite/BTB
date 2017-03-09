//creat local variables for a flying object that must be avoided
int objectX = 512, objectY = 388;
PImage redBurst;
boolean upX = true, upY = true, collisionBurst = false;
int collisionTimer = 0, collisionDistance = 50, collisionRadius = 10;

void floorGridSymbolsLevelFour() {

  //println(objectX + ", " + objectY);

  redBurst = loadImage("redBurst.png");
  //load images from camera
  img.loadPixels();
  imgVideo = kinect.getVideoImage();

  //clear blobs arraylist
  blobs.clear();

  //get depth info from kinect
  int[] depth = kinect.getRawDepth();

  for (int x = 10; x < kinect.width-10; x++) {
    for (int y = 0; y < kinect.height; y++) {
      int offset = x + y * img.width;
      int d = depth[offset];

      //set the depth for the sensor to pick up players
      if (d > minTreshold && d < maxThreshold) {
        //see if the pixels in the range of the sensor are already part of a blob
        boolean found = false;
        for (Blob b : blobs) {
          //if the pixel is close enough it will become part of a previously defined blob
          if (b.isNear(x, y)) {
            b.add(x, y);
            found = true;
            break;
          }
        }
        //if there are no blobs or the pixel is far enough away, start a new blob
        if (!found) {
          Blob b = new Blob(x, y);
          blobs.add(b);
          b.id = blobCounter;
        }
      }
    }
  }

  //update the image from camera
  img.updatePixels();
  imageMode(CENTER);
  //image(imgVideo,width/2,height/2, displayWidth, displayHeight);
  tint(255, 128);
  image(img, width/2, height/2, displayWidth, displayHeight);

  //draw the grid
  for (int i = 0; i < 16; i++) {
    rectMode(CORNER);
    noFill();
    stroke(255, 105, 180);
    rect(gridSections[i][0], gridSections[i][1], gridX, gridY);
  }  

  if (collisionBurst) {
    collisionTimer++;
    levelCountdownLevelFour = 100;
    if (collisionTimer >= 30) {
      
      collisionBurst = false;
      collisionTimer = 0;
      levelCountdownLevelFour = 70;

    }
  }



  //start the level  
  if (patternCounter < patternRectsB.length) {
    patternNumber = patternCounter;
  } else {
    patternNumber = 0;
    patternCounter = 0;
  }


  if (!collisionBurst) {
    ////build the pattern for each patternNumber
     //start the level  

  if (!patternSet) {
    for (int i = 0; i < 16; i++) {
      int symbol = int(random(2));
      if (patternRects[patternNumber][0] == i || patternRects[patternNumber][1] == i || patternRects[patternNumber][2] == i || patternRects[patternNumber][3] == i) {
        gridSymbol[i] = 3;
      } else {

      if (symbol == 0) {
        if (hawkCounter < 4) {
          gridSymbol[i] = 0;
          hawkCounter++;
        } else {
          symbol = int(random(1, 2));
        }
      }  
      if (symbol == 1) {
        if (skullCounter < 4) {
          gridSymbol[i] = 1;
          skullCounter++;
        } else {
          symbol = 2;
        }
      } 
      if (symbol == 2) {
        if (bombCounter < 4) {
          gridSymbol[i] = 2;
          bombCounter++;
        } else {
          symbol = int(random(0, 2));
        }
      }
     }
      //println(gridSymbol[i]);
    }  

    patternSet = true;
  }
  //build the pattern with symbols
  for (int i = 0; i < 16; i++) {
    tint(255, 200);
    if (gridSymbol[i] == 3) {
      //fill(200);
      int rectX = gridSections[i][0];
      int rectY = gridSections[i][1];
      if(currentRectOccupied[i]){
        tint(255, 255);
        image(eagle, rectX + 128, rectY + 96);
      } else {
      //image(greyEagle, rectX + 128, rectY + 96);
      }
      //rectMode(CORNER);
      //rect(rectX, rectY, gridX, gridY);
    } 

    if (gridSymbol[i] == 0) {  
      int rectX = gridSections[i][0];
      int rectY = gridSections[i][1];
      if(currentRectOccupied[i]){
        image(hawk, rectX + 128, rectY + 96);
      } else {
      //image(greyHawk, rectX + 128, rectY + 96);
      }
    }

    if (gridSymbol[i] == 1) {
      int rectX = gridSections[i][0];
      int rectY = gridSections[i][1];
      if(currentRectOccupied[i]){
        image(skull, rectX + 128, rectY + 96);
      } else {
      //image(greySkull, rectX + 128, rectY + 96);
      }  
  }

    if (gridSymbol[i] == 2) {
      int rectX = gridSections[i][0];
      int rectY = gridSections[i][1];
      if(currentRectOccupied[i]){
        image(bomb, rectX + 128, rectY + 96);
      } else {
      //image(greyBomb, rectX + 128, rectY + 96);
      }  
  }
  }
    } else {
    background(0);
    //draw the grid
  for (int i = 0; i < 16; i++) {
    rectMode(CORNER);
    noFill();
    stroke(255, 105, 180);
    rect(gridSections[i][0], gridSections[i][1], gridX, gridY);
  }  
  }

  //draw the blobs if they are bigger than 500
  blobCounter = 0;
  for (Blob b : blobs) {
    if (b.size() > 500) {

      b.show();
      if (collisionBurst) {
        textSize(32);
        fill(255, 0, 0);
        text("AVOID THE RED BURST!", width/2, height/3);
      } else {
        blobCounter++;
        if(blobCounter > 3){
          blobCounter = 3;
          }
      }
    }
  }



  //for each blob that exists, let's check it against the grid for that level    
for (Blob b : blobs) {


    //loop through the grid spaces to determine if the blobs are in the grid sections
    //and set the relative boolean array to TRUE or FALSE accordingly
    for (int i  = 0; i < gridSections.length; i++) {
      if(b.id == 0){
      if (b.centerOfBlobX > gridSections[i][0] && b.centerOfBlobX < (gridSections[i][0] + gridX) && b.centerOfBlobY > gridSections[i][1] && b.centerOfBlobY < (gridSections[i][1] + gridY)) {
        gridRectOccupied[i][0] = true;
        }       else {
        gridRectOccupied[i][0] = false;
      } //
      }
      if(b.id == 1){
        if (b.centerOfBlobX > gridSections[i][0] && b.centerOfBlobX < (gridSections[i][0] + gridX) && b.centerOfBlobY > gridSections[i][1] && b.centerOfBlobY < (gridSections[i][1] + gridY)) {
        gridRectOccupied[i][1] = true;
        }       else {
        gridRectOccupied[i][1] = false;
      } //
      }
      if(b.id == 2){
        if (b.centerOfBlobX > gridSections[i][0] && b.centerOfBlobX < (gridSections[i][0] + gridX) && b.centerOfBlobY > gridSections[i][1] && b.centerOfBlobY < (gridSections[i][1] + gridY)) {
          gridRectOccupied[i][2] = true;
        }      else {
        gridRectOccupied[i][2] = false;
      } //
      }
      if(b.id == 3){
      if (b.centerOfBlobX > gridSections[i][0] && b.centerOfBlobX < (gridSections[i][0] + gridX) && b.centerOfBlobY > gridSections[i][1] && b.centerOfBlobY < (gridSections[i][1] + gridY)) {
        gridRectOccupied[i][3] = true;
        }       else {
        gridRectOccupied[i][3] = false;
      } //
      }
      //******* uncomment this section to play the game *********

      //**************
      
      for(int j = 0; j < gridRectOccupied[i].length; j++){
        if(gridRectOccupied[i][j]){
          currentRectOccupied[i] = true;
          j = gridRectOccupied[i].length;
        } 
      }
      //println("Section " + i + "= " + gridRectOccupied[i][0] + " " + gridRectOccupied[i][1] + " " + gridRectOccupied[i][2] + " " + gridRectOccupied[i][3] + " " + currentRectOccupied[i]);
       
    }
    
    for (int i  = 0; i < gridSections.length; i++) {
          for(int j = 0; j < gridRectOccupied[i].length; j++){
          if(currentRectOccupied[i]){
            rectOccupiedTimer[i]--;
          }
          if(rectOccupiedTimer[i] == 0){
              if(gridRectOccupied[i][j]){
                currentRectOccupied[i] = true;
              } else{
                 currentRectOccupied[i] = false;
              }
              rectOccupiedTimer[i] = 50;
            }
          }
        }

    //once the boolean are being triggered, this will look to see if the pattern from the patternNumber array is being matched 
    //and if so, begin a short timer to accentuate unlocking the pattern
    //here i am asking for the boolean that is assocaited with the designated grid sections according to the pattern number
    //and if that is true for all four sections of that pattern then begin to register the pattern with a short timer followed by 
    //completing the pattern




    if (currentRectOccupied[patternRects[patternNumber][0]] && currentRectOccupied[patternRects[patternNumber][1]] && currentRectOccupied[patternRects[patternNumber][2]] && currentRectOccupied[patternRects[patternNumber][3]]) {
    //  println("Pattern Matched!");

    //use the arrays to set the designation for the pattern to be registered
    int rectOneX = gridSections[patternRects[patternNumber][0]][0];
    int rectOneY = gridSections[patternRects[patternNumber][0]][1];
    int rectTwoX = gridSections[patternRects[patternNumber][1]][0];
    int rectTwoY = gridSections[patternRects[patternNumber][1]][1];
    int rectThreeX = gridSections[patternRects[patternNumber][2]][0];
    int rectThreeY = gridSections[patternRects[patternNumber][2]][1];
    int rectFourX = gridSections[patternRects[patternNumber][3]][0];
    int rectFourY = gridSections[patternRects[patternNumber][3]][1];

    noStroke();

    //check if each of the blobs are in the designated rectangle and count to ten before registering TRUE
    if (currentRectOccupied[patternRects[patternNumber][0]]) {
      if (!rectOneGood) {
        rectMode(CORNER);  
        fill(54, 243, 179);
        rect(rectOneX, rectOneY, gridX, spaceCounterOne * 10);
      }
      spaceCounterOne++;
    } 
    if (spaceCounterOne >= 10) {
      rectOneGood = true;
      rectMode(CORNER);  
      fill(54, 243, 179);
      rect(rectOneX, rectOneY, gridX, gridY);
    }


    if (currentRectOccupied[patternRects[patternNumber][1]]) {
      if (!rectTwoGood) {
        rectMode(CORNER);  
        fill(54, 243, 179);
        rect(rectTwoX, rectTwoY, gridX, spaceCounterTwo * 10);
      }
      spaceCounterTwo++;
    } 
    if (spaceCounterTwo >= 10) {
      rectTwoGood = true;
      rectMode(CORNER);  
      fill(54, 243, 179);
      rect(rectTwoX, rectTwoY, gridX, gridY);
    }


    if (currentRectOccupied[patternRects[patternNumber][2]]) {
      if (!rectThreeGood) {
        rectMode(CORNER);  
        fill(54, 243, 179);
        rect(rectThreeX, rectThreeY, gridX, spaceCounterThree * 10);
      }
      spaceCounterThree++;
    } 
    if (spaceCounterThree >= 10) {
      rectThreeGood = true;
      rectMode(CORNER);  
      fill(54, 243, 179);
      rect(rectThreeX, rectThreeY, gridX, gridY);
    }


    if (currentRectOccupied[patternRects[patternNumber][3]]) {
      if (!rectFourGood) {
        rectMode(CORNER);  
        fill(54, 243, 179);
        rect(rectFourX, rectFourY, gridX, spaceCounterFour * 10);
      }
      spaceCounterFour++;
    }
    if (spaceCounterFour >= 10) {
      rectFourGood = true;
      rectMode(CORNER);  
      fill(54, 243, 179);
      rect(rectFourX, rectFourY, gridX, gridY);
    }
   }
  }

  //draw the blobs if they are bigger than 500
 blobCounter = 0;
  for (Blob b : blobs) {
    if (b.size() > 500) {

      if (collisionBurst) {
        textSize(32);
        fill(255, 0, 0);
        text("AVOID THE RED BURST!", width/2, height/3);
      } else {
        b.show();
        blobCounter++;
        if(blobCounter > 3){
          blobCounter = 3;
          }
      }
    }
  }

  //remember to turn this back on if want timer
  //levelCountdownLevelFour--;


  if (rectOneGood && rectTwoGood && rectThreeGood && rectFourGood) {

    chime.trigger();

    numberCorrect++;

    patternCounter++;
    rectOneGood = false;
    rectTwoGood = false;
    rectThreeGood = false;
    rectFourGood = false;

    levelCountdownLevelFour = 70;

    spaceCounterOne = 0;
    spaceCounterTwo = 0;
    spaceCounterThree = 0;
    spaceCounterFour = 0;
    
    clearGridSymbolArray();
  } else if (levelCountdownLevelFour == 0) {
    buzzer2.trigger();
    patternCounter++;
    levelCountdownLevelFour = 70;

    rectOneGood = false;
    rectTwoGood = false;
    rectThreeGood = false;
    rectFourGood = false;     

    spaceCounterOne = 0;
    spaceCounterTwo = 0;
    spaceCounterThree = 0;
    spaceCounterFour = 0;
    clearGridSymbolArray();
  }




  if (numberCorrect >= targetPatternNumber) {
    floorGridSymbolsLevelFour = false;
    levelFourPlayed = true;
    floorGridComplete = true;
    countdownFive = 50;
    numberCorrect = 0;
    clearGridSymbolArray();
    
    excellentWork.play();
  }
  if (levelCountdownLevelFour < 40) {
    textSize(80);
    fill(255,0,0);
    text(levelCountdownLevelFour/10 + 1, width/2, height/2);
  }  

  //make the red burst appear
  noTint();
  image(redBurst, objectX, objectY);

  //move the burst around and make sure it stays on the screen
  if (objectX < 1000 && upX) {
    objectX+=burstSpeed;
    if (objectX >= 1000) {
      upX = false;
    }
  } else if (objectX > 10 && !upX) {
    objectX-=burstSpeed;
    if (objectX <= 10) {
      upX = true;
    }
  }

  if (objectY < 750 && upY) {
    objectY+=burstSpeed;
    if (objectY >= 750) {
      upY = false;
    }
  } else if (objectY > 10 && !upY) {
    objectY-=burstSpeed;
    if (objectY <= 10) {
      upY = true;
    }
  }

  //check to see if the burst is close enough to any blob to be considered a collision
  //both collisionRadius and collisionDistance can be changed from the main sketch tab
  for (Blob b : blobs) {
    if ((objectX + collisionRadius) < (b.centerOfBlobX + collisionDistance) && (objectX - collisionRadius) > (b.centerOfBlobX - collisionDistance) && (objectY + collisionRadius) < (b.centerOfBlobY + collisionDistance) && (objectY + collisionRadius) > (b.centerOfBlobY - collisionDistance)) {
      background(0);
      collisionBurst = true;
      buzzer.trigger();
      //numberCorrect--;
      patternCounter++;
      
      rectOneGood = false;
      rectTwoGood = false;
      rectThreeGood = false;
      rectFourGood = false;

      spaceCounterOne = 0;
      spaceCounterTwo = 0;
      spaceCounterThree = 0;
      spaceCounterFour = 0;
      clearGridSymbolArray();
    }
  }
  
  //if(numberCorrect < 0){
  //  numberCorrect = 0;
  //} 
  textSize(64);
  fill(255);
  //text("NUMBER CORRECT: " + numberCorrect, width/2, height - 100);

  //to move to the next level press Q
  if (keyPressed) {
    if (key == 'q' || key == 'Q') {
      floorGridSymbolsLevelFour = false;
      levelFourPlayed = true;
      floorGridComplete = true;
      countdownFive = 50;
      //numberCorrect = 0;
      
      rectOneGood = false;
      rectTwoGood = false;
      rectThreeGood = false;
      rectFourGood = false;

      spaceCounterOne = 0;
      spaceCounterTwo = 0;
      spaceCounterThree = 0;
      spaceCounterFour = 0;
      clearGridSymbolArray();
      
      excellentWork.play();
    }
  }
  //println("pattern number: " + patternNumber);
  println("FLOOR GRID LEVEL FOUR");
  println("Press Q to move to BOMB CHAMBER");
}