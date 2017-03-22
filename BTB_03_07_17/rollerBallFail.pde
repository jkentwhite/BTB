void rollerBallFail(){
     
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
   if(key == ' '){
          //rollerBallFail = false;
          blackScreenIntro = true;          
          floorGridInstr.play();
        }
  }
  
  println("ROLLER BALL FAIL SCREEN");
  println("Press SPACEBAR to move to FloorGrid Intro");
}