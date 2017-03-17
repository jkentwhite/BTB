
/* NOTES FOR RUNNING THE SKETCH:

 */


//import libraries for serial reading/writing and arduino
import processing.serial.*;
import cc.arduino.*;

//import libraries for kinect and sound
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
import ddf.minim.*;
import processing.sound.*;
import processing.video.*;

import javax.imageio.*;
import java.awt.image.*;
import java.io.*;
import java.net.*;
import java.util.*;

import oscP5.*;
import netP5.*;

//ScreenBroadcast sb;

Movie laserVideoIntro;


//create variables for arduino, kinect and audio(minim)
Arduino arduino;
Kinect kinect;
Minim minim;
OscP5 oscP5;
NetAddress myRemoteLocation;

//OscP5 oscp5Unity;
//NetAddress myRemoteLocationUnity;

//create variables for sound effects
AudioSample chime, buzzer, patternSuccess, patternFail, buzzer2;

//create variables for music
SoundFile laserActivate, laserMusic, floorGridMusic;
SoundFile laserInstr, gasAttackInstr, rollerBallInstr, floorGridInstr;
SoundFile grinchGas, avoidTheLasers, poitOfTheLasers, iveSeenBetter, failureRegistered;
SoundFile goodJobTeam, rememberToCommunicate, moveFaster, uCanDoBetter, selfCentered;
SoundFile attentionYouHaveFailed, excellentWork, warningFailure, proceedBombChamber, laserReturnInstr;
//booleans for all of the patterns in Level 3
boolean pattern1;
boolean pattern1a;
boolean pattern1b;
boolean pattern2;
boolean pattern2a;
boolean pattern2b;
boolean pattern3;
boolean pattern3a;
boolean pattern3b;
boolean pattern4;
boolean pattern4a;
boolean pattern4b;
boolean pattern5;
boolean pattern5a;
boolean pattern5b;
boolean pattern6;
boolean pattern6a;
boolean pattern6b;



//create variables for game states
boolean blackScreenIntro;
boolean laserIntro;
boolean laserLevel1;
boolean laserLevel2;
boolean laserLevel3;
boolean laserLevel4;
boolean floorGridPracticeScreen;
boolean laserScreen;
boolean laserPuzzle;
boolean laserDeactivatedScreen;
boolean floorGridInstScreen;
boolean floorGridStartScreen;
boolean floorGridLevelOne;
boolean floorGridSymbolsLevelOne;
boolean floorGridSymbolsLevelTwo;
boolean floorGridSymbolsLevelThree;
boolean floorGridSymbolsLevelFour;
boolean levelOnePlayed = false;
boolean floorGridFireBallLevel;
boolean levelTwoPlayed = false;
boolean floorGridLevelThree;
boolean levelThreePlayed = false;
boolean floorGridLevelFour;
boolean levelFourPlayed = false;
boolean floorGridSuccessLvlOneScreen;
boolean floorGridSuccessLvlTwoScreen;
boolean floorGridSuccessLvlThreeScreen;
boolean floorGridSuccessLvlFourScreen; 
boolean floorGridComplete;
boolean gasAttackScreen;
boolean allChallengesCompleteScreen;
boolean rollerBall;
boolean laserFail;
boolean laserSuccess;
boolean gasAttackFail;
boolean gasAttackSuccess;
boolean laserReset;
boolean laserLevelComplete;
boolean rollerBallSuccess = false;
boolean rollerBallFail = false;

//create variables for kinect depth threshold
int minTreshold = 940;//340;
int maxThreshold = 955;//380;

//variable for triggerButtons pin assignments
int triggerButton1 = 31;
int triggerButton2 = 33;
int triggerButton3 = 35;
int triggerButton4 = 45;

// variable for laser configuration
int laser1 = 17;
int laser2 = 16;
int laser3 = 15;
int laser4 = 14;
int laser5 = 2;
int laser6 = 3;
int laser7 = 12;
int laser8 = 4;
int laser9 = 5;
int laser10 = 6;
int laser11 = 7;
int laser12 = 8;
int laser13 = 9; 
int laser14 = 10;
int laser15 = 11; 

//floats for TouchOSC
float v_push1 = 0.0f;
float v_push2 = 0.0f;
float v_push3 = 0.0f;
float v_push4 = 0.0f;
float v_push5 = 0.0f;
float v_push6 = 0.0f;

// laserConfigOne is hooked up to PIN 3 on the arduino board
//int laserConfigOne = 3; 

int gateState = 4;

