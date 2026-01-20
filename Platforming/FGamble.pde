class FGamble extends FGameObject {
  int timer = 0;
  FGamble(float x, float y) {
    super();
    setPosition(x, y);
    setName("gamble");
    setStatic(true);
    setFriction(24);
  }

  void act() {
    imageSwitch();
    collision();
    println(speed);
  }
  void collision() {

    if (isTouching("player")) {
      player.speedChange = true;
      timer = 120;
      player.gambling();
    }

  
    if (timer < 0) {
      player.speedChange = false;
    }
    timer --;
  }

  void imageSwitch() {
    if (timer <=0) {
      attachImage(gamble);
    } else {
      attachImage(gambleActive);
    }
  }
} 
