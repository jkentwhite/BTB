int laserCounter = 150;

void laserFail(){
  
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
  
  
  //textSize(24);
  //background(255,0,0);
  //fill(0);
  //text("Your team has failed to cross the LASER FIELD! \nSTANDBY for further instructions!", width/2, height/3);
  
  laserCounter--;
  // laser1: OFF
      arduino.digitalWrite(laser1, Arduino.LOW);
      readLaser1 = "OFF";
      // laser2: OFF
      arduino.digitalWrite(laser2, Arduino.LOW);
      readLaser2 = "OFF";
      // laser3: OFF
      arduino.digitalWrite(laser3, Arduino.LOW);
      readLaser3 = "OFF";
      // laser4: OFF
      arduino.digitalWrite(laser4, Arduino.LOW);    
      readLaser4 = "OFF";
      // laser5: OFF
      arduino.digitalWrite(laser5, Arduino.LOW);
      readLaser5 = "OFF";
      // laser6: OFF
      arduino.digitalWrite(laser6, Arduino.LOW);
      readLaser6 = "OFF";
      // laser7: OFF
      arduino.digitalWrite(laser7, Arduino.LOW);
      readLaser7 = "OFF";
      // laser8: OFF
      arduino.digitalWrite(laser8, Arduino.LOW);
      readLaser8 = "OFF";
      // laser9: OFF
      arduino.digitalWrite(laser9, Arduino.LOW);
      readLaser9 = "OFF";
      // laser10: OFF
      arduino.digitalWrite(laser10, Arduino.LOW);
      readLaser10 = "OFF";
      // laser11: OFF
      arduino.digitalWrite(laser11, Arduino.LOW);
      readLaser11 = "OFF";
      // laser12: OFF
      arduino.digitalWrite(laser12, Arduino.LOW);
      readLaser12 = "OFF";
      // laser13: OFF
      arduino.digitalWrite(laser13, Arduino.LOW);
      readLaser13 = "OFF";
      // laser14: OFF
      arduino.digitalWrite(laser14, Arduino.LOW);
      readLaser14 = "OFF";
      // laser15: OFF
      arduino.digitalWrite(laser15, Arduino.LOW);
      readLaser15 = "OFF";
  
  //if(laserCounter <= 0){
  //  laserLevel1 = false;
  //  laserLevel2 = false;
  //  laserDeactivatedScreen = true;
  //}
  if(keyPressed){
    if(key == 'v' || key ==- 'V'){
      laserFail = false;
      laserDeactivatedScreen = true;
      //laserDeactivatedScreen = true;
      
      attentionYouHaveFailed.stop();
      gasAttackInstr.play();

    }
  }
  println("LASER FAIL SCREEN");
  println("Press V to move to Gas Attack");
}