// laserConfigOne is hooked up to PIN 3 on the arduino board
//int laserConfigOne = 3; 

// irSensor is hooked up to PIN 2 on the arduino board
//int irSensor = 2;

//create variables for timers
int countdownFive = 50;
int levelCountdownLevelFour = 70;
int levelCountdownLevelThree = 70;
int levelCountdownLevelTwo = 70;
int levelCountdownLevelOne = 70;

//counter for the patterns on floorgrid
int patternCounter = 0;

//create variable for tracking the pattern number for each level on floorgrid
int patternNumber = 0;

//create variable for counting the number of patterns correct in floorgrid
int numberCorrect= 0;

//create variable for determining the number of correct patterns to move to the next level in floorgrid
int targetPatternNumber = 5;

//create boolean variables for if the player is in the correct rectangle on the pattern
boolean rectOneGood, rectTwoGood, rectThreeGood, rectFourGood;

//create variable for the distance threshold between blobs to be recognized
float distThreshold = 50;

//create array for storing blobs that have been created based on depth info from kinect
ArrayList<Blob> blobs = new ArrayList<Blob>();



//create variables for image display
PImage imgVideo, img;
PImage bomb, skull, hawk, eagle;
PImage greyBomb, greySkull, greyHawk, greyEagle, glowEagle;
PImage greenLock, redLock;
PImage btbLogo;

//create variables for the size of the grid rectangles for floorgrid
int gridX = 256;
int gridY = 192;

//create gridsection array for 640x480 res based on gridX = 160, gridY = 120
int [] [] gridSectionsSmall = {
  {0, 0}, 
  {160, 0}, 
  {320, 0}, 
  {480, 0}, 
  {0, 120}, 
  {160, 120}, 
  {320, 120}, 
  {480, 120}, 
  {0, 240}, 
  {160, 240}, 
  {320, 240}, 
  {480, 240}, 
  {0, 360}, 
  {160, 360}, 
  {320, 360}, 
  {480, 360}   
};

//create gridsection array for 1280x800 res based on gridX = 320, gridY = 200
int [] [] gridSectionsLarge = {
  {0, 0}, 
  {320, 0}, 
  {640, 0}, 
  {960, 0}, 
  {0, 200}, 
  {320, 200}, 
  {640, 200}, 
  {960, 200}, 
  {0, 400}, 
  {320, 400}, 
  {640, 400}, 
  {960, 400}, 
  {0, 600}, 
  {320, 600}, 
  {640, 600}, 
  {960, 600}   
};

//create gridsection array for 1024x768 res based on gridX = 256, gridY = 192
int [] [] gridSections = {
  {0, 0}, 
  {256, 0}, 
  {512, 0}, 
  {768, 0}, 
  {0, 192}, 
  {256, 192}, 
  {512, 192}, 
  {768, 192}, 
  {0, 384}, 
  {256, 384}, 
  {512, 384}, 
  {768, 384}, 
  {0, 576}, 
  {256, 576}, 
  {512, 576}, 
  {768, 576}   
};


//create arrays for patterns on floorgrid  where each number in the array is a rectangle in the 4x4 grid starting with 0 and ending with 15
int [] [] patternRects = {

  {0, 3, 12, 15}, 
  {1, 2, 13, 14}, 
  {5, 6, 9, 10}, 
  {12, 13, 14, 15}, 
  {5, 7, 8, 10}, 
  {3, 4, 11, 12}, 
  {0, 7, 8, 15}, 
  {4, 6, 9, 11}, 
  {0, 1, 2, 3}, 
  {4, 7, 8, 11}, 
  {3, 6, 9, 12}, 
  {0, 1, 10, 11}, 
  {2, 5, 10, 12}, 
  {7, 8, 13, 15}, 
  {0, 1, 4, 5}, 
  {3, 7, 9, 14}, 
  {1, 6, 11, 12}, 
  {3, 4, 8, 15}, 
  {2, 10, 12, 13}, 
  {1, 4, 7, 14}, 
  {2, 3, 8, 9}, 
  {1, 6, 14, 15}, 
  {4, 5, 7, 13}, 
  {0, 8, 10, 11}, 
  {4, 5, 6, 7}, 
  {1, 3, 13, 15}, 
  {0, 4, 8, 12}, 
  {1, 7, 10, 13}, 
  {6, 10, 11, 12}, 
  {2, 4, 8, 14}, 
  {1, 7, 9, 12}, 
  {2, 8, 11, 13}, 
  {0, 1, 6, 8}, 
  {2, 4, 9, 13}, 
  {0, 3, 9, 15}, 
  {0, 1, 6, 8}, 
  {2, 4, 9, 13}, 
  {0, 7, 11, 14}, 
  {3, 5, 6, 8}, 
  {1, 9, 12, 15}, 
  {0, 3, 4, 10}, 
  {5, 7, 8, 13}, 
  {0, 6, 10, 15}, 
  {4, 9, 12, 14}, 
  {0, 2, 5, 11}, 
  {1, 3, 13, 14}, 
  {4, 9, 11, 15}, 
  {0, 1, 8, 10}, 
  {3, 11, 12, 14}, 
  {4, 9, 10, 15}

};

