class FNoJump extends FGameObject {
  FNoJump(float x, float y) {
    super();
    setPosition(x, y);
    setName("nojump");
    attachImage(noJump);
    setStatic(true);
    setFriction(24);
  }

  void act() {
    collision();

  }

  void collision() {
    if (isTouching("player")) {
      jumpHeight = 0;
    } else {
      jumpHeight = -500;
    }
  }
}
