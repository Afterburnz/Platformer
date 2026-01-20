class FPlayer extends FGameObject {

  int frame;
  int direction;
  boolean speedChange;
  int boostTimer = 0;

  FPlayer() {
    super();
    speedChange = false;
    frame = 0;
    direction = R;
    setPosition(spawnX, spawnY);
    setName("player");
    setRotatable(false);
    setFillColor(red);
  }

  void act() {

    handleInput();
    collision();
    animate();
    respawn();
    if (boostTimer < 0) {
      speed = 300;
    }
    boostTimer --;
  }


  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (abs(vy) < 0.1) {
      action = idle;
    }

    if (akey) {
      setVelocity(-speed, vy);
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity(speed, vy);
      action = run;
      direction = R;
    }
    if (isTouching("ground") || isTouching("ice") || isTouching("wall") || isTouching("treetop") || isTouching("bridge") || isTouching("checkpoint")|| isTouching("thwomp")) {
      if (wkey) {
        setVelocity(vx, -500);
        if (abs(vy) > 0.1) {
          action = jump;
        }
      }
    }
  }

  void collision() {
    if (isTouching("spike")) {
      loadWorld(map);
      loadPlayer();
    }
    if (isTouching("checkpoint")) {
      spawnX = getX();
      spawnY = getY();
    }
  }

  void respawn() {
    if (getY() > gridSize * 100) {
      setPosition(spawnX, spawnY);
    }
  }
  void gambling() {
    float randomizer = random(0, 1);
    if (speedChange == true) {
      if (boostTimer <0) {
        if (randomizer <0.25) {
          speed = 75;
        }
        if (randomizer >=0.25 && randomizer <0.5) {
          speed = 150;
        }
        if (randomizer >=0.5 && randomizer <0.75) {
          speed = 450;
        }
        if (randomizer >=0.75) {
          speed = 600;
        }
        boostTimer = 120;
      }
    }
  }
}
