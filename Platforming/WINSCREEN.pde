void winscreen() {
  background(black);
  fill(white);
  gif = new PImage[numberOfFrames];
  t = t+1;
  if (t>=numberOfFrames) t = 0;
  gif[t] = loadImage("frame_"+t+"_delay-0.04s.gif");
  image(gif[t], 0, 0, width, height);
  textAlign(CENTER);
  textSize(125);
  text("GG", width/2, 100);
  if (myButtons[1].clicked && mode == WINSCREEN) {
    mode =INTRO;
  }
  myButtons[1].show();
}