//alternate aray of patterns for floorgrid where each number in the array is a rectangle in the 4x4 grid starting with 0 and ending with 15
int [] [] patternRectsB = {

  {4, 5, 6, 7}, 
  {1, 3, 13, 15}, 
  {0, 4, 8, 12}, 
  {1, 7, 10, 13}, 
  {6, 10, 11, 12}, 
  {2, 4, 8, 14}, 
  {1, 7, 9, 12}, 
  {2, 8, 11, 13}, 
  {0, 1, 6, 8}, 
  {2, 4, 9, 13}, 
  {0, 3, 9, 15}, 
  {0, 1, 6, 8}, 
  {2, 4, 9, 13}, 
  {0, 7, 11, 14}, 
  {3, 5, 6, 8}, 
  {1, 9, 12, 15}, 
  {0, 3, 4, 10}, 
  {5, 7, 8, 13}, 
  {0, 6, 10, 15}, 
  {4, 9, 12, 14}, 
  {0, 2, 5, 11}, 
  {1, 3, 13, 14}, 
  {4, 9, 11, 15}, 
  {0, 1, 8, 10}, 
  {3, 11, 12, 14}, 
  {4, 9, 10, 15}, 
  {0, 3, 12, 15}, 
  {1, 2, 13, 14}, 
  {5, 6, 9, 10}, 
  {12, 13, 14, 15}, 
  {5, 7, 8, 10}, 
  {3, 4, 11, 12}, 
  {0, 7, 8, 15}, 
  {4, 6, 9, 11}, 
  {0, 1, 2, 3}, 
  {4, 7, 8, 11}, 
  {3, 6, 9, 12}, 
  {0, 1, 10, 11}, 
  {2, 5, 10, 12}, 
  {7, 8, 13, 15}, 
  {0, 1, 4, 5}, 
  {3, 7, 9, 14}, 
  {1, 6, 11, 12}, 
  {3, 4, 8, 15}, 
  {2, 10, 12, 13}, 
  {1, 4, 7, 14}, 
  {2, 3, 8, 9}, 
  {1, 6, 14, 15}, 
  {4, 5, 7, 13}, 
  {0, 8, 10, 11}

};

boolean gridRectOccupied [] [] = new boolean[16][4];
boolean currentRectOccupied [] = new boolean[16];
boolean [] gridProgress = new boolean [16];

int gridProgressCounter = 0;

int [] gridSymbol = new int [16];

int hawkCounter = 0;
int skullCounter = 0;
int bombCounter = 0;
int eagleCounter = 0;

boolean patternSection = false;
boolean patternSet = false;

int alphaCounter = 255;

boolean alphaUp = false;

int blobCounter = 0;

int [] rectOccupiedTimer = new int [16];

int spaceCounterOne = 0;
int spaceCounterTwo = 0;
int spaceCounterThree = 0;
int spaceCounterFour = 0;

int burstSpeed = 15;

int laserResetCounter = 50;

boolean introIntro;
boolean audioComplete = false;


void oscEvent(OscMessage theOscMessage) {

    String addr = theOscMessage.addrPattern();
    float  val  = theOscMessage.get(0).floatValue();

    if (addr.equals("/1/push1"))     { v_push1 = val; }
    else if(addr.equals("/1/push2"))  { v_push2 = val; }
    else if(addr.equals("/2/push3"))  { v_push3 = val; }
    else if(addr.equals("/2/push4"))  { v_push4 = val; }
    else if(addr.equals("/2/push5"))  { v_push5 = val; }
    else if(addr.equals("/2/push6"))  { v_push6 = val; }
}


