void bombChamber(){
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
  println("BOMB CHAMBER INSTRUCTION SCREEN");
  println("This is the end of the sketch, refer to cheat sheet or stop and start over");
}