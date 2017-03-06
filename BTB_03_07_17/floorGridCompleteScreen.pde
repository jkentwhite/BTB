

int validationBar = 150;


int shortTimer = 200;

void floorGridCompleteScreen() {
  background(0);

  textAlign(CENTER);
  textSize(24);
  noStroke();
  fill(0, 255, 0, alphaCounter);
  rect(0,0, width, height);
  
  text("You have gained access to the bomb chamber. \nENTER AT YOUR OWN RISK and \nDO WHATEVER IS NECESSARY to deactivate the device.", width/2, height/3);
  //if (validationBar < 950) {
  //  fill(0, 255, 0, alphaCounter);
  //  float percentageReadout = map(validationBar, 0, 950, 0, 100);

  //  text("Validating Entry..." + int(percentageReadout) + "%", width/2, height/3);

  //  noStroke();
  //  fill(0, 255, 0);
  //  rect(50, height/2, validationBar, 10);
  //  validationBar++;
  //} else if (shortTimer > 0) {
  //  fill(0, 255, 0, alphaCounter);
  //  text("Entry Code Accepted", width/2, height/2);
  //  shortTimer--;
  //} else {
  //  fill(255, 0, 0, alphaCounter);
  //  text("BOMB ARMED", width/2, height/2);
  //}



  if (alphaUp) {
    alphaCounter+=8;
    if (alphaCounter >= 255) {
      alphaUp =  false;
    }
  } else {
    alphaCounter-=8;
    if (alphaCounter <= 0) {
      alphaUp = true;
    }
  }
  //if (countdownFive > 0) {
  //  textSize(48);
  //  fill(0,255,0);
  //  text("FLOOR GRID COMPLETE!\n PREPARE FOR GAS ATTACK!\nLOCATE THE FOUR TABLETS \nTO BEGIN THE GAS ATTACK CHALLENGE", width/2, height/4);
  //  countdownFive--;
  //  delay(100);
  //} else {
  //  background(0);
  //}
}