void options() {
  background(#D3B293);
  textSize(73);
  fill(146, 99, 115);
  text("Options", 400, 100);

  music();

  //Home button
  fill(255);
  tactileX      = 699;
  tactileY      = 499;
  tactileW      = 100;
  tactileH      = 100; 
  tactileFill   = #9DB9B9;
  tactileStroke = #000000;
  tactile();
  rect(699, 499, 100, 100);
  image(home, 699, 499, 100, 100);
  
  
  
  pushMatrix();
  translate(0, -20);
  
  
  //text
  textSize(40);
  fill(0);
  text("Left Paddle", 120, 50);
  text("Right Paddle", 670, 50);
  
  
  //left slider
  fill(255);
  leftd = map(leftsliderY, 160, 400, 140, 240);
  tactileX      = 75;
  tactileY      = 80;
  tactileW      = 30; 
  tactileH      = 400; 
  tactileWeight = 5;
  tactileFill   = #B7B7B7;
  tactileStroke = #000000;
  tactile();
  rect(75, 100, 30, 400);
  tactileX      = 90 - leftd/2;
  tactileY      = leftsliderY - leftd/2;
  tactileW      = leftd; 
  tactileH      = leftd; 
  tactileStroke = #C0c0c0;
  tactileWeight = 5;
  tactile();
  fill(#FF7003);
  circle(90, leftsliderY, leftd);

  //right slider
  fill(255);
  rightd = map(rightsliderY, 160, 400, 140, 240);
  tactileX      = 695;
  tactileY      = 80;
  tactileW      = 30; 
  tactileH      = 400; 
  tactileStroke = #4D4C4D;
  tactileWeight = 5;
  tactileFill   = #B7B7B7;
  tactile();
  rect(695, 100, 30, 400);
  tactileX      = 710 - rightd/2;
  tactileY      = rightsliderY - rightd/2;
  tactileW      = rightd; 
  tactileH      = rightd; 
  tactileStroke = #C0c0c0;
  tactileWeight = 5;
  tactile();
  fill(#03F9FF);
  circle(710, rightsliderY, rightd);
  
  popMatrix();
}

void optionClicks() {
  if (mouseX > 699 && mouseX < 799 && mouseY > 499 && mouseY < 599) {
    mode = INTRO;
  }
}

void controlSlider() {
  if (mouseX > 75 && mouseX < 100 && mouseY > 160 && mouseY < 400) { // || (mouseX > 90 - leftd/2 && mouseX < 90 + leftd/2 && mouseY > rightsliderY - leftd/2 && mouseY < rightsliderY + leftd/2)) {
    leftsliderY = mouseY;
  }

  if (mouseX > 695 && mouseX < 720 && mouseY > 160 && mouseY < 400) {
    rightsliderY = mouseY;
  }
}
