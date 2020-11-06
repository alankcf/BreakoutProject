void game() {
  intro.pause();
  background(darkblue);

  //pause indicator
  fill(white);
  stroke(white);
  rectMode(CORNER);
  rect(690, 475, 7, 50);
  rect(710, 475, 7, 50);

  // lives
  textSize(30);
  fill(blue);
  text("Lives:" + lives, width/4, 50);
  text("Score:" + score, 3*width/4, 50);
  timer = timer - 1;

  // paddles
  fill(mango);
  circle(mouseX, by, paddld);

  // ball
  fill(purple);
  strokeWeight(0);
  circle(ballx, bally, balld);

  // move ball
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }

  // limits to ball
  if (bally > height) {
    lives = lives - 1;
    ballx = width/2;
    bally = 500;
    timer = 100;
    life.play();
    life.rewind();
  }
  // limits to paddle
  if (mouseX + 50 > width - (paddld/2)) {
    mouseX = width - 55;
  } else if (mouseX < paddld/2) {
    mouseX = 0 + 55;
  }

  // collusion code
  if (bally < (balld/2)) {
    //wall
    vy = vy * -1;
    bounce.play();
    bounce.rewind();
  }

  if (ballx < (balld/2) || ballx > width-(balld/2)) {
    vx = vx * -1;
    bounce.play();
    bounce.rewind();
  }

  if (dist(mouseX, by, ballx, bally) <= (balld/2) + (bd/2)) {
    vx = ((ballx - mouseX)/15)* 1.2;
    vy = ((bally - by)/15) * 1.2;
    bounce.play();
    bounce.rewind();
  }
  if (lives == 0) {
    mode = GAMEOVER;
    loss.rewind();
  }

  if (score == 22) {
    mode = GAMEOVER;
    win.rewind();
  }
  // bricks
  int i = 0;
  //alive[i] = true;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i = i + 1; // i++
  }
}

void gameClicks() {
  mode = PAUSE;
  fill(yellow);
  stroke(darkblue);
  rectMode(CORNER);
  fill(darkblue);
  strokeWeight(2);
  rect(690, 475, 7, 50);
  rect(710, 475, 7, 50);
  fill(white);
  triangle(680, 475, 680, 525, 725, 500);
}

void manageBrick (int i) {
  //color changes
  if (y[i] == 100) fill(yellow);
  if (y[i] == 200) fill(orange);
  if (y[i] == 300) fill(white);
  if (y[i] == 400) fill(red);

  //disappearing ball when hit
  circle(x[i], y[i], brickd);
  if (dist(x[i], y[i], ballx, bally) <= (balld/2) + (brickd/2)) {
    vx = ((ballx - x[i])/15);
    vy = ((bally - y[i])/15);
    alive[i] = false;
    score = score + 1;
    point.play();
    point.rewind();
  }
}
