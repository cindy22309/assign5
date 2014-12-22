class Brick {
  int bssiz = 35;
  int bX=140;
  int bY=60;
  int bSpeed=1;
  int hit = 0;
   Brick(int x, int y) {
    bX = x;
    bY = y;
  }
  void display() {
    fill(255, 255, 255);
    rect(bX, bY, bssiz, bssiz);
  }  
  
  void move() {
    bX+=bSpeed;
    if (bX+bssiz>=640||bX-bssiz<=0) {
      bSpeed*=-1;

    }
  }
 
}
