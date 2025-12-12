import fisica.*;
FWorld world;

color yellowGreen = #a8e61d;
color black = #000000;
color green = #22b14c;
color red = #ed1c24;
color blue = #00b7ef;
color orange = #F0A000;
color brown = #9c5a3c;
color white = #ffffff;
color lightGreen = #d3f9bc;
PImage map, treeIntersect, treeTrunk, treeTopCenter, treeTopE, treeTopW;
int gridSize = 16;
float zoom = 1.5;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, qkey, ekey, spacekey;
FPlayer player;

void setup() {
  size(600, 600);
  Fisica.init(this);
  map = loadImage("map.png");
  loadWorld(map);
  loadPlayer();
}
void loadWorld(PImage map) {

  world = new FWorld(-4000, -4000, 4000, 4000);
  world.setGravity(0, 900);

  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      if (c == black) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
        b.setFillColor(black);
        b.setNoStroke();
      }
      if (c == blue) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
        b.setFillColor(blue);
        b.setNoStroke();
      }
      if (c == brown) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
        b.setFillColor(brown);
        b.setNoStroke();
      }
      if (c == yellowGreen) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
        b.setFillColor(yellowGreen);
        b.setNoStroke();
      }
      if (c == lightGreen) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
        b.setFillColor(lightGreen);
        b.setNoStroke();
      }
      if (c == green) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
        b.setFillColor(green);
        b.setNoStroke();
      }
      if (c == red) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
        b.setFillColor(red);
        b.setNoStroke();
      }
    }
  }
}
void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}
void draw() {
  background(white);
  drawWorld();
  player.act();
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()* zoom + width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
