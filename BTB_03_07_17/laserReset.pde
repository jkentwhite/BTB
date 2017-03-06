
void laserReset(){
  background(0);
  textSize(24);
  text("Your team has made 10 errors. \nReturn to safety behind the \ngreen laser on the floor as the system resets.", width/2, height/3);
  
  
  if(keyPressed){
    if(key == 'r' || key == 'R'){
      laserReset = false;
      hitLaserCounter = 0;
      if(laserLevel1){
        laserLevel1();
      }
      if(laserLevel2){
        laserLevel2();
      }
     
    }
  }
  println("Press R to return to laser level, once all players have moved to reset positions");
  //laserResetCounter--;
  
  //if(laserResetCounter <= 0){
   
  //  if(laserLevel1){
  //    laserLevel1();
  //  }
  //  if(laserLevel2){
  //    laserLevel2();
  //  }
  //  hitLaserCounter = 0;
  //}
  

}