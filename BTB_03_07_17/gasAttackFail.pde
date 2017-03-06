void gasAttackFail(){
  background(255,0,0);
  fill(0);
  text("Your team has failed to shut down the pumps, \nbut you've been saved by a system malfunction. \nYou don't have much time before the gas kicks in again. \nQuickly, locate the MAIN SERVERS within the network!", width/2, height/3);

  if(keyPressed){
    if(key == 'x' || key == 'X'){
      gasAttackFail = false;
      rollerBall = true;
      
      rollerBallInstr.play();
    }
  }
  println("GAS ATTACK FAIL SCREEN");
  println("Press X to move to rollerBallScreen");

}