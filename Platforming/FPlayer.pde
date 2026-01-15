class FPlayer extends FGameObject {

  int frame;
  int direction;



  FPlayer() {
    super();
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
      setVelocity(-300, vy);
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity(300, vy);
      action = run;
      direction = R;
    }
    if (isTouching("ground") || isTouching("ice") || isTouching("wall") || isTouching("treetop") || isTouching("bridge") || isTouching("checkpoint")){
      if (wkey) {
        setVelocity(vx, -600);
        if (abs(vy) > 0.1) {
          action = jump;
        }
      }
    }
  }

  void collision() {
    if (isTouching("spike")) {
      setPosition(spawnX,spawnY);
    }
    if (isTouching("checkpoint")){
      spawnX = getX();
      spawnY = getY();
    }
  }
  
  void respawn(){
    if (getY() > gridSize * 100){
      setPosition(spawnX,spawnY);
    }
  }
}
