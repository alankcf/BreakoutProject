void intro () {
  intro.play();
  background(darkblue);
  
  //gif
  image(space[frame], 0, 0, width, height);
  frame = frame + 1;
  if (frame == 9) {
    frame = 0;
  }
  
  fill(truered);
  strokeWeight(3);
  textSize(100);
  textAlign(CENTER);
  text("BREAKOUT", 400, 200);
  textSize(51);
  text("Click to Begin", width/2, 500);
}

void introClicks() {
  mode = GAME;
  lives = 3;
  score = 0;
}
