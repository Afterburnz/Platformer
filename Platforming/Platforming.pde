import fisica.*;
FWorld world;
float spawnX = 0;
float spawnY = 0;
color black = #000000;
color green = #22b14c;
color red = #ed1c24;
color blue = #00b7ef;
color orange = #F0A000;
color brown = #9c5a3c;
color white = #ffffff;
color purple = #6f3198;
color pink = #ffa3b1;
color yellow = #fff200;
color gray = #464646;
color turquoise = #09c5a3;
color lime = #a8e61d;
color crimson = #990030;
PImage map, treeIntersect, treeTrunk, treeTopCenter, treeTopE, treeTopW, spike, bridge, brick, ice, hammer, checkpoint, gamble, gambleActive;
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] action;
PImage[] goomba;
PImage[] thwomp;
PImage[] hammerbro;
float speed = 300;
int gridSize = 32;
float zoom = 1.5;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, qkey, ekey, spacekey;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
FPlayer player;

void setup() {
  size(600, 600);
  Fisica.init(this);
  terrain = new ArrayList<FGameObject>();
  loadImages();
  loadWorld(map);
  loadPlayer();
}

void loadImages() {
  map = loadImage("map.png");
  treeIntersect = loadImage("tree_intersect.png");
  treeTrunk = loadImage("tree_trunk.png");
  treeTopCenter = loadImage("treetop_center.png");
  treeTopE = loadImage("treetop_e.png");
  treeTopW = loadImage("treetop_w.png");
  spike = loadImage("spike.png");
  bridge = loadImage("bridge_center.png");
  brick = loadImage("brick.png");
  hammer = loadImage("hammer.png");
  checkpoint = loadImage("checkpoint.png");
  checkpoint.resize(gridSize, gridSize);
  gamble = loadImage("gambling.png");
  gamble.resize(gridSize, gridSize);
  gambleActive = loadImage("gamblingActivated.png");
  gambleActive.resize(gridSize, gridSize);
  idle = new PImage[2];
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");

  jump = new PImage[1];
  jump[0] = loadImage("jump0.png");

  run = new PImage[3];
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] = loadImage("runright2.png");

  action = idle;

  goomba = new PImage[2];
  goomba[0] = loadImage("goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1] = loadImage("goomba1.png");
  goomba[1].resize(gridSize, gridSize);

  thwomp = new PImage[2];
  thwomp[0] = loadImage("thwomp0.png");
  thwomp[0].resize(gridSize*2, gridSize*2);
  thwomp[1] = loadImage("thwomp1.png");
  thwomp[1].resize(gridSize*2, gridSize*2);

  hammerbro = new PImage[2];
  hammerbro[0] = loadImage("hammerbro0.png");
  hammerbro[0].resize(gridSize*2, gridSize*2);
  hammerbro[1] = loadImage("hammerbro1.png");
  hammerbro[1].resize(gridSize*2, gridSize*2);
  enemies=new ArrayList<>();
}
void loadWorld(PImage map) {
  terrain = new ArrayList<FGameObject>();
  enemies=new ArrayList<>();
  world = new FWorld(-4000, -4000, 4000, 4000);
  world.setGravity(0, 900);

  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      color s = map.get(x, y+1);
      color w = map.get(x-1, y);
      color e = map.get(x+1, y);
      if (c == black) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
        b.setFillColor(black);
        b.setNoStroke();
        b.attachImage(brick);
        b.setFriction(16);
        b.setName("ground");
      } else if (c == gray) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
        b.setFillColor(gray);
        b.setNoStroke();
        b.setFriction(16);
        b.attachImage(brick);
        b.setName("wall");
      } else if (c == blue) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
        b.setFillColor(blue);
        b.setNoStroke();
        b.setFriction(2);
        b.setName("ice");
      } else if (c == brown) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(treeTrunk);
        b.setName("trunk");
        b.setFillColor(brown);
        world.add(b);
      } else if (c == green && w != green) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.attachImage(treeTopW);
        b.setName("treetop");
        b.setFillColor(green);
        b.setFriction(16);
        world.add(b);
      } else if (c == green && e != green) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.attachImage(treeTopE);
        b.setName("treetop");
        b.setFriction(16);
        b.setFillColor(green);
        world.add(b);
      } else if (c == green && s == brown) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.attachImage(treeIntersect);
        b.setName("treetop");
        b.setFriction(16);
        b.setFillColor(green);
        world.add(b);
      } else if (c == green && w == green && e == green) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.attachImage(treeTopCenter);
        b.setName("treetop");
        b.setFriction(16);
        b.setFillColor(green);
        world.add(b);
      } else if (c == purple) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.attachImage(spike);
        b.setName("spike");
        b.setFillColor(purple);
        world.add(b);
      } else if (c == lime) {
        FBox b =  new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.attachImage(checkpoint);
        b.setName("checkpoint");
        b.setFillColor(lime);
        world.add(b);
        b.setFriction(16);
      } else if (c == pink) {
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      } else if (c == crimson) {
        FGamble gam = new FGamble(x*gridSize, y*gridSize);
        terrain.add(gam);
        world.add(gam);
      } else if (c == yellow) {
        FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      } else if (c == turquoise) {
        FThwomp thw = new FThwomp(x*gridSize, y*gridSize);
        enemies.add(thw);
        world.add(thw);
      } else if (c == red) {
        FHammer hmr = new FHammer(x*gridSize, y*gridSize);
        enemies.add(hmr);
        world.add(hmr);
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
  actWorld();
}
void actWorld() {
  player.act();
  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()* zoom + width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
