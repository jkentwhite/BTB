boolean setupComplete = false;

//only for debug readout to see what lasers are ON or OFF
String readLaser1;
String readLaser2;
String readLaser3;
String readLaser4;
String readLaser5;
String readLaser6;
String readLaser7;
String readLaser8;
String readLaser9;
String readLaser10;
String readLaser11;
String readLaser12;
String readLaser13;
String readLaser14;
String readLaser15; 


//variable to guide which part of the activeReceptors array to access

//setting the threshold for the amount of light to trigger the lasers (was 100)
int lightReceptorThreshold = 500;

//counting the number of lasers hit
int hitLaserCounter = 0;
int oneHitCounter = 0;

int laserStatus, prevLaser, currentLaser;

int numberOfLasers = 15;

boolean audioSamplePlayed = false;
boolean audioMusicPlayed = false;

//create an array of booleans for the listed number of lasers
boolean [] lasers = new boolean[numberOfLasers];


//to determine if a laser has been hit
boolean hitLaser = false;
boolean levelOneComplete = false;

//an array of gateState(s) to determine which analog pins will be read to see if a laser is being tripped
int [] [] activeReceptorsAll = {

  { }, //0
  {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //1
  {0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //2
  {0, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //3
  {0, 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //4
  {0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //5
  {0, 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14}, //6
  {0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14}, //7
  {0, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14}, //8
  {0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14}, //9
  {0, 1, 2, 3, 4, 6, 5, 7, 8, 10, 11, 12, 13, 14}, //10
  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14}, //11
  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14}, //12
  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14},   //13
  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14},   //14
  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},   //15
 
};

int [] [] activeReceptorsGS1 = {

  { }, //0
  {1, 4, 5, 8, 9, 11, 12, 13}, //1
  {0, 3, 4, 5, 6, 7, 8, 9, 11}, //2
  {0, 3, 4, 5, 6, 7, 8, 9, 11}, //3
  {0, 4, 5, 6, 7, 8, 9, 11}, //4
  {0, 3, 5, 6, 7, 8, 9, 11}, //5
  {0, 3, 4, 6, 7, 8, 9, 11}, //6
  {0, 3, 4, 5, 7, 8, 9, 11}, //7
  {0, 3, 4, 5, 6, 8, 9, 11}, //8
  {0, 3, 4, 5, 6, 7, 9, 11}, //9
  {0, 3, 4, 6, 5, 7, 8, 11}, //10
  {0, 3, 4, 5, 6, 7, 8, 9, 11}, //11
  {0, 3, 4, 5, 6, 7, 8, 9}, //12
  {0, 3, 4, 5, 6, 7, 8, 9},   //13
  {0, 3, 4, 5, 6, 7, 8, 9, 11},   //14
  {0, 3, 4, 5, 6, 7, 8, 9, 11},   //15
 
};

int [] [] activeReceptorsGS2 = {

  { }, //0
  {1, 2, 3, 6, 9, 10, 11, 12, 13, 14}, //1
  {0, 1, 2, 3, 6, 7, 8, 11, 12, 13, 14}, //2
  {0, 1, 3, 6, 9, 10, 11, 12, 13, 14}, //3
  {0, 1, 2, 6, 9, 10, 11, 12, 13, 14}, //4
  {0, 1, 2,3, 6, 9, 10, 11, 12, 13, 14}, //5
  {0, 1, 2,3, 6, 9, 10, 11, 12, 13, 14}, //6
  {0, 1, 2,3, 9, 10, 11, 12, 13, 14}, //7
  {0, 1, 2,3, 6, 9, 10, 11, 12, 13, 14}, //8
  {0, 1, 2,3, 6, 9, 10, 11, 12, 13, 14}, //9
  {0, 1, 2,3, 6, 10, 11, 12, 13, 14}, //10
  {0, 1, 2,3, 6, 9, 11, 12, 13, 14}, //11
  {0, 1, 2,3, 6, 9, 10, 12, 13, 14}, //12
  {0, 1, 2,3, 6, 9, 10, 11, 13, 14},   //13
  {0, 1, 2,3, 6, 9, 10, 11, 12, 14},   //14
  {0, 1, 2,3, 6, 9, 10, 11, 12, 13},   //15
 
};

