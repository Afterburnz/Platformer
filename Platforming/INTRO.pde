
PImage i;
PImage[] gif;
int numberOfFrames = 77;
int t = 0;

void intro() {
  background(black);
  fill(white);
  gif = new PImage[numberOfFrames];


  t = t+1;
  if (t>=numberOfFrames) t = 0;
  gif[t] = loadImage("frame_"+t+"_delay-0.04s.gif");

  image(gif[t], 0, 0, width, height);

  textAlign(CENTER);
  textSize(67);
  fill(yellow);
  text("Temu Mario", width/2, 100);
  fill(orange);
  text("p to puase", width/2, 200);

  if (myButtons[0].clicked && mode ==0) {
    mode =1;
    loadWorld(map);
    loadPlayer();
  }
  myButtons[0].show();
}
