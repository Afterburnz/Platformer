class FPlayer extends FGameObject {

  int frame;
  int direction;



  FPlayer() {
    super();
    frame = 0;
    direction = R;
    setPosition(0, 0);
    setName("player");
    setRotatable(false);
    setFillColor(red);
  }

  void act() {
    handleInput();
    collision();
    animate();
  }

  void animate() {
    if (frame >= action.length) frame = 0;
    if (frame % 5 == 0) {
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
      setVelocity(-200, vy);
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity(200, vy);
      action = run;
      direction = R;
    }
    if (wkey) {
      setVelocity(vx, -250);
      if (abs(vy) > 0.1) {
        action = jump;
      }
    }
  }

  void collision() {
    if (isTouching("spike")) {
      setPosition(0, 0);
    }
  }
}
