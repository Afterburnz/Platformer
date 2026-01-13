class FThwomp extends FGameObject {
  int frame = 0;
  int thwompMode = 0;
  int timer  = 0;
  final int wait = 0;
  final int fall = 1;
  final int rise = 2;
  float startPosX;
  float startPosY;


  FThwomp(float x, float y) {
    super(2);
    setPosition(x, y);
    startPosX = x;
    startPosY = y;
    setName("thwomp");
    setRotatable(false);
    setStatic(true);
  }

  void act() {
    collision();
    move();
    detection();
    println(thwompMode);
    setPosition(startPosX, getY());
  }

  void collision() {
    if (isTouching("player")) {
      if (player.getY() > getY()+ gridSize) {
        player.setPosition(0, 0);
      }
    }
    if (isTouching("ground") || isTouching("ice") || isTouching("spike") || isTouching("treetop")) {
      if (timer <=0) {
        thwompMode = rise;
      }
      timer--;
    }
  }
  void move() {
    if (thwompMode == wait) {
      setStatic(true);
      timer = 300;
      attachImage(thwomp[0]);
    }
    if (thwompMode == fall) {
      setStatic(false);
      attachImage(thwomp[1]);
    }
    if (thwompMode == rise) {
      setStatic(false);
      setVelocity(0, -100);
      attachImage(thwomp[0]);
    }
  }

  void detection() {
    if (thwompMode == wait && player.getX() > getX() && player.getX() < getX() + gridSize && player.getY() > getY()) {
      thwompMode = fall;
    }
    if (thwompMode == rise && getY() <= startPosY) {
      thwompMode = wait;
    }
  }
}
