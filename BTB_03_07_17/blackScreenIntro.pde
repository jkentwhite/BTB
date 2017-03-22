int introCounter = 1200;


void blackScreenIntro () {


if (!audioComplete) {
  background(0);
  fill(0,0,255, alphaCounter);
  rect(0,0, width, height);
  
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
} else {
  background(0);
  fill(255);
  textSize(24);
  textAlign(CENTER);
  background(0);
  //draw the grid
  for (int i = 0; i < 16; i++) {
    rectMode(CORNER);
    noFill();
    stroke(255, 105, 180);
    rect(gridSections[i][0], gridSections[i][1], gridX, gridY);
    imageMode(CENTER);
    image(eagle, width/2, height/2);
    text("TRAINING STAGE :\nUse the following symbol to train yourself on the use of HUMAN KEYPAD.", width/2, height/4);
  }
}


  //override for triggering the laserScreen() by pressing the X   
  if (keyPressed) {
    if (key == ' ') {

      blackScreenIntro = false;
      floorGridPracticeScreen = true;
      //laserPuzzle = true;

      floorGridInstr.stop();
    }

    if (key == 'n' || key == 'N') {
      audioComplete = true;
    }
  }

  //console feedback to make sure that the experience is running and ready to trigger lasers
  println("FLOOR GRID INSTRUCTION SCREEN");
  println("Press N to show practice symbol after instuctions are complete");
  println("Press SPACE to go to Practice Screen");
  //println(floorGridInstr.isPlaying());
}