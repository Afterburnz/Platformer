class FThwomp extends FGameObject {
  int frame = 0;
  int thwompMode = 0;
  int timer  = 0;
  final int wait = 0;
  final int fall = 1;
  final int rise = 2;


  FThwomp(float x, float y) {
    super();
    setPosition(x, y);
    setName("thwomp");
    setRotatable(false);
    setStatic(true);

  }

  void act() {
    collision();
    move();
    detection();
  }

  void collision() {
    if (isTouching("player")) {
      if (player.getY() > getY()) {
        player.setPosition(0, 0);
      }
    }
    if (isTouching("ground")) {
      timer = 300;
      if (timer <=0) {
        thwompMode = rise;
      }
    }
  }
  void move() {
    if (thwompMode == wait) {
      setStatic(true);
      
    }
    if (thwompMode == fall) {
      setStatic(false);
    }
    if (thwompMode == rise) {
      setStatic(true);
      setVelocity(0, -50);
    }
  }

  void detection() {
    if (player.getX() > getX() && player.getX() < getX() + gridSize && player.getY() > getY()) {
      thwompMode = fall;
    }
  }
}
