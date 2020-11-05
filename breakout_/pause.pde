void pause() {
  fill(0);
  textSize(40);
  textAlign(CENTER);
  fill(mango);
  text("GAME PAUSED", 400, 300);
}

void pauseClicks() {
  mode = GAME;
  rect(690, 475, 7, 50);
  rect(710, 475, 7, 50);
}
