//import libraries for serial reading/writing and arduino
import processing.serial.*;
import cc.arduino.*;

import javax.imageio.*;
import java.awt.image.*;
import java.io.*;
import java.net.*;
import java.util.*;

import oscP5.*;
import netP5.*;

Arduino arduino;
OscP5 oscP5;
NetAddress myRemoteLocation;

//make int variables for receiving the input from triggers 
int trigger1 = 1;
int trigger2 = 1;
int trigger3 = 1;
int trigger4 = 1;

//assign the pin numbers for the triggers form arduino to processing
int triggerButton1 = 8;
int triggerButton2 = 9;
int triggerButton3 = 10;
int triggerButton4 = 11;

int alphaCounter = 255;
boolean alphaUp = false;

void setup (){
  
  size(400, 400);
  background(0);
  
  arduino = new Arduino(this, Arduino.list()[4], 57600);

  arduino.pinMode(triggerButton1, Arduino.INPUT);
  arduino.pinMode(triggerButton2, Arduino.INPUT);
  arduino.pinMode(triggerButton3, Arduino.INPUT);
  arduino.pinMode(triggerButton4, Arduino.INPUT);

  /* start oscP5, listening for incoming messages at port 8000 */
  oscP5 = new OscP5(this,8000);
  
  
  /* send oscP5 messages */
  myRemoteLocation = new NetAddress("127.0.0.1",9000); 
}

void draw(){
  rollerBallControlOsc();
}