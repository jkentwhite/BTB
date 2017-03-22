//Level 2 of Laser Field
 //players have to use 4 randomized buttons to get all players across the lasers for a second time
 
 //The default state will be gateState = 4;
 
 //KEY to Lasers: 
 //A: 0, 14, 12
 //B: 1, 2, 3
 //C: 4, 5, 11
 //D: 6, 7, 8
 //E: 9, 10, 13
 
 //The console log will tell you which gateState we are in

int [] [] activeReceptorsGS3 = {

  { }, //0
  {0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 14}, //1 **
  {0, 2, 3, 4,  5, 8, 10, 11, 12, 13, 14}, //2
  {0, 1, 3, 4, 5, 8, 10, 11, 12, 13, 14}, //3
  {0, 1, 2, 3, 4, 5, 8, 10, 11, 12, 13,14}, //4
  {0, 1, 2, 3, 4, 5, 8, 10, 11, 12, 13,14}, //5
  {0, 1, 2, 3, 4, 8, 10, 11, 12, 13, 14}, //6
  {0, 1, 2, 3, 4, 5, 8, 10, 11, 12, 13, 14}, //7
  {0, 1, 2, 3, 4, 5, 8, 10, 11, 12, 13, 14}, //8
  {0, 1, 2, 3, 4, 5, 10, 11, 12, 13, 14}, //9
  {0, 1, 2, 3, 4, 5, 8, 10, 11,12, 13, 14}, //10
  {0, 1, 2, 3, 4, 5, 8, 11, 12, 13, 14}, //11
  {0, 1, 2, 3, 4, 5, 8, 10, 12, 13, 14}, //12
  {0, 1, 2, 3,4, 5, 8, 10, 11, 12, 13, 14},   //13
  {0, 1, 2, 3,4, 5, 8, 10, 11, 12, 13, 14},   //14
  {0, 1, 2, 3,4, 5, 8, 10, 11, 12, 13, 14},   //15
 
};

int [] [] activeReceptorsGS4 = {

  { }, //0
  {1, 2, 3, 4, 5, 6, 7, 8, 11, 12, 13}, //1
  {1, 2, 3, 4, 5, 6, 7, 8, 11, 12, 13}, //2 **
  {1, 3, 4, 5, 6, 7, 8, 11, 12, 13}, //3
  {1, 2, 4, 5, 6, 7, 8, 11, 12, 13}, //4
  {1, 2, 3, 5, 6, 7, 8, 11, 12, 13}, //5
  {1, 2, 3, 4, 6, 7, 8, 11, 12, 13}, //6
  {1, 2, 3, 4, 5, 7, 8, 11, 12, 13}, //7
  {1, 2, 3, 4, 5, 6, 8, 11, 12, 13}, //8
  {1, 2, 3, 4, 5, 6, 7, 11, 12, 13}, //9
  {1, 2, 3, 4, 6, 5, 7, 8, 11, 12, 13}, //10
  {1, 2, 3, 4, 5, 6, 7, 8, 11, 12, 13}, //11
  {1, 2, 3, 4, 5, 6, 7, 8, 12, 13}, //12
  {1, 2, 3, 4, 5, 6, 7, 8, 11, 13},   //13
  {1, 2, 3, 4, 5, 6, 7, 8, 11, 12},   //14
  {1, 2, 3, 4, 5, 6, 7, 8, 11, 12, 13},   //15
 
};

