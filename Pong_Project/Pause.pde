void pause() {
  
  fill(200, 162, 200, 20);
  stroke(0);
  rect(100, 100, 600, 400);
  textSize(80);
  fill(0);
  text("PAUSE", 400, 280);

  //pause music
  music.pause();

  tactileX      = 300;
  tactileY      = 375;
  tactileW      = 200;
  tactileH      = 100; 
  tactileStroke = #ffffff;
  tactile();
  fill(#A22721);
  rect(300, 375, 200, 100);
  fill(255);
  text("EXIT", width/2, 415);
  
}

void pauseClicks() {
  if (mouseX > 300 && mouseX <500799 && mouseY > 375 && mouseY < 475) {
    reset();
    mode = INTRO;
  }  else {
    mode = GAME;
    
  }
}
