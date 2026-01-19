class FHmr extends FGameObject {
  int timer  = 0;
  int hammerDeletionTimer = 0;

  FHmr(float x, float y) {
    super();
    setPosition(x, y);
    setName("hammer");
    setStatic(false);
    setSensor(true);
    attachImage(hammer);
    setAngularVelocity(67);
  }
  void act() {
    collide();
    deletion();
  }

  void collide() {
    if (isTouching("player")) {
      loadWorld(map);
      loadPlayer();
    }
  }
  
  void deletion(){
    hammerDeletionTimer++;
    if (hammerDeletionTimer > 45){
      world.remove(this);
    }
  }
}
