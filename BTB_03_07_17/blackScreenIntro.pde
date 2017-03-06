int introCounter = 1200;


void blackScreenIntro () {

  
  background(0);
  fill(255);
  textSize(18);
  textAlign(CENTER);
  background(0);
   //draw the grid
  for (int i = 0; i < 16; i++) {
    rectMode(CORNER);
    noFill();
    stroke(255, 105, 180);
    rect(gridSections[i][0], gridSections[i][1], gridX, gridY);
    
    
    
    //if(gridProgress[i]){
    //  image(greenLock, gridSections[i][0], gridSections[i][1]);
    //} else {
    //  tint(255,100);
    //  image(redLock, gridSections[i][0], gridSections[i][1]);
    //}
  }
  if(!audioComplete){
  text("Defense Mechanism 4: Human Keypad\nThe final defense mechanism inside the mainframe is PATTERN LOCK \nthat can only receive input through the HUMAN KEYPAD. \nUse the grid on the floor as a keypad to input the sequence of patterns for each stage of the PATTERN LOCK. \nMove your physical position around and stand on the proper symbol. \nOnce all players are in the correct spaces, the pattern will be verified \nand then you will be provided with a new pattern. \n\nThere are five patterns per stage in PATTERN LOCK and four stages to override the system and disable the device.", width/2, height/3);
  } else {
    imageMode(CENTER);
    image(eagle, width/2, height/2);
    text("TRAINING STAGE :\nUse the following symbol to train yourself on the use of HUMAN KEYPAD.", width/2, height/4);

  }
  
   if(floorGridInstr.isPlaying() == 0){
      audioComplete = true;
  }
  //introCounter--;
  //if(introCounter <= 0){
  ////floorGridProgressScreen();
  //blackScreenIntro = false;
  //floorGridPracticeScreen = true;
  //}

  //check to see if the infrared sensor has been broken and if so, trigger the laserScreen()    
  //if(laserStatus >= 1){
  //  //irLaserBreak++;
  //  //}

  //if(irLaserBreak >= 1){
  //    blackScreenIntro = false;
  //    laserScreen = true;    
  //}

  //override for triggering the laserScreen() by pressing the spacebar   
  if (keyPressed) {
    if (key == 'x' || key == 'X') {

      blackScreenIntro = false;
      floorGridPracticeScreen = true;
      //laserPuzzle = true;
      
      floorGridInstr.stop();
    }
    
    if(key == 'n' || key == 'N'){
      audioComplete = true;
    }
  }

  //console feedback to make sure that the experience is running and ready to trigger lasers
  println("FLOOR GRID INSTRUCTION SCREEN");
  println("Press N to show practice symbol");
  println("Press X to go to Practice Screen");
  //println(floorGridInstr.isPlaying());
}