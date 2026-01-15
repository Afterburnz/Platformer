class FGameObject extends FBox {
  final int L = -1;
  final int R = 1;
  FGameObject() {
    super(gridSize, gridSize);
  }
  FGameObject(int size){
    super(gridSize*size,gridSize*size);    
  }
  
  
  void act() {
  }

  boolean isTouching(String n) {
    ArrayList<FContact> contacts = getContacts();

    for ( int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      //FBody a = fc.getBody1();
      //FBody b = fc.getBody2();
      //if (this == a) return fc.getBody2().getName()==n;
      //else return fc.getBody1().getName()==n;
      if (fc.contains(n)) return true;
    }
    return false;
  }


}