void setup(){
  //size(1024, 768);
  fullScreen();
  //size(displayWidth, displayHeight);
  
  //set booleans for lazer patterns in Level 3 & 4
  pattern1a = true;
  pattern1b = false;
  pattern2a = true;
  pattern2b = false;
  pattern3a = true;
  pattern3b = false;
  pattern4a = true;
  pattern4b = false;
  pattern5a = true;
  pattern5b = false;
  pattern6a = true;
  pattern6b = false;
  
  //sb = new ScreenBroadcast();
  
  
  background(0);

  //set booleans for starting the experience making the intro TRUE and all other states FALSE
  blackScreenIntro = false;
  introIntro = true;
  laserIntro = false;
  laserLevel1 = false;
  laserReset = false;
  laserLevel2 = false;
  laserScreen = false;
  laserDeactivatedScreen = false;
  floorGridInstScreen = false;
  floorGridPracticeScreen = false;
  floorGridStartScreen = false;
  floorGridSymbolsLevelTwo = false;
  floorGridSymbolsLevelThree = false;
  floorGridSymbolsLevelFour = false;
  floorGridSymbolsLevelOne = false;
  floorGridComplete = false;
  gasAttackScreen = false;
  allChallengesCompleteScreen = false;
  rollerBall = false;
  laserLevelComplete = false;

  //initialize arduino and configure port
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  ////designate the laserConfigOne as an OUTPUT for turning the lasers on and off
  ////arduino.pinMode(laserConfigOne, Arduino.OUTPUT);
  arduino.pinMode(laser1, Arduino.OUTPUT);
  arduino.pinMode(laser2, Arduino.OUTPUT);
  arduino.pinMode(laser3, Arduino.OUTPUT);
  arduino.pinMode(laser4, Arduino.OUTPUT);
  arduino.pinMode(laser5, Arduino.OUTPUT);
  arduino.pinMode(laser6, Arduino.OUTPUT);
  arduino.pinMode(laser7, Arduino.OUTPUT);
  arduino.pinMode(laser8, Arduino.OUTPUT);
  arduino.pinMode(laser9, Arduino.OUTPUT);
  arduino.pinMode(laser10, Arduino.OUTPUT);
  arduino.pinMode(laser11, Arduino.OUTPUT);
  arduino.pinMode(laser12, Arduino.OUTPUT);
  arduino.pinMode(laser13, Arduino.OUTPUT);
  arduino.pinMode(laser14, Arduino.OUTPUT);
  arduino.pinMode(laser15, Arduino.OUTPUT);
  arduino.pinMode(triggerButton1, Arduino.INPUT);
  arduino.pinMode(triggerButton2, Arduino.INPUT);
  arduino.pinMode(triggerButton3, Arduino.INPUT);
  arduino.pinMode(triggerButton4, Arduino.INPUT);

  /* start oscP5, listening for incoming messages at port 8000 */
  oscP5 = new OscP5(this,8000);
  
  //do we need another port and NetAddress to talk to Unity? ********************************************************
  
  /* send oscP5 messages */
  myRemoteLocation = new NetAddress("127.0.0.1",9000);
  
  bomb = loadImage("purpleBomb.png");
  skull = loadImage("greenSkull.png");
  hawk = loadImage("orangeHawk.png");
  eagle = loadImage("blueEagle.png");
  greyBomb = loadImage("greyBomb.png");
  greySkull = loadImage("greySkull.png");
  greyHawk = loadImage("greyHawk.png");
  greyEagle = loadImage("greyEagle.png");
  greenLock = loadImage("greenLock.png");
  redLock = loadImage("redLock.png");
  glowEagle = loadImage("glowEagle.png");
  btbLogo = loadImage("logo.png");

  //initialize the minim files
  minim = new Minim(this);

  //designate the files for the minim and soundfile files
  chime = minim.loadSample("chime.wav", 2048);
  buzzer = minim.loadSample("WrongOption2.wav", 2048);
  buzzer2 = minim.loadSample("buzzer.wav", 2048);
  patternSuccess = minim.loadSample("PatternRecognized.mp3", 2048);
  patternFail = minim.loadSample("InvalidPattern_Mix_v1.mp3", 2048);
  laserActivate = new SoundFile(this, "layzuhhr.wav");
  laserMusic = new SoundFile(this, "LasersOnMixv1.wav");
  floorGridMusic =new SoundFile(this, "umami.mp3");
  
  laserInstr = new SoundFile(this, "laserMazeRevised.wav");
  gasAttackInstr = new SoundFile(this, "gasAttackRevised.wav");
  rollerBallInstr = new SoundFile(this, "cyberballAudio.wav");
  floorGridInstr = new SoundFile(this, "humanKeypadRevised.wav");
  
  grinchGas = new SoundFile(this, "grinchGas.wav");
  avoidTheLasers = new SoundFile(this, "avoidTheLasers.wav");
  poitOfTheLasers = new SoundFile(this, "pointOfLasers.wav");
  iveSeenBetter = new SoundFile(this, "iveSeenBetter.wav");
  failureRegistered = new SoundFile(this, "failureRegistered.wav");
  goodJobTeam = new SoundFile(this, "goodJobTeamwork.wav");
  rememberToCommunicate = new SoundFile(this, "rememberToCommunicate.wav");
  moveFaster = new SoundFile(this, "moveFaster.wav");
  uCanDoBetter = new SoundFile(this, "uCanDoBetter.wav");
  selfCentered = new SoundFile(this, "selfCentered.wav");
  
  attentionYouHaveFailed = new SoundFile(this, "attentionYouHaveFailed.wav");
  excellentWork = new SoundFile(this, "excellentWork.wav");
  warningFailure = new SoundFile(this, "warningFailure.wav");
  proceedBombChamber = new SoundFile(this, "proceedBombChamber.wav");
  laserReturnInstr = new SoundFile(this, "laserReturnInstr.wav");
  
  for (int i = 0; i < gridRectOccupied.length; i++) {
    for( int j = 0; j < gridRectOccupied[i].length; j++){
      gridRectOccupied[i][j] = false;
      }
    gridProgress[i] = false;
    currentRectOccupied[i] = false;
    rectOccupiedTimer[i] = 50;
  }

  //intitalize the Kinect depth and IR data
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.initVideo();

  img = createImage(kinect.width, kinect.height, RGB);
}

