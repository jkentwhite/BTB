void gasAttackFail(){
  //background(255,0,0);
  //fill(0);
  //text("Your team has failed to shut down the pumps, \nbut you've been saved by a system malfunction. \nYou don't have much time before the gas kicks in again. \nQuickly, locate the MAIN SERVERS within the network!", width/2, height/3);


  background(0);
  fill(255,0,0, alphaCounter);
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
  
  if(keyPressed){
    if(key == 'x' || key == 'X'){
      gasAttackFail = false;
      rollerBall = true;
      attentionYouHaveFailed.stop();
      rollerBallInstr.play();
    }
  }
  println("GAS ATTACK FAIL SCREEN");
  println("Press X to move to rollerBallScreen");

}