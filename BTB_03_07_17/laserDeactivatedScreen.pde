

void laserDeactivatedScreen() {

    //background(0);
  
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
  
  //tell the players that they have completed the laser challenge and to prepare for the floorgrid challenge
  //textAlign(CENTER);
  //fill(0);
  //text("Defense Mechanism 2: Gas Attack\nUse the tablets to hack into the system and shut down the pumps \nbefore the levels of POISON GAS become lethal.", width/2, height/3);

  //as each frame passes reduce the countdownFive variable to create a statuc screen for 5 seconds or so
  //countdownFive--;
  //delay(100);

  //once the countdownFive has reached zero, move to the floorgrid instruction screen and reset the countdown 
  //if (countdownFive==0) {
  //  laserDeactivatedScreen = false;
  //  floorGridInstScreen = true;
  //  countdownFive = 50;
  //}

  //override the countdown to move to the floorgrid instruction screen
  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      laserDeactivatedScreen = false;
      gasAttackFail = true;
      countdownFive = 50;
      
      gasAttackInstr.stop();
      attentionYouHaveFailed.play();
    }
    if(key == 'z' || key == 'Z'){
      laserDeactivatedScreen = false;
      gasAttackSuccess = true;
      countdownFive = 50;
      
      gasAttackInstr.stop();
      excellentWork.play();
    }
  }
  println("GAS ATTACK SCREEN");
  println("Press C to move to FailScreen");
  println("Press Z to move to SuccessScreen");
}