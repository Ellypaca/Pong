void gameover() {
  music.pause();

  if (leftscore > rightscore) {
    clapping.play();
    background(#FF7003);
    fill(0);
    text("Left Side Wins!", width/2, height/2-height/4);
  } else if (rightscore > leftscore) {
    clapping.play();
    background(#03F9FF);
    fill(0);
    text("Right Side Wins!", width/2, height/2-height/4);
  } else if (rally == true && rallyscore <= rallyhigh) {
    background(#A9AA9C);
    fill(0);
    textSize(70);
    text("Better Luck Next Time!", width/2, height/2-height/4);
    textSize(60);
    fill(#28291D);
    text("Your Score: " + rallyscore, width/2, 350);
    text("Highscore: " + rallyhigh, width/2, 400);
  } else if (rally == true && rallyscore > rallyhigh) {
    clapping.play();
    background(#F9FFA2);
    textSize(80);
    text("Congratulations!", width/2, height/2-height/4);
    textSize(60);
    text("Your Score: " + rallyscore, width/2, 350);
    text("Highscore: " + rallyhigh, width/2, 400);
  }


  //restart
  fill(255);
  tactileX      = 200;
  tactileY      = 450;
  tactileW      = 400;
  tactileH      = 100; 
  tactileWeight = 5;
  tactileStroke = #000000;
  tactile();
  rect(width/2 - 200, 450, 400, 100);
  textSize(50);
  fill(140, 58, 81);
  text("Home", width/2, 490);
}

void gameoverClicks() {
  if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > 450 && mouseY < 550) {
    mode = INTRO;
    clapping.pause();
    clapping.rewind();
    reset();
  }
}
