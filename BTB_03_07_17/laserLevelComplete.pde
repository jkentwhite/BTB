void laserLevelComplete(){

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
  
      //textSize(24);
      //background(0,255,0);
      //fill(0);
      //text("Way to go! Now prepare for Level 2!", width/2, height/3);
      
      if(keyPressed){
        if(key == 't' || key == 'T'){
          laserLevelComplete = false;
          laserLevel2 = true;
          laserReturnInstr.stop();
         }
        }
        println("LASER LEVEL ONE SUCCESS");
        println("Press T to move to level 2");
  }