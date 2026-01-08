class FThwomp extends FGameObject {
  int frame = 0;

  FThwomp(float x, float y) {
    super();
    setPosition(x, y);
    setName("thwomp");
    setRotatable(false);
  }

  void act() {
  }

  void collision() {
    if (isTouching("player")) {
      if (player.getY() > getY()) {
        player.setPosition(0, 0);
      }
    }
    if (isTouching("ground")) {
    }
  }
}
