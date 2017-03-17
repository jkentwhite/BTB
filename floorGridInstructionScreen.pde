 
void floorGridInstScreen() {

  background(0);

  //draw grid
  for (int i = 0; i < 16; i++) {
    rectMode(CORNER);
    noFill();
    stroke(255, 105, 180);
    rect(gridSections[i][0], gridSections[i][1], gridX, gridY);
  }

  //provide instructions
  textSize(18);
  fill(255);
  textAlign(CENTER);
  text("Defense Mechanism 4: Human Keypad\nThe final defense mechanism inside the mainframe is PATTERN LOCK that can only receive input through the HUMAN KEYPAD. \nUse the grid on the floor as a keypad to input the sequence of patterns for each stage of the PATTERN LOCK. \nMove your physical position around and stand on the proper symbol.", width/2, height/4);
  text("Once all players are in the correct spaces, \nthe pattern will be verified and then you will be provided with a new pattern. \nThere are five patterns per stage in PATTERN LOCK and four stages to override the system and disable the device. ", width/2, height/2);
  //text("Press space to start", width/4*3, height/3 * 2);


  //countdown to move from instructions to start screen
  //countdownFive--;
  //delay(100);
  //if (countdownFive==0) {
  //  floorGridInstScreen = false;
  //  floorGridPracticeScreen = true;
  //  countdownFive = 50;
  //}
  if(keyPressed){
    if(key == 'z' || key == 'Z'){
      floorGridInstScreen = false;
      floorGridPracticeScreen = true;
    }
  }
  println("FLOOR GRID INSTRUCTION SCREEN");
  println("Press Z to move to FloorGrid Parctice Screen");
}