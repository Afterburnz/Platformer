import fisica.*;
FWorld world;

color black = #000000;
color green = #00FF00;
color red = #FF0000;
color blue = #0000FF;
color orange = #F0A000;
color brown = #996633;
color white = #ffffff;

PImage map;
int gridSize = 8;
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
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      if (c == black) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
      }
    }
  }
}
void loadPlayer(){
  player = new FPlayer();
  world.add(player);
}
void draw() {
  background(white);
  world.step();
  world.draw();
  player.act();
}
