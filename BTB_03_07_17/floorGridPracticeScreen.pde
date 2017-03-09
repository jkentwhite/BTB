int helpCounter = 0;
int debugYpos = 200;

void floorGridPracticeScreen() {

  //clear the background
  background(0);
  
  helpCounter++;

  //load images from camera
  img.loadPixels();
  imgVideo = kinect.getVideoImage();

  //clear blobs arraylist
  ArrayList<Blob> currentBlobs = new ArrayList<Blob>();

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
        for (Blob b : currentBlobs) {
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
          currentBlobs.add(b);
          b.id = blobCounter;
        }
      }
    }
  }

for (int i = currentBlobs.size()-1; i >= 0; i--){
  if(currentBlobs.get(i).size() < 500){
    currentBlobs.remove(i);
  }
}


blobCounter = 0;
//Match currentBlobs with blobs
if(blobs.isEmpty() && currentBlobs.size() > 0){
  for (Blob b : currentBlobs){
    //b.id= blobCounter;
    blobs.add(b);
    blobCounter++;
  }
} else if(blobs.size() <= currentBlobs.size()){
  for (Blob b : blobs){
    float recordD = 1000;
    Blob matched = null;
    for (Blob cb : currentBlobs){
      PVector centerB = b.getCenter();
      PVector centerCB = cb.getCenter();
      float d = PVector.dist(centerB, centerCB);
      if(d < recordD && !cb.taken) {
        recordD = d;
        matched = cb;
      }
    }
    if(matched != null){
    matched.taken = true;
    b.become(matched);
    }
  }
  //blobCounter = 0;
  for(Blob b : currentBlobs){
    if(!b.taken) {
      //b.id = blobCounter;
      blobs.add(b);
      blobCounter++;
    }
  }
} else if(blobs.size() > currentBlobs.size()){
  for(Blob b : blobs){
    b.taken = false;
  }
  
   for (Blob cb : currentBlobs){
    float recordD = 1000;
    Blob matched = null;
    for (Blob b : blobs){
      PVector centerB = b.getCenter();
      PVector centerCB = cb.getCenter();
      float d = PVector.dist(centerB, centerCB);
      if(d < recordD && !b.taken) {
        recordD = d;
        matched = b;
      }
    }
    if(matched != null){
    matched.taken = true;
    //matched.timer = 50;
    matched.become(cb);
    } 
    
    
  }
  for(int i = blobs.size()-1; i >= 0; i--){
      Blob b = blobs.get(i);
      if(!b.taken) {
        blobs.remove(i);
        //b.update();
        //if(b.checkTimer()){
        //  blobs.remove(i);
        //}
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
    stroke(255, 255, 0);
    rect(gridSections[i][0], gridSections[i][1], gridX, gridY);
  }




  //set the pattern for the intro
  patternNumber = 0;


if(!patternSet){
  for (int i = 0; i < 16; i++) {
    int symbol = int(random(2));
    if(patternRects[patternNumber][0] == i || patternRects[patternNumber][1] == i || patternRects[patternNumber][2] == i || patternRects[patternNumber][3] == i){
        gridSymbol[i] = 3;
      } else {
        
    if(symbol == 0){
      if(hawkCounter < 4){
      gridSymbol[i] = 0;
      hawkCounter++;
      } else {
        symbol = int(random(1,2));
      }
    }  
    if(symbol == 1){
      if(skullCounter < 4){
      gridSymbol[i] = 1;
      skullCounter++;
      } else {
        symbol = 2;
      }
    } 
    if(symbol == 2){
      if(bombCounter < 4){
      gridSymbol[i] = 2;
      bombCounter++;
      } else {
        symbol = int(random(0,2));
      }
    }
      }
    //println(gridSymbol[i]);
    }  
  
   patternSet = true;
}
  
  
  //build the pattern with symbols
  for (int i = 0; i < 16; i++) {
      
      tint(255,150);
      
      if(gridSymbol[i] == 3) {
      //fill(200);
      int rectX = gridSections[i][0];
      int rectY = gridSections[i][1];
      if(helpCounter > 100){
        tint(255, alphaCounter);
        image(glowEagle, rectX + 128, rectY + 96);
      }
      tint(255,150);
      image(eagle, rectX + 128, rectY + 96);
      //rectMode(CORNER);
      //rect(rectX, rectY, gridX, gridY);
    } 
    
    if(gridSymbol[i] == 0){  
      int rectX = gridSections[i][0];
      int rectY = gridSections[i][1];
      image(hawk, rectX + 128, rectY + 96);       
      }
      
    if (gridSymbol[i] == 1) {
      int rectX = gridSections[i][0];
      int rectY = gridSections[i][1];
        image(skull, rectX + 128, rectY + 96);       
      }
      
      if (gridSymbol[i] == 2) {
        int rectX = gridSections[i][0];
        int rectY = gridSections[i][1];
        image(bomb, rectX + 128, rectY + 96);
      }
    }
  
 




  //draw the blobs if they are bigger than 500
  //blobCounter = 0;
  for(Blob b : blobs){
    b.show();
    blobCounter++;
    if(blobCounter > 3){
      blobCounter = 3;
    }
  }



  //for each blob that exists, let's check it against the grid for the intro    
  for (Blob b : blobs) {


    //loop through the grid spaces to determine if the blobs are in the grid sections
    //and set the relative boolean array to TRUE or FALSE accordingly
    for (int i  = 0; i < gridSections.length; i++) {
      if(b.id == 0){
      if (b.centerOfBlobX > gridSections[i][0] && b.centerOfBlobX < (gridSections[i][0] + gridX) && b.centerOfBlobY > gridSections[i][1] && b.centerOfBlobY < (gridSections[i][1] + gridY)) {
        gridRectOccupied[i][0] = true;
        }       else {
        gridRectOccupied[i][0] = false;
       
      }
      }
      if(b.id == 1){
        if (b.centerOfBlobX > gridSections[i][0] && b.centerOfBlobX < (gridSections[i][0] + gridX) && b.centerOfBlobY > gridSections[i][1] && b.centerOfBlobY < (gridSections[i][1] + gridY)) {
        gridRectOccupied[i][1] = true;
        }       else {
        gridRectOccupied[i][1] = false;
      } 
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
        }      else {
        gridRectOccupied[i][3] = false;
      } //
      }
      //******* uncomment this section to play the game *********

      //**************
      for(int j = 0; j < gridRectOccupied[i].length; j++){
        if(gridRectOccupied[i][j]){
          currentRectOccupied[i] = true;
          j = gridRectOccupied[i].length;
          
        } //else {
        //  currentRectOccupied[i] = false;
        //}
      
      }
     
      //println("Section " + i + "= " + rectOccupiedTimer[i] + gridRectOccupied[i][0] + " " + gridRectOccupied[i][1] + " " + gridRectOccupied[i][2] + " " + gridRectOccupied[i][3] + " " + currentRectOccupied[i]);
      
    }
    //text(rectOccupiedTimer, width/2, height/2);
    
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
              rectOccupiedTimer[i] = 100;
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
  for(Blob b : blobs){
    b.show();
    blobCounter++;
    if(blobCounter > 3){
      blobCounter = 3;
    }
  }
  //for (int i = currentBlobs.size(); i >= 0; i--) {
  //  if (currentBlobs.get(i).size() > 500) {
  //    currentBlobs.remove(i);
  //    //blobCounter++;
  //  }
  //}
  
  //if(blobs.isEmpty()){
  //  for (Blob b : currentBlobs){
  //    b.id = blobCounter;
  //    blobs.add(b);
  //    blobCounter++;
  //  }
  //} else if(blobs.size() == currentBlobs.size()){
  //  for(Blob b : blobs){
  //    for(Blob cb : currentBlobs){
  //      }
  //  }
  //}
  
  //if(currentBlobs.size() > blobs.size()){
  
  
  //}
  
  if(helpCounter > 50 && helpCounter < 100){
    fill(0,255,255, alphaCounter);
    text("STAND ON THE SYMBOL YOU RECOGNIZE\nTO ACTIVATE THE INPUT SEQUENCE", width/2, height/2);
  }
  
    if (alphaUp) {
    alphaCounter+=5;
    if (alphaCounter >= 255) {
      alphaUp =  false;
    }
  } else {
    alphaCounter-=5;
    if (alphaCounter <= 0) {
      alphaUp = true;
    }
  }

  //if all four players are in place for ten seconds in the designated pattern then trigger to move out of the intro and into level one
  if (rectOneGood && rectTwoGood && rectThreeGood && rectFourGood) {

    chime.trigger();
    delay(200);

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
    
    goodJobTeam.play();
    
    floorGridPracticeScreen = false;
    floorGridStartScreen = true;
  }

  textSize(32);
  fill(255);
  textAlign(CENTER);
  //text("MOVE YOUR CIRCLE INTO THE DESIGNATED SPACES\nTO BEGIN FLOOR GRID CHALLENGE", width/2, height/2);

  if (keyPressed) {
    

    if (key == 'q') {
      floorGridPracticeScreen = false;
      floorGridStartScreen = true;
      
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
      
      goodJobTeam.play();
    }
  }
  println("FLOOR GRID PRACTICE SCREEN");
  println("Press Q to move to LEVEL 1");
}

void clearGridSymbolArray(){
  for(int i = 0; i < gridSymbol.length; i ++){
    gridSymbol[i] = 4;
    currentRectOccupied[i] = false;
    for(int j = 0; j < gridRectOccupied[i].length; j++){
      gridRectOccupied[i][j] = false;
    }
  }
    hawkCounter = 0;
    skullCounter = 0;
    bombCounter = 0;
    eagleCounter = 0;
    patternSet = false;
}