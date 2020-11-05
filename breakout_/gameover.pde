void gameover() {
  textAlign(CENTER);
  textSize(50);
  
  if (lives == 0) {
    fill(truered);
    loss.play();
    //loss.rewind();
    text("GAMEOVER", 400, 300);
    textSize(30);
    text("Click to Restart!", width/2, 500);

    //making it 3
    fill(darkblue);
    strokeWeight(1);
    stroke(darkblue);
    rectMode(CORNER);
    rect(235, 25, 200, 40);
    fill(blue);
    textSize(30);
    text("0", 245, 50);
  } else if (score == 22) {
    fill(blue);
    textSize(50);
    win.play();
    text("YOU WIN!", 400, 300);
    textSize(30);
    text("Click to Play Again!", width/2, 500);
  }
}

void gameoverClicks() {
  // reset "alive" for briks
  int i = 0;
  while (i < 22) {
    if ((score == 22) || (lives == 0)) {
      alive[i] = true;
      i = i + 1;
    }
  }
  // reset others
  mode = INTRO;
  lives = 3;
  bx = ballx = width/2;
  //ballx = width/2;
  bally = 500;
}
