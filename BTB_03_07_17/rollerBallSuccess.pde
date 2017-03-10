void rollerBallSuccess(){
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
   if(key == ' '){
          rollerBallSuccess = false;
          blackScreenIntro = true;          
          floorGridInstr.play();
        }
  }
  println("ROLLER BALL SUCCESS SCREEN");
  println("Press SPACEBAR to move to FloorGrid Intro");
}