class Brick {
  int bSize = 35;
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
    rect(bX, bY, bSize, bSize);
  }  
  
  void move() {
    bX+=bSpeed;
    if (bX+bSize>=640||bX-bSize<=0) {
      bSpeed*=-1;

    }
  }
 
}
