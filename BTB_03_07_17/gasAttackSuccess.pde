void gasAttackSuccess(){
  fill(0,255,0);
  text("Your team has shut down the pumps! \nQuickly, locate the MAIN SERVERS within the network to access the mainframe!", width/2, height/3);

  if(keyPressed){
    if(key == 'x' || key == 'X'){
      gasAttackSuccess = false;
      rollerBall = true;
      
      rollerBallInstr.play();
    }
  }
  println("GAS ATTACK SUCCESS SCREEN");
  println("Press X to move to rollerBallScreen");
  
}