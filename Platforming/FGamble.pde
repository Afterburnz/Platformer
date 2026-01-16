class FGamble extends FGameObject {
  int timer = 0;
  int boostTimer = 0;
  FGamble(float x, float y) {
    super();
    setPosition(x, y);
    setName("gamble");
    setStatic(true);
  }

  void act() {
    imageSwitch();
    collision();
    println(speed);
    
  }
  void collision() {
    float randomizer = random(0, 1);
    if (timer <=0) {
      if (isTouching("player")) {
        if (randomizer <0.25) {
          speed = speed*0.25;
        }
        if (randomizer >=0.25 && randomizer <0.5) {
          speed = speed*0.5;
        }
        if (randomizer >=0.5 && randomizer <0.75) {
          speed = speed * 1.5;
        }
        if (randomizer >=0.75) {
          speed = speed * 2;
        }
        timer = 300;
        boostTimer = -300;
      }
    }
    if (boostTimer >0){
      speed = 300;
    }
    timer --;
    boostTimer ++;
  }

  void imageSwitch() {
    if (timer <=0) {
      attachImage(gamble);
    } else {
      attachImage(gambleActive);
    }
  }
}