//this is the main draw function for the experience
//it is dependent on the state of the booleans to determine which class is being run (i.e. blackScreenIntro = TRUE so blackScreenIntro() is triggered)
void draw()
{
  
  background(0);
  if(introIntro){
    blackScreen();
  } else if(laserIntro){
    laserIntro();
  } else if(laserReset){
    laserReset();
  } else if(laserLevelComplete){
    laserLevelComplete();
  } else if(laserLevel1){
    laserLevel1();
  } else if(laserLevel2){
    laserLevel2();
  } else if(laserSuccess){
    laserSuccess();
  } else if(laserFail){
    laserFail();
  } else if(laserDeactivatedScreen) {
    laserDeactivatedScreen();
  } else if(gasAttackSuccess){
    gasAttackSuccess();
  } else if(gasAttackFail){
    gasAttackFail();
  } else if(rollerBall){
    rollerBallControlOsc();
  } else if(rollerBallSuccess){
    rollerBallSuccess();
  } else if(rollerBallFail){
    rollerBallFail();
  } else if (blackScreenIntro) {
    blackScreenIntro();
  } else if (floorGridInstScreen) {
    floorGridInstScreen();
  } else if (floorGridPracticeScreen) {
    floorGridPracticeScreen();
  } else if (floorGridStartScreen) {
    floorGridStartScreen();
  } else if (floorGridSymbolsLevelOne) {
    floorGridSymbolsLevelOne();
  } else if (floorGridSymbolsLevelTwo) {
    floorGridSymbolsLevelTwo();
  }  else if (floorGridSymbolsLevelThree) {
    floorGridSymbolsLevelThree();
  } else if (floorGridSymbolsLevelFour) {
    floorGridSymbolsLevelFour();
  }  else if (floorGridComplete) {
    floorGridCompleteScreen();
  } else if (proceedToBombChamber){
    bombChamber();
  }
  
  //sb.BroadcastSplit(get());
  ////Add some delay, change to higher values to have higher
  //delay(20);
}

void keyPressed(){
  if(key == 'g' || key == 'G'){
    grinchGas.play();
  }
   if(key == 'h' || key == 'H'){
    avoidTheLasers.play();
  }
   if(key == 'j' || key == 'J'){
    poitOfTheLasers.play();
  }
   if(key == 'k' || key == 'K'){
    iveSeenBetter.play();
  }
   if(key == 'l' || key == 'L'){
    failureRegistered.play();
  }
   if(key == 'y' || key == 'Y'){
    goodJobTeam.play();
  }
   if(key == 'u' || key == 'U'){
    rememberToCommunicate.play();
  }
   if(key == 'i' || key == 'I'){
    moveFaster.play();
  }
   if(key == 'o' || key == 'O'){
    uCanDoBetter.play();
  }
   if(key == 'p' || key == 'P'){
    selfCentered.play();
  }
  
  
}


float distSq(float x1, float y1, float x2, float y2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1);
  return d;
}