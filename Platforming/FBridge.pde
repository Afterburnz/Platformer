class FBridge extends FGameObject {
  FBridge(float x, float y) {
    super();
    setPosition(x, y);
    setName("bridge");
    attachImage(bridge);
    setStatic(true);
    setFriction(24);
  }

  void act() {
    collision();
  }

  void collision() {
    if (isTouching("player")) {
      setStatic(false);
      setSensor(true);
    }
  }
}
