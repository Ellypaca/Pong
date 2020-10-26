void intro() {
  background(173, 205, 189);



  //music
  //  music.isPlaying(); // learned from https://forum.processing.org/one/topic/minim-know-when-a-song-is-done.html
  music();




  strokeWeight(2);
  stroke(0);
  fill(163, 255, 222);
  beginShape();
  vertex(180, 85);
  vertex(200, 25);
  vertex(300, 80);
  vertex(350, 15);
  vertex(380, 85);
  vertex(420, 20);
  vertex(480, 100);
  vertex(550, 30);
  vertex(600, 100);
  vertex(690, 70);
  vertex(630, 150);
  vertex(660, 220);
  vertex(550, 180);
  vertex(520, 240);
  vertex(420, 180);
  vertex(370, 220);
  vertex(300, 180);
  vertex(250, 250);
  vertex(200, 180);
  vertex(120, 200);
  vertex(160, 140);
  vertex(120, 70);
  endShape(CLOSE);

  textSize(70);
  fill(146, 99, 115);
  strokeWeight(2);
  text("Po(n)g Game", width/2, height - height/1.25);

  //multiplayer
  tactileX      = 100;
  tactileY      = 300;
  tactileW      = 260;
  tactileH      = 100; 
  tactileWeight = 5;
  tactile();
  if (tactileOn == true) {

    greencolorr--;
    greencolorg--;
    greencolorb--;
  } else {
    greencolorr = 108;
    greencolorg = 255;
    greencolorb = 134;
  }
  fill(greencolorr, greencolorg, greencolorb);
  rect(100, 300, 260, 100);
  fill(255);
  textSize(50);
  text("2 Players", 230, 340);

  //singleplayer
  tactileX      = 440;
  tactileY      = 300;
  tactileW      = 260;
  tactileH      = 100; 
  tactileWeight = 5;
  tactile();
  if (tactileOn == true) {

    lilaccolorr--;
    lilaccolorg--;
    lilaccolorb--;
  } else {
    lilaccolorr = 213;
    lilaccolorg = 108;
    lilaccolorb = 255;
  }
  fill(lilaccolorr, lilaccolorg, lilaccolorb);
  rect(440, 300, 260, 100);
  fill(255);
  text("1 Player", 570, 340);


  //rally
  tactileX      = 270;
  tactileY      = 450;
  tactileW      = 260;
  tactileH      = 100; 
  tactileWeight = 5;
  tactile();
  if (tactileOn == true) {
    orangecolorr--;
    orangecolorg--;
    orangecolorb--;
  } else {
    orangecolorr = 234;
    orangecolorg = 166;
    orangecolorb = 109;
  }
  fill(orangecolorr, orangecolorg, orangecolorb);
  rect(270, 450, 260, 100);
  fill(255);
  text("Rally", 400, 490);


  //chaos mode
  /* fill(#A50000);
   rect(790, 0, 260, 100);*/

  //settings
  tactileX      = 699;
  tactileY      = 499;
  tactileW      = 100;
  tactileH      = 100; 
  tactileFill   = #9DB9B9;
  tactileStroke = #000000;
  tactile();
  rect(699, 499, 100, 100);
  image(settings, 699, 499, 100, 100);
}

void introClicks() {
  //multiplayer
  if (mouseX > 100 && mouseX < 360 && mouseY > 300 && mouseY < 400) {
    mode = GAME;
    AI = false;
    rally = false;
  }

  //singleplayer 
  if (mouseX > 440 && mouseX < 700 && mouseY > 300 && mouseY < 400) {
    mode = GAME;
    AI = true;
    rally = false;
  }

  //rally
  if (mouseX > 270 && mouseX < 530 && mouseY > 450 && mouseY < 550) {
    mode = GAME;
    AI = false;
    rally = true;
  }

  //options 
  if (mouseX > 699 && mouseX < 799 && mouseY > 499 && mouseY < 599) {
    mode = OPTIONS;
  }
}
