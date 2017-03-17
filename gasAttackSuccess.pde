void gasAttackSuccess(){
  //fill(0,255,0);
  //text("Your team has shut down the pumps! \nQuickly, locate the MAIN SERVERS within the network to access the mainframe!", width/2, height/3);

  background(0);
  fill(0,255,0, alphaCounter);
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
      gasAttackSuccess = false;
      blackScreenIntro = true;
      
      excellentWork.stop();
      floorGridInstr.play();
    }
  }
  println("GAS ATTACK SUCCESS SCREEN");
  println("Press X to move to FloorGrid Screen");
  
}