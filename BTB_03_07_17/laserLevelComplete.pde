void laserLevelComplete(){

      textSize(24);
      background(0,255,0);
      fill(0);
      text("Way to go! Now prepare for Level 2!", width/2, height/3);
      
      if(keyPressed){
        if(key == '2'){
          laserLevelComplete = false;
          laserLevel2 = true;
        }
        }
        println("LASER LEVEL ONE SUCCESS");
        println("Press 2 to move to level 2");
  }