void blackScreen(){
  background(0);
        
        
  arduino.digitalWrite(laser1, Arduino.HIGH);
  arduino.digitalWrite(laser2, Arduino.HIGH);
  arduino.digitalWrite(laser3, Arduino.HIGH);
  arduino.digitalWrite(laser4, Arduino.HIGH);
  arduino.digitalWrite(laser5, Arduino.HIGH);
  arduino.digitalWrite(laser6, Arduino.HIGH);
  arduino.digitalWrite(laser7, Arduino.HIGH);
  arduino.digitalWrite(laser8, Arduino.HIGH);
  arduino.digitalWrite(laser9, Arduino.HIGH);
  arduino.digitalWrite(laser10, Arduino.HIGH);
  arduino.digitalWrite(laser11, Arduino.HIGH);
  arduino.digitalWrite(laser12, Arduino.HIGH);
  arduino.digitalWrite(laser13, Arduino.HIGH);
  arduino.digitalWrite(laser14, Arduino.HIGH);
  arduino.digitalWrite(laser15, Arduino.HIGH);

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