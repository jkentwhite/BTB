
int irLaserBreak = 0;

  

void laserIntro () {
  
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
  
  //background(0);
  //fill(0,255,0);
  //textAlign(CENTER);
  //textSize(24);
  //text("Defense Mechanism 1: Laser Field\nObjective: Get your entire team across the laser maze.\nAnd then get them all back.\n\nUse the buttons on the tablets to control the laser configuration. \nHit no more than 20 lasers. \nFailure will cost precious time, delay your access to the Bomb, \nand increase the likelihood of detonation.", width/2, height/4);

  


  //start the experience by pressing the spacebar   
  if (keyPressed) {
    if (key == ' ') {
      laserIntro = false;
      laserLevel1 = true;
      laserInstr.stop();
      //laserPuzzle = true;
    }
    
    
    
  }


  //console feedback to make sure that the experience is running and ready to trigger lasers
  println("LASER INSTRUCTION SCREEN");
  //println(mouseY); 
  println("Press SPACEBAR to move to Level1 Lasers");
}