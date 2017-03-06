void blackScreen(){
  background(0);
  
  if(keyPressed){
    if(key == 's' || key == 'S'){
      introIntro = false;
      laserIntro = true;
      
      laserInstr.play();
    }
  }
  println("BLACK SCREEN INTRO");
  println("Press S to move to Laser Intro");
}