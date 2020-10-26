void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  } else if (mode == OPTIONS){
    optionClicks();
  } else {
    System.out.println("Mode error: " + mode);
  }
}


void mouseDragged() {
  if (mode == OPTIONS) {
    controlSlider();
  }
}
