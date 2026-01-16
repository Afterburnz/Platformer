class FHammer extends FGameObject {
  int direction = R;
  int speed = 50;
  int frame = 0;
  int turnTimer  = 0;
  int hammerTimer = 0;


  FHammer(float x, float y) {
    super(2);
    setPosition(x, y);
    setName("hammerbro");
    setRotatable(false);
  }
  void act() {
    animate();
    collide();
    move();
    turn();
    hammer();
  }

  void animate() {
    if (frame >= hammerbro.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(hammerbro[frame]);
      if (direction == L) attachImage(reverseImage(hammerbro[frame]));
      frame++;
    }
  }

  void turn() {
    turnTimer++;
    if (turnTimer > 150) {
      direction = direction *-1;
      turnTimer = 0;
    }
  }

  void collide() {
    if (isTouching("player")) {
      if (player.getY() < getY() - gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {
        loadWorld(map);
        loadPlayer();
      }
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }


  void hammer() {
    hammerTimer ++;

    if (hammerTimer > 30) {
      FHmr h = new FHmr(getX(), getY());
      h.setVelocity(direction*250, -200);
      world.add(h);
      enemies.add(h);
      hammerTimer = 0;
    }
  }
}
