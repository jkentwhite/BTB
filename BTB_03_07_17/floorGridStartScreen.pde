void floorGridStartScreen() {

  //clear the screen
  background(0);

  //draw grid
  for (int i = 0; i < 16; i++) {
    rectMode(CORNER);
    noFill();
    stroke(255, 105, 180);
    rect(gridSections[i][0], gridSections[i][1], gridX, gridY);
  }

  textSize(64);
  fill(255);
  if (!levelOnePlayed) {
    text("WAY TO GO! \nNOW LOOK FOR THIS SYMBOL:", width/2, height/4);
    image(hawk, width/2, height/2+100);
  } else if (!levelTwoPlayed) {
    text("WAY TO GO! \nNOW LOOK FOR THIS SYMBOL:", width/2, height/4);
    image(bomb, width/2, height/2+100);  
  } else if (!levelThreePlayed) {
    text("WAY TO GO! \nNOW LOOK FOR THIS SYMBOL:", width/2, height/4);
    image(skull, width/2, height/2+100);
  } else {
    text("WAY TO GO! \nNOW LOOK FOR THIS SYMBOL:", width/2, height/4);
    image(eagle, width/2, height/2+50);
    text("AVOID THE RED BURST!", width/2, height/5*4);
  }
  
  



  textSize(64);
  fill(255);
  //text(countdownFive/10, width/2, height/2);
  //countdownFive--;
  //delay(100);
  //if (countdownFive==0) {
  //  floorGridStartScreen = false;
  //  if (!levelOnePlayed) {
  //    floorGridSymbolsLevelOne = true;
  //  } else if (!levelTwoPlayed) {
  //    //patternCounter = 0;
  //    floorGridSymbolsLevelTwo = true;
  //  } else if (!levelThreePlayed) {
  //    //patternCounter = 0;
  //    floorGridSymbolsLevelThree = true;
  //  } else {
  //    //patternCounter = 0;
  //    floorGridSymbolsLevelFour = true;
  //  }
  //}
  if(keyPressed){
    if(key == ' '){
      floorGridStartScreen = false;
    if (!levelOnePlayed) {
      floorGridSymbolsLevelOne = true;
    } else if (!levelTwoPlayed) {
      //patternCounter = 0;
      floorGridSymbolsLevelTwo = true;
    } else if (!levelThreePlayed) {
      //patternCounter = 0;
      floorGridSymbolsLevelThree = true;
    } else {
      //patternCounter = 0;
      floorGridSymbolsLevelFour = true;
    }
    }
  }
  println("FLOOR GRID SYMBOL SCREEN");
  println("Press SPACEBAR to move to next level of Floorgrid");
}