void reset() {
  timer = 100;
  leftscore = 0;
  rightscore = 0;
  rallyscore = 0;
  lefty = height/2;
  righty = height/2;
  ballx = width/2;
  bally = height/2;
  vx = random(-5, 6);
  vy = random(-5, 7);
  while (vx <= 2 && vx >= -2) {
    vx = random(-5, 6);
  }
  while (vy <= 2 && vy >= -2) {
    vy = random(-5, 7);
  }
}

void tactile() {
  if (mouseX > tactileX && mouseX < tactileX + tactileW && mouseY > tactileY && mouseY < tactileY + tactileH) {
    stroke(tactileStroke);
    strokeWeight(tactileWeight);
    fill(tactileFill);
    tactileOn = true;
  } else {
    strokeWeight(2);
    stroke(0);
    tactileOn = false;
  }
}


void music (){
  if (music.isPlaying() == false) { 
    music.rewind();
  }
  music.play();

}
