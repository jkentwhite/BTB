    int trigger1;
    int trigger2;
    int trigger3;
    int trigger4;
    
    
void rollerBallControlOsc(){

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
    

    
    if(keyPressed){
        if(key == '1'){
        trigger1 = 1;
        }
        if(key == '2'){
        trigger2 = 1;
        }
        if(key == '3'){
        trigger3 = 1;
        }
        if(key == '4'){
        trigger4 = 1;
        }
        
        if(key == ' '){
          rollerBall = false;
          blackScreenIntro = true;
          
          rollerBallInstr.stop();
          floorGridInstr.play();
        }
      }
      println("ROLLERBALL SCREEN/UNITY");
      println("Press SPACEBAR to move to FloorGrid Intro");
    
  
    trigger1 = arduino.digitalRead(triggerButton1);
    trigger2 = arduino.digitalRead(triggerButton2);
    trigger3 = arduino.digitalRead(triggerButton3);
    trigger4 = arduino.digitalRead(triggerButton4);
    
    
    
    println("trigger 1: " + trigger1);
    println("trigger 2: " + trigger2);
    println("trigger 3: " + trigger3);
    println("trigger 4: " + trigger4);
    
    sendValue(trigger1, trigger2, trigger3, trigger4);
    
    
  }
  
  void sendValue(int trigger1, int trigger2, int trigger3, int trigger4){
     // Create channels for the triggers
  OscMessage oscMess1 = new OscMessage("/triggerOne");
  oscMess1.add(trigger1);
  
  OscMessage oscMess2 = new OscMessage("/triggerTwo");
  oscMess2.add(trigger2);
  
  OscMessage oscMess3 = new OscMessage("/triggerThree");
  oscMess3.add(trigger3);
  
  // Create a channel for the y coordinate
  OscMessage oscMess4 = new OscMessage("/triggerFour");
  oscMess4 .add(trigger4);
  
  // Send our data over to Unity!
  oscP5.send(oscMess1, myRemoteLocation); 
  oscP5.send(oscMess2, myRemoteLocation);
  oscP5.send(oscMess3, myRemoteLocation); 
  oscP5.send(oscMess4, myRemoteLocation);
  }
  
  //void keyReleased(){
  //  if(key == '1'){
  //    trigger1 = 0;
  //  }
  //  if(key == '2'){
  //    trigger2 = 0;
  //  }
  //  if(key == '3'){
  //    trigger3 = 0;
  //  }
  //  if(key == '4'){
  //    trigger4 = 0;
  //  }
  //}