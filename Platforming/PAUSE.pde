
void pause() {
  background(black);
  fill(white);

  gif = new PImage[numberOfFrames];


  t = t+1;
  if (t>=numberOfFrames) t = 0;
  gif[t] = loadImage("frame_"+t+"_delay-0.04s.gif");

  image(gif[t], 0, 0, width, height);
  textAlign(CENTER);
  textSize(75);
  fill(pink);
  text("PAUSED", width/2, 100);
  if (myButtons[2].clicked && mode ==2) mode =1;
  myButtons[2].show();
}