void laserLevel1() {
 
 
  //text("You hit " + hitLaserCounter + " lasers", width/2, height/2);

  //background(0);

//Keypressed version
  if (keyPressed) {
    
    if(key == '`') {
      gateState = 0;
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
    //if(key == 'b' || key == 'B'){
    //  buzzer2.trigger();
    //}
    
    
    //to move from Level 1 to Level 2
    if (key == 'z' || key == 'Z') {
      gateState = 5; 
      laserLevel1 = false;
      laserLevelComplete = true;
      laserReturnInstr.play();
      //OscMessage switchPage = new OscMessage("/2");
      //oscP5.send(switchPage, myRemoteLocation); 
    }
  } 
  //else {
  //  gateState = 3;
  //}
  println("LEVEL ONE");
  println("Press Z to move to level2 Lasers");
  //println("Gate State: " + gateState);
  //println(gateState);

//TouchOSC version
if(v_push1 == 1.0f) {
  gateState = 1;
  //println("1");
} else if(v_push2 == 1.0f) {
  gateState = 2; 
  //println("2");
} else {
  gateState = 3;
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


    //set the gateState to determine which receptors to read through the activeReceptors array
    if (gateState == 1) {
      
      // Button 1 = A2, B3, & E2 OFF
      
      //Column A
      // laser1: ON
      arduino.digitalWrite(laser1, Arduino.HIGH);
      readLaser1 = "ON";
      // laser2: OFF
      arduino.digitalWrite(laser2, Arduino.LOW);
      readLaser2 = "OFF";
      // laser3: ON
      arduino.digitalWrite(laser3, Arduino.LOW);
      readLaser3 = "ON";
      
      //Column B
      // laser4: ON
      arduino.digitalWrite(laser4, Arduino.HIGH);
      readLaser4 = "ON";
      // laser5: ON
      arduino.digitalWrite(laser5, Arduino.LOW);
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
      // laser9: ON
      arduino.digitalWrite(laser9, Arduino.HIGH);
      readLaser9 = "ON";
      
      //Column D
      // laser10: ON
      arduino.digitalWrite(laser10, Arduino.LOW);
      readLaser10 = "ON";
      // laser11: ON
      arduino.digitalWrite(laser11, Arduino.LOW);
      readLaser11 = "ON";
      // laser12: ON
      arduino.digitalWrite(laser12, Arduino.HIGH);
      readLaser12 = "ON";
      
      //Column E
      // laser13: ON
      arduino.digitalWrite(laser13, Arduino.HIGH);
      readLaser13 = "ON";
      // laser14: OFF
      arduino.digitalWrite(laser14, Arduino.HIGH);
      readLaser14 = "OFF";
      // laser15: ON
      arduino.digitalWrite(laser15, Arduino.HIGH);
      readLaser15 = "ON";     
      
    }

 
    if (gateState == 2) {

    // Button 2 = C3 & D2 OFF  
      
      //Column A
      // laser1: ON
      arduino.digitalWrite(laser1, Arduino.HIGH);
      readLaser1 = "ON";
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
      // laser8: ON
      arduino.digitalWrite(laser8, Arduino.LOW);
      readLaser8 = "ON";
      // laser9: OFF
      arduino.digitalWrite(laser9, Arduino.LOW);
      readLaser9 = "OFF";
      
      //Column D
      // laser10: ON
      arduino.digitalWrite(laser10, Arduino.HIGH);
      readLaser10 = "ON";
      // laser11: OFF
      arduino.digitalWrite(laser11, Arduino.HIGH);
      readLaser11 = "OFF";
      // laser12: ON
      arduino.digitalWrite(laser12, Arduino.HIGH);
      readLaser12 = "ON";
      
      //Column E
      // laser13: ON
      arduino.digitalWrite(laser13, Arduino.LOW);
      readLaser13 = "ON";
      // laser14: ON
      arduino.digitalWrite(laser14, Arduino.LOW);
      readLaser14 = "ON";
      // laser15: ON
      arduino.digitalWrite(laser15, Arduino.HIGH);
      readLaser15 = "ON"; 
      
    }


    
    
 if (gateState == 3) {

      // State 3 = All Lasers ON
      
      // laser1: OFF
      arduino.digitalWrite(laser1, Arduino.HIGH);
      readLaser1 = "ON";
      // laser2: OFF
      arduino.digitalWrite(laser2, Arduino.HIGH);
      readLaser2 = "ON";
      // laser3: OFF
      arduino.digitalWrite(laser3, Arduino.HIGH);
      readLaser3 = "ON";
      // laser4: OFF
      arduino.digitalWrite(laser4, Arduino.HIGH);    
      readLaser4 = "ON";
      // laser5: OFF
      arduino.digitalWrite(laser5, Arduino.HIGH);
      readLaser5 = "ON";
      // laser6: OFF
      arduino.digitalWrite(laser6, Arduino.HIGH);
      readLaser6 = "ON";
      // laser7: OFF
      arduino.digitalWrite(laser7, Arduino.HIGH);
      readLaser7 = "ON";
      // laser8: OFF
      arduino.digitalWrite(laser8, Arduino.HIGH);
      readLaser8 = "ON";
      // laser9: OFF
      arduino.digitalWrite(laser9, Arduino.HIGH);
      readLaser9 = "ON";
      // laser10: OFF
      arduino.digitalWrite(laser10, Arduino.HIGH);
      readLaser10 = "ON";
      // laser11: OFF
      arduino.digitalWrite(laser11, Arduino.HIGH);
      readLaser11 = "ON";
      // laser12: OFF
      arduino.digitalWrite(laser12, Arduino.HIGH);
      readLaser12 = "ON";
      // laser13: OFF
      arduino.digitalWrite(laser13, Arduino.HIGH);
      readLaser13 = "ON";
      // laser14: OFF
      arduino.digitalWrite(laser14, Arduino.HIGH);
      readLaser14 = "ON";
      // laser15: OFF
      arduino.digitalWrite(laser15, Arduino.HIGH);
      readLaser15 = "ON";
      
      //delay to allow lasers to come back on after switching between buttons, without triggering
      delay(200); 
    }


  
  //******  comment from here down to the next row of asterisks to stop checking sensors for tripped lasers  *********  
if(setupComplete){
   //when button 1 is pressed, read through the active lasers to determine if a player is tripping a laser
   //activeReceptorsGS1 array does not include lasers 4 & 7
    if (gateState == 1) {
      for (int i = 0; i < activeReceptorsGS1[gateState].length; i++) {
      laserStatus = arduino.analogRead(activeReceptorsGS1[gateState][i]);

      //if the laserStatus(i.e. amount of light hitting the receptor from the laser) is less lightReceptorThreshold then make that receptor boolean true
      //meaning it has been interrupted
      if (laserStatus < lightReceptorThreshold) {
        //println ("below threshold"); 
        //set the boolean true for the current laser being tripped
        lasers[(activeReceptorsGS1[gateState][i])] = true;

        //store the current laser for comparison to eliminate multiple triggers for the same laser being tripped at once
        currentLaser = (activeReceptorsGS1[gateState][i]);
        
        //console print out which laser is being tripped
        println("laser " + i + "being trippped");
        println("Number of lasers tripped = " + hitLaserCounter);
        
      } else {
        //if the receptor/laser is not being triggered set the boolean for that laser to FALSE
        lasers[(activeReceptorsGS1[gateState][i])] = false;
      }

      //check the array of booleans for all lasers/receptor and if it is TRUE and has not been counted yet, then add one to the hitLaserCounter and the oneHitCounter 
      if (lasers[currentLaser] && oneHitCounter < 1) {
        hitLaserCounter++;
        oneHitCounter++;
        buzzer2.trigger();
               //delay to allow lasers to reset, so turning them off doesn't count as a trip
      }

      //if the current laser is not being triggered anymore, i.e. FALSE, and the oneHitCounter has been counted then reset the oneHitCounter
      if (!lasers[currentLaser] && oneHitCounter > 0) {
        oneHitCounter = 0;
 
      }
     } 
     
    } else if (gateState == 2) {
 
   
   //when button 2 is pressed, read through the active lasers to determine if a player is tripping a laser
   //activeReceptorsGS1 array does not include lasers 1, 9, & 14    
      
    for (int i = 0; i < activeReceptorsGS2[gateState].length; i++) {
      laserStatus = arduino.analogRead(activeReceptorsGS2[gateState][i]);

      //if the laserStatus(i.e. amount of light hitting the receptor from the laser) is less lightReceptorThreshold then make that receptor boolean true
      //meaning it has been interrupted
      if (laserStatus < lightReceptorThreshold) {
        //println ("below threshold"); 
        //set the boolean true for the current laser being tripped
        lasers[(activeReceptorsGS2[gateState][i])] = true;

        //store the current laser for comparison to eliminate multiple triggers for the same laser being tripped at once
        currentLaser = (activeReceptorsGS2[gateState][i]);
        
        //console print out which laser is being tripped
        println("laser " + i + "being trippped");
        println("Number of lasers tripped = " + hitLaserCounter);
        
      } else {
        //if the receptor/laser is not being triggered set the boolean for that laser to FALSE
        lasers[(activeReceptorsGS2[gateState][i])] = false;
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
        println("laser " + i + "being trippped");
        println("Number of lasers tripped = " + hitLaserCounter);
        
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
}

  //*******  comment from here up to the next row of asterisks to stop checking sensors for tripped lasers  ************
  

 // debugging on screen to determine if lasers are on or off uncomment below to see on the display
  
  
    //int spacing = 10;
    
  
  background(0);
  fill(0,255,0);
  textAlign(CENTER);
  textSize(24);
  //text("Defense Mechanism 1: Laser Field\nObjective: Get your entire team across the laser maze.\nAnd then get them all back. \nUse the buttons on the tablets to control the laser configuration. \nHit no more than 10 lasers. \nFailure will cost precious time, delay your access to the Bomb, \nand increase the likelihood of detonation.", width/2, height/4);

  
  for(int i = 0; i < numberOfLasers; i++){
    //laserStatus = arduino.analogRead(i);
    //textSize(32);
    //text("laser " + i + " " + laserStatus, width/2, height/5 + spacing);
    //text("Your team has triggered " + hitLaserCounter + " out of 10", width/2, height/4*3);
    //spacing+=30;
    fill(255, 0, 0);
    textSize(256);
    text(hitLaserCounter, width/2, height/3);
    textSize(64);
    text("LASERS HIT", width/2, height/2);
    
  }
  
  
  //text("laser 2: " + readLaser2, width/2, height/11*2);
  //text("laser 3: " + readLaser3, width/2, height/11*3);
  //text("laser 4: " + readLaser4, width/2, height/11*4);
  //text("laser 5: " + readLaser5, width/2, height/11*5);
  //text("laser 6: " + readLaser6, width/2, height/11*6);
  //text("laser 7: " + readLaser7, width/2, height/11*7);
  //text("laser 8: " + readLaser8, width/2, height/11*8);
  //text("laser 9: " + readLaser9, width/2, height/11*9);
  //text("laser 10: " + readLaser10, width/2, height/11*10);
  //text("laser 11: " + readLaser11, width/2, height/11*11);
  //text("laser 12: " + readLaser12, width/2, height/11*12);
  //  text("laser 13: " + readLaser13, width/2, height/11*13);
  //    text("laser 14: " + readLaser14, width/2, height/11*14);
  //      text("laser 15: " + readLaser15, width/2, height/11*15);
  
  //write to the console which gateState we are in at the moment
  //println("gateState: " + gateState);

  //write to the console which gateState we are in at the moment
 // println("Lasers Triggered: " + hitLaserCounter);
  
  if(hitLaserCounter >= 20){
    laserReset = true;
  }
  setupComplete = true;
  
}