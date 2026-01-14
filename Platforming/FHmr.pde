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
      player.setPosition(0, 0);
    }
  }
  
  void deletion(){
    hammerDeletionTimer++;
    if (hammerDeletionTimer > 450){
      world.remove(this);
    }
  }
}
