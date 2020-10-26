void game() {


  //visuals
  background(#FFFDD0);
  strokeWeight(10);
  stroke(255);
  line(width/2, 0, width/2, 600);
  strokeWeight(0);

  music();



  //scoreboard
  if (rally == true) {
    stroke(0);
    square(360, 70, 80);
    textSize(80);
    fill(#cd7f32);
    text(rallyscore, width/2, 100);
    timer--;
  } else {
    fill(255);
    square(160, 65, 80);
    textSize(65);
    fill(#C0C0C0);
    text(leftscore, width/4, 100);
    fill(255);
    square(560, 65, 80);
    fill(#FFD700);
    text(rightscore, 3*width/4, 100);
    //timer
    // text(timer, 3*width/4, 550);
    timer--;
  }

  //tip
  textSize(40);
  fill(0);
  if (timer > 0 && leftscore == 0 && rightscore == 0) {
    text("Click anywhere or press space to pause!", width/2, 500);
  }



  //paddles
  strokeWeight(3);
  stroke(0);
  fill(#FF7003);
  circle(leftx, lefty, leftd);
  fill(#03F9FF);
  circle(rightx, righty, rightd);

  //move paddles
  if (wkey == true && lefty > 100) lefty = lefty - 5;
  if (skey == true && lefty < 500) lefty = lefty + 5;

  if (AI == false) {
    if (upkey == true && righty > 100) righty = righty - 5;
    if (downkey == true && righty < 500) righty = righty + 5;
  } else {
    if (ballx > width/2) {
      if (bally > righty && righty < 500) righty = righty + 5;
      if (bally < righty && righty > 100) righty = righty - 5;
    }
  }

  //ball
  fill(255);
  circle(ballx, bally, balld);
  image(PogFish, ballx-balld/2, bally-balld/2, balld, balld);
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }


  //bouncing
  if (bally <= balld/2  || bally > height-balld/2) {
    wallpong.rewind();
    wallpong.play();
    vy = vy * -1;
  }
  if (dist(ballx, bally, leftx, lefty) <= balld/2 + leftd/2) {
    leftpong.rewind();
    leftpong.play();
    vx = (ballx - leftx)/15;
    vy = (bally - lefty)/15;
    if (rally == true && timer <= -80) {
      rallyscore++;
      timer = -50;
    }
  } else if (dist(ballx, bally, rightx, righty) <= balld/2 + rightd/2) {
    rightpong.rewind();
    rightpong.play();
    vx = (ballx - rightx)/15;
    vy = (bally - righty)/15;
    if (rally == true && timer <= -80) {
      rallyscore++;
      timer = -50;
    }
  }


  //limits?
  if (bally <= 50) {
    bally = 50;
  }

  if (bally >= 550) {
    bally = 550;
  }




  //scoring
  if (ballx < 0) {
    if (rally == false) {
      score.rewind();
      score.play();
      rightscore++; 
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

      lefty = height/2;
      righty = height/2;

      timer = 100;
    } else {
      mode = GAMEOVER;
    }
  }



  if (ballx > width) {
    if (rally == false) {
      score.rewind();
      score.play();
      leftscore++; 
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

      lefty = height/2;
      righty = height/2;

      timer = 100;
    } else {
      if (rallyscore > rallyhigh) rallyhigh = rallyscore;
      mode = GAMEOVER;
    }
  }

  //ending the game
  if (rally == false) {
    if (leftscore == 3) {
      mode = GAMEOVER;
    }

    if (rightscore == 3) {
      mode = GAMEOVER;
    }
  }
}


void gameClicks() {
  mode = PAUSE;
}