int [] [] activeReceptorsGS5 = {

  { }, //0
  {1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //1
  {0, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //2
  {2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14}, //3 **
  {0, 1, 2, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //4
  {0, 1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //5
  {0, 1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //6
  {0, 1, 2, 3, 7, 8, 9, 10, 11, 12, 13, 14}, //7
  {0, 1, 2, 3, 7, 6, 8, 9, 10, 11, 12, 13, 14}, //8
  {0, 1, 2, 3, 6, 7, 9, 10, 11, 12, 13, 14}, //9
  {0, 1, 2, 3, 6, 5, 7, 9, 8, 10, 11, 12, 13, 14}, //10
  {0, 1, 2, 3, 6, 7, 9, 8, 11, 12, 13, 14}, //11
  {0, 1, 2, 3, 6, 7, 9, 8, 10, 12, 13, 14}, //12
  {0, 1, 2, 3, 6, 7, 9, 8, 10, 11, 13, 14},   //13
  {0, 1, 2, 3, 6, 7, 9, 8, 10, 11, 12, 14},   //14
  {0, 1, 2, 3, 6, 7, 9, 8, 10, 11, 12, 13},   //15
 
};

int [] [] activeReceptorsGS6 = {

  { }, //0
  {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //1
  {0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //2
  {0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //3
  {1, 2, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //4 **
  {0, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //5
  {0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //6
  {0, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14}, //7
  {0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //8
  {0, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14}, //9
  {0, 3, 4, 5, 6, 7, 9, 8, 10, 11, 12, 13, 14}, //10
  {0, 3, 4, 5, 6, 7, 9, 8, 11, 12, 13, 14}, //11
  {0, 3, 4, 5, 6, 7, 9, 8, 10, 12, 13, 14}, //12
  {0, 3, 4, 5, 6, 7, 9, 8, 10, 11, 13, 14},   //13
  {0, 3, 4, 5, 6, 7, 9, 8, 10, 11, 12, 14},   //14
  {0, 3, 4, 5, 6, 7, 9, 8, 10, 11, 12, 13},   //15
 
};

boolean instructionsComplete = true;

void laserLevel2() {
 
   
  
  //text("You hit " + hitLaserCounter + " lasers", width/2, height/2);

  //background(0);

  if (keyPressed) {
    
    if(key == '`') {
      gateState = 0;
    }

    if(key == 'r' || key == 'R') {
      gateState = 4;
    }

    if (key == 'q' || key == 'Q') {
      gateState = 1;
    }
    if (key == 'w' || key == 'W') {
      gateState = 2;
    }
    if(key == 'e' || key == 'E') {
      gateState = 3;
    }
    
    //to remove instructions and display hit counter
    //if(key == '0'){
    //  instructionsComplete = true;
    //}
    
    //to move Level 2 to Failure of challenge
    if (key == ' ' || key == ' ') {
      gateState = 0; 
      delay(100);
      laserLevel2 = false;
      laserFail = true;
      laserCounter = 150;
      
      attentionYouHaveFailed.play();
    }
    
    //to move Level2 to Success
    if(key == 'c' || key == 'C'){
      gateState = 0;
      laserLevel2 = false;
      laserSuccess = true;
      laserCounter = 150;
      
      excellentWork.play();
    }
  } else {
    gateState = 5;
  }
  //println(gateState);
  println("LEVEL TWO");
  println("Press SPACEBAR to move to FailScreen");
  println("Press C to move to SuccessScreen");
  //println("Press 0 to remove instructions and display hit counter");

//TouchOSC version
if(v_push3 == 1.0f) {
  gateState = 1; 
} else if(v_push4 == 1.0f) {
  gateState = 2; 
} else if(v_push5 == 1.0f) {
  gateState = 3;
} else if(v_push6 == 1.0f) {
  gateState = 4;
} else {
  gateState = 5;
}


    //set the gateState to determine which receptors to read through the activeReceptors array
    if (gateState == 0) {

      // State 0 = All Lasers OFF
      
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
    }
    
      if (gateState == 5) {

  // State 5 = All Lasers ON
  
      // laser1: ON
      arduino.digitalWrite(laser1, Arduino.HIGH);
      readLaser1 = "ON";
      // laser2: ON
      arduino.digitalWrite(laser2, Arduino.HIGH);
      readLaser2 = "ON";
      // laser3: ON
      arduino.digitalWrite(laser3, Arduino.HIGH);
      readLaser3 = "ON";
      // laser4: ON
      arduino.digitalWrite(laser4, Arduino.HIGH);
      readLaser4 = "ON";
      // laser5: ON
      arduino.digitalWrite(laser5, Arduino.HIGH);
      readLaser5 = "ON";
      // laser6: ON
      arduino.digitalWrite(laser6, Arduino.HIGH);
      readLaser6 = "ON";
      // laser7: ON
      arduino.digitalWrite(laser7, Arduino.HIGH);
      readLaser7 = "ON";
      // laser8: ON
      arduino.digitalWrite(laser8, Arduino.HIGH);
      readLaser8 = "ON";
      // laser9: ON
      arduino.digitalWrite(laser9, Arduino.HIGH);
      readLaser9 = "ON";
      // laser10: ON
      arduino.digitalWrite(laser10, Arduino.HIGH);
      readLaser10 = "ON";
      // laser11: ON
      arduino.digitalWrite(laser11, Arduino.HIGH);
      readLaser11 = "ON";
      // laser12: ON
      arduino.digitalWrite(laser12, Arduino.HIGH);
      readLaser12 = "ON";
            // laser13: ON
      arduino.digitalWrite(laser13, Arduino.HIGH);
      readLaser13 = "ON";
      // laser14: ON
      arduino.digitalWrite(laser14, Arduino.HIGH);
      readLaser14 = "ON";
      // laser15: ON
      arduino.digitalWrite(laser15, Arduino.HIGH);
      readLaser15 = "ON";
      
      //delay to allow lasers to come back on after switching between buttons, without triggering
      delay(200); 
  }


    //set the gateState to determine which receptors to read through the activeReceptors array
    if (gateState == 1) {
      
      // Button 1 = A1, C2, E3  OFF
      
      //Column A
      // laser1: OFF
      arduino.digitalWrite(laser1, Arduino.LOW);
      readLaser1 = "OFF";
      // laser2: ON
      arduino.digitalWrite(laser2, Arduino.HIGH);
      readLaser2 = "ON";
      // laser3: ON
      arduino.digitalWrite(laser3, Arduino.HIGH);
      readLaser3 = "ON";
      
      //Column B
      // laser4: ON
      arduino.digitalWrite(laser4, Arduino.HIGH);
      readLaser4 = "ON";
      // laser5: ON
      arduino.digitalWrite(laser5, Arduino.HIGH);
      readLaser5 = "ON";
      // laser6: ON
      arduino.digitalWrite(laser6, Arduino.HIGH);
      readLaser6 = "ON";
      
      //Column C
      // laser7: ON
      arduino.digitalWrite(laser7, Arduino.HIGH);
      readLaser7 = "ON";
      // laser8: OFF
      arduino.digitalWrite(laser8, Arduino.LOW);
      readLaser8 = "OFF";
      // laser9: ON
      arduino.digitalWrite(laser9, Arduino.HIGH);
      readLaser9 = "ON";
      
      //Column D
      // laser10: ON
      arduino.digitalWrite(laser10, Arduino.HIGH);
      readLaser10 = "ON";
      // laser11: ON
      arduino.digitalWrite(laser11, Arduino.HIGH);
      readLaser11 = "ON";
      // laser12: ON
      arduino.digitalWrite(laser12, Arduino.HIGH);
      readLaser12 = "ON";
         
      
      //Column E
      // laser13: ON
      arduino.digitalWrite(laser13, Arduino.HIGH);
      readLaser13 = "ON";
      // laser14: ON
      arduino.digitalWrite(laser14, Arduino.HIGH);
      readLaser14 = "ON";
      // laser15: OFF
      arduino.digitalWrite(laser15, Arduino.LOW);
      readLaser15 = "OFF";
      
    }


    //set the gateState to determine which receptors to read through the activeReceptors array  
    if (gateState == 2) {

      // Button 2 = A2, E2 OFF
      
      //Column A
      // laser1: ON
      arduino.digitalWrite(laser1, Arduino.HIGH);
      readLaser1 = "ON";
      // laser2: OFF
      arduino.digitalWrite(laser2, Arduino.LOW);
      readLaser2 = "OFF";
      // laser3: ON
      arduino.digitalWrite(laser3, Arduino.HIGH);
      readLaser3 = "ON";
      
      //Column B
      // laser4: ON
      arduino.digitalWrite(laser4, Arduino.HIGH);
      readLaser4 = "ON";
      // laser5: ON
      arduino.digitalWrite(laser5, Arduino.HIGH);
      readLaser5 = "ON";
      // laser6: ON
      arduino.digitalWrite(laser6, Arduino.HIGH);
      readLaser6 = "ON";
      
      //Column C
      // laser7: ON
      arduino.digitalWrite(laser7, Arduino.HIGH);
      readLaser7 = "ON";
      // laser8: ON
      arduino.digitalWrite(laser8, Arduino.HIGH);
      readLaser8 = "ON";
      // laser9: ON
      arduino.digitalWrite(laser9, Arduino.HIGH);
      readLaser9 = "ON";
      
      //Column D
      // laser10: ON
      arduino.digitalWrite(laser10, Arduino.HIGH);
      readLaser10 = "ON";
      // laser11: ON
      arduino.digitalWrite(laser11, Arduino.HIGH);
      readLaser11 = "ON";
      // laser12: ON
      arduino.digitalWrite(laser12, Arduino.HIGH);
      readLaser12 = "ON";
      
      //Column E
      // laser13: ON
      arduino.digitalWrite(laser13, Arduino.HIGH);
      readLaser13 = "ON";
      // laser14: OFF
      arduino.digitalWrite(laser14, Arduino.LOW);
      readLaser14 = "OFF";
      // laser15: ON
      arduino.digitalWrite(laser15, Arduino.HIGH);
      readLaser15 = "ON";
    }


    if (gateState == 3) {

      // Button 3 = B1 & D2  OFF
      
      //Column A
      // laser1: ON
      arduino.digitalWrite(laser1, Arduino.HIGH);
      readLaser1 = "ON";
      // laser2: ON
      arduino.digitalWrite(laser2, Arduino.HIGH);
      readLaser2 = "ON";
      // laser3: ON
      arduino.digitalWrite(laser3, Arduino.LOW);
      readLaser3 = "ON";
      
      //Column B
      // laser4: OFF
      arduino.digitalWrite(laser4, Arduino.LOW);
      readLaser4 = "OFF";
      // laser5: ON
      arduino.digitalWrite(laser5, Arduino.HIGH);
      readLaser5 = "ON";
      // laser6: ON
      arduino.digitalWrite(laser6, Arduino.HIGH);
      readLaser6 = "ON";
      
      //Column C
      // laser7: ON
      arduino.digitalWrite(laser7, Arduino.HIGH);
      readLaser7 = "ON";
      // laser8: ON
      arduino.digitalWrite(laser8, Arduino.HIGH);
      readLaser8 = "ON";
      // laser9: ON
      arduino.digitalWrite(laser9, Arduino.HIGH);
      readLaser9 = "ON";
      
      //Column D
      // laser10: ON
      arduino.digitalWrite(laser10, Arduino.HIGH);
      readLaser10 = "ON";
      // laser11: OFF
      arduino.digitalWrite(laser11, Arduino.LOW);
      readLaser11 = "OFF";
      // laser12: ON
      arduino.digitalWrite(laser12, Arduino.HIGH);
      readLaser12 = "ON";
         
      
      //Column E
      // laser13: ON
      arduino.digitalWrite(laser13, Arduino.HIGH);
      readLaser13 = "ON";
      // laser14: ON
      arduino.digitalWrite(laser14, Arduino.HIGH);
      readLaser14 = "ON";
      // laser15: ON
      arduino.digitalWrite(laser15, Arduino.HIGH);
      readLaser15 = "ON";
    }

   if (gateState == 4) {

      // Button 4 = A3, B3, C3  OFF
      
      //Column A
      // laser1: ON
      arduino.digitalWrite(laser1, Arduino.HIGH);
      readLaser1 = "ON";
      // laser2: ON
      arduino.digitalWrite(laser2, Arduino.HIGH);
      readLaser2 = "ON";
      // laser3: OFF
      arduino.digitalWrite(laser3, Arduino.LOW);
      readLaser3 = "OFF";
      
      //Column B
      // laser4: ON
      arduino.digitalWrite(laser4, Arduino.HIGH);
      readLaser4 = "ON";
      // laser5: ON
      arduino.digitalWrite(laser5, Arduino.HIGH);
      readLaser5 = "ON";
      // laser6: OFF
      arduino.digitalWrite(laser6, Arduino.LOW);
      readLaser6 = "OFF";
      
      //Column C
      // laser7: ON
      arduino.digitalWrite(laser7, Arduino.HIGH);
      readLaser7 = "ON";
      // laser8: ON
      arduino.digitalWrite(laser8, Arduino.HIGH);
      readLaser8 = "ON";
      // laser9: OFF
      arduino.digitalWrite(laser9, Arduino.LOW);
      readLaser9 = "OFF";
      
      //Column D
      // laser10: ON
      arduino.digitalWrite(laser10, Arduino.HIGH);
      readLaser10 = "ON";
      // laser11: ON
      arduino.digitalWrite(laser11, Arduino.HIGH);
      readLaser11 = "ON";
      // laser12: ON
      arduino.digitalWrite(laser12, Arduino.HIGH);
      readLaser12 = "ON";
      
      //Column E
      // laser13: ON
      arduino.digitalWrite(laser13, Arduino.HIGH);
      readLaser13 = "ON";
      // laser14: ON
      arduino.digitalWrite(laser14, Arduino.HIGH);
      readLaser14 = "ON";
      // laser15: ON
      arduino.digitalWrite(laser15, Arduino.HIGH);
      readLaser15 = "ON";
      
    }
 
  

  //// if the RFID tasks have not been completed
  
  //******  comment from here down to the next row of asterisks to stop checking sensors for tripped lasers  *********  

     //when button 1 is pressed, read through the active lasers to determine if a player is tripping a laser
   //activeReceptorsGS3 array does not include lasers 
   
    if (gateState == 1) {
      for (int i = 0; i < activeReceptorsGS3[gateState].length; i++) {
      laserStatus = arduino.analogRead(activeReceptorsGS3[gateState][i]);

      //if the laserStatus(i.e. amount of light hitting the receptor from the laser) is less lightReceptorThreshold then make that receptor boolean true
      //meaning it has been interrupted
      if (laserStatus < lightReceptorThreshold) {
        //println ("below threshold"); 
        //set the boolean true for the current laser being tripped
        lasers[(activeReceptorsGS3[gateState][i])] = true;

        //store the current laser for comparison to eliminate multiple triggers for the same laser being tripped at once
        currentLaser = (activeReceptorsGS3[gateState][i]);

        
        //console print out which laser is being tripped
        //println("laser " + i + "being trippped");
        //println("Number of lasers tripped = " + hitLaserCounter);
        
      } else {
        //if the receptor/laser is not being triggered set the boolean for that laser to FALSE
        lasers[(activeReceptorsGS3[gateState][i])] = false;
      }

      //check the array of booleans for all lasers/receptor and if it is TRUE and has not been counted yet, then add one to the hitLaserCounter and the oneHitCounter 
      if (lasers[currentLaser] && oneHitCounter < 1) {
        hitLaserCounter++;
        oneHitCounter++;
        buzzer2.trigger();
      }

      //if the current laser is not being triggered anymore, i.e. FALSE, and the oneHitCounter has been counted then reset the oneHitCounter
      if (!lasers[currentLaser] && oneHitCounter > 0) {
        oneHitCounter = 0;
      }
     }
    } else if (gateState == 2) {
 
   
   //when button 2 is pressed, read through the active lasers to determine if a player is tripping a laser
   //activeReceptorsGS4 array does not include lasers     
      
    for (int i = 0; i < activeReceptorsGS4[gateState].length; i++) {
      laserStatus = arduino.analogRead(activeReceptorsGS4[gateState][i]);

      //if the laserStatus(i.e. amount of light hitting the receptor from the laser) is less lightReceptorThreshold then make that receptor boolean true
      //meaning it has been interrupted
      if (laserStatus < lightReceptorThreshold) {
        //println ("below threshold"); 
        //set the boolean true for the current laser being tripped
        lasers[(activeReceptorsGS4[gateState][i])] = true;

        //store the current laser for comparison to eliminate multiple triggers for the same laser being tripped at once
        currentLaser = (activeReceptorsGS4[gateState][i]);

        
        //console print out which laser is being tripped
        //println("laser " + i + "being trippped");
        //println("Number of lasers tripped = " + hitLaserCounter);
        
      } else {
        //if the receptor/laser is not being triggered set the boolean for that laser to FALSE
        lasers[(activeReceptorsGS4[gateState][i])] = false;
      }

      //check the array of booleans for all lasers/receptor and if it is TRUE and has not been counted yet, then add one to the hitLaserCounter and the oneHitCounter 
      if (lasers[currentLaser] && oneHitCounter < 1) {
        hitLaserCounter++;
        oneHitCounter++;
        buzzer2.trigger();
        hitLaser = true;
        //println (hitLaser + " "); 
      }

      //if the current laser is not being triggered anymore, i.e. FALSE, and the oneHitCounter has been counted then reset the oneHitCounter
      if (!lasers[currentLaser] && oneHitCounter > 0) {
        oneHitCounter = 0;
        //delay to allow lasers to reset, so turning them off doesn't count as a trip
      
      }
    }
   } else if (gateState == 3) {
 
   
   //when button 3 is pressed, read through the active lasers to determine if a player is tripping a laser
   //activeReceptorsGS5 array does not include lasers    
      
    for (int i = 0; i < activeReceptorsGS5[gateState].length; i++) {
      laserStatus = arduino.analogRead(activeReceptorsGS5[gateState][i]);

      //if the laserStatus(i.e. amount of light hitting the receptor from the laser) is less lightReceptorThreshold then make that receptor boolean true
      //meaning it has been interrupted
      if (laserStatus < lightReceptorThreshold) {
        //println ("below threshold"); 
        //set the boolean true for the current laser being tripped
        lasers[(activeReceptorsGS5[gateState][i])] = true;

        //store the current laser for comparison to eliminate multiple triggers for the same laser being tripped at once
        currentLaser = (activeReceptorsGS5[gateState][i]);

        
        //console print out which laser is being tripped
        println("laser " + i + "being trippped");
        println("Number of lasers tripped = " + hitLaserCounter);
        
      } else {
        //if the receptor/laser is not being triggered set the boolean for that laser to FALSE
        lasers[(activeReceptorsGS5[gateState][i])] = false;
      }

      //check the array of booleans for all lasers/receptor and if it is TRUE and has not been counted yet, then add one to the hitLaserCounter and the oneHitCounter 
      if (lasers[currentLaser] && oneHitCounter < 1) {
        hitLaserCounter++;
        oneHitCounter++;
        buzzer2.trigger();
      }

      //if the current laser is not being triggered anymore, i.e. FALSE, and the oneHitCounter has been counted then reset the oneHitCounter
      if (!lasers[currentLaser] && oneHitCounter > 0) {
        oneHitCounter = 0;
        //delay to allow lasers to reset, so turning them off doesn't count as a trip 
      }
    }
   } else if (gateState == 4) {
 
   
   //when button 3 is pressed, read through the active lasers to determine if a player is tripping a laser
   //activeReceptorsGS5 array does not include lasers    
      
    for (int i = 0; i < activeReceptorsGS6[gateState].length; i++) {
      laserStatus = arduino.analogRead(activeReceptorsGS6[gateState][i]);

      //if the laserStatus(i.e. amount of light hitting the receptor from the laser) is less lightReceptorThreshold then make that receptor boolean true
      //meaning it has been interrupted
      if (laserStatus < lightReceptorThreshold) {
        //println ("below threshold"); 
        //set the boolean true for the current laser being tripped
        lasers[(activeReceptorsGS6[gateState][i])] = true;

        //store the current laser for comparison to eliminate multiple triggers for the same laser being tripped at once
        currentLaser = (activeReceptorsGS6[gateState][i]);

        
        //console print out which laser is being tripped
        println("laser " + i + "being trippped");
        println("Number of lasers tripped = " + hitLaserCounter);
        
      } else {
        //if the receptor/laser is not being triggered set the boolean for that laser to FALSE
        lasers[(activeReceptorsGS6[gateState][i])] = false;
      }

      //check the array of booleans for all lasers/receptor and if it is TRUE and has not been counted yet, then add one to the hitLaserCounter and the oneHitCounter 
      if (lasers[currentLaser] && oneHitCounter < 1) {
        hitLaserCounter++;
        oneHitCounter++;
        buzzer2.trigger();
      }

      //if the current laser is not being triggered anymore, i.e. FALSE, and the oneHitCounter has been counted then reset the oneHitCounter
      if (!lasers[currentLaser] && oneHitCounter > 0) {
        oneHitCounter = 0;
      }
    }
    
   } else { 
     
     
   //when buttons are not pressed, read through all active lasers to see if one is being triggered
     for (int i = 0; i < activeReceptorsAll[gateState].length; i++) {
      laserStatus = arduino.analogRead(activeReceptorsAll[gateState][i]);
     
      //if the laserStatus(i.e. amount of light hitting the receptor from the laser) is less lightReceptorThreshold then make that receptor boolean true
      //meaning it has been interrupted
      if (laserStatus < lightReceptorThreshold) {
        //println ("below threshold"); 
        //set the boolean true for the current laser being tripped
        lasers[(activeReceptorsAll[gateState][i])] = true;

        //store the current laser for comparison to eliminate multiple triggers for the same laser being tripped at once
        currentLaser = (activeReceptorsAll[gateState][i]);

        
        //console print out which laser is being tripped
        //println("laser " + i + "being trippped");
        //println("Number of lasers tripped = " + hitLaserCounter);
        
      } else {
        //if the receptor/laser is not being triggered set the boolean for that laser to FALSE
        lasers[(activeReceptorsAll[gateState][i])] = false;
      }

      //check the array of booleans for all lasers/receptor and if it is TRUE and has not been counted yet, then add one to the hitLaserCounter and the oneHitCounter 
      if (lasers[currentLaser] && oneHitCounter < 1) {
        hitLaserCounter++;
        oneHitCounter++;
        buzzer2.trigger();
        //hitLaser = true;
        //println (hitLaser + " "); 
      }

      //if the current laser is not being triggered anymore, i.e. FALSE, and the oneHitCounter has been counted then reset the oneHitCounter
      if (!lasers[currentLaser] && oneHitCounter > 0) {
        oneHitCounter = 0;
      }
    }
   }
  
  //*******  comment from here up to the next row of asterisks to stop checking sensors for tripped lasers  ************
  
  

  //debugging on screen to determine if lasers are on or off uncomment below to see on the display
if(!instructionsComplete){
  background(0);
  fill(0,0,255, alphaCounter);
  rect(0,0, width, height);
  //textAlign(CENTER);
  
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
  
  } else {
  
    //laserStatus = arduino.analogRead(i);
    //textSize(32);
    //fill(0, 255, 0);
    //text("laser " + i + " " + laserStatus, width/2, height/5 + spacing);
    //text("Your team has triggered " + hitLaserCounter + " out of 10", width/2, height/4*3);
    //spacing+=30;
    fill(255, 0, 0);
    textSize(256);
    text(25 - hitLaserCounter, width/2, height/3);
    textSize(64);
    text("LASERS LEFT TO HIT", width/2, height/2);
    
}
    
   
  
  //textSize(32);
  //fill(0, 255, 0);
  //text("laser 1: " + readLaser1, width/2, height/11);
  //text("laser 2: " + readLaser2, width/2, height/11*2);
  //text("laser 3: " + readLaser3, width/2, height/11*3);
  //text("laser 4: " + readLaser4, width/2, height/11*4);
  //text("laser 5: " + readLaser5, width/2, height/11*5);
  //text("laser 6: " + readLaser6, width/2, height/11*6);
  //text("laser 7: " + readLaser7, width/2, height/11*7);
  //text("laser 8: " + readLaser8, width/2, height/11*8);
  //text("laser 9: " + readr, width/2, height/11*9);
  //text("laser 10: " + readLaser10, width/2, height/11*10);
  //text("laser 11: " + readLaser11, width/2, height/11*11);
  //text("laser 12: " + readLaser12, width/2, height/11*12);
  //  text("laser 13: " + readLaser13, width/2, height/11*13);
  //    text("laser 14: " + readLaser14, width/2, height/11*14);
  //      text("laser 15: " + readLaser15, width/2, height/11*15);
  
  
  ////write to the console which gateState we are in at the moment
  //println("gateState: " + gateState);

  ////write to the console which gateState we are in at the moment
  //println("Lasers Triggered: " + hitLaserCounter);

  //text("rfidOneTriggered: " + rfidOneTriggered, width/3, height/3);
  //text("rfidTwoTriggered: " + rfidTwoTriggered, width/3, height/3*2);
  
  if(hitLaserCounter >= 25){
    gateState = 0; 
      delay(100);
      laserLevel2 = false;
      laserFail = true;
      laserCounter = 150;
      
      attentionYouHaveFailed.play();
  }
  

}