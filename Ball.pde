class Ball{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size;
  int life=3;
  float xx;
  float yy;
  void move(){
    x+=xSpeed;
    y+=ySpeed;
    life=3;
    if (x<size/2 || x>width-size/2){
      xSpeed *= -1;
    }
    if (y<size/2){
      ySpeed *= -1;
    }
   
    float bottom = y+size/2;
    float bl = myBar.y - 10/2;
    float bLeft = myBar.x-myBar.length/2;
    float bRight = myBar.x+myBar.length/2;
    if (bottom >= bl && x>bLeft && x<bRight){
        ySpeed *= -1;        
        y = bl;
    }
   
  }
  void begin(){

if (mouseX<60){
  x=60;
  y=height-60;
  ellipse(x,y,size,size);
  }else if(mouseX>580){
    x=580;
  y=height-60;
  ellipse(x,y,size,size);
  }else{
  x=mouseX;
  y=height-60;
  ellipse(x,y,size,size);}
  }
 
  void display(){
    ellipse(x,y,size,size);
    fill(255,255,255);
  }
  
  boolean isHit(
        float circleX,
        float circleY,
        float radius,
        float rectangleX,
        float rectangleY,
        float rectangleWidth,
        float rectangleHeight)
  {
      float circleDistanceX = abs(circleX - rectangleX);
      float circleDistanceY = abs(circleY - rectangleY);
   
      if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
      if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
   
      if (circleDistanceX <= (rectangleWidth/2)) { return true; }
      if (circleDistanceY <= (rectangleHeight/2)) { return true; }
   
      float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                           pow(circleDistanceY - rectangleHeight/2, 2);
   
      return (cornerDistance_sq <= pow(radius,2));
  }
  
  Ball(){
    x = 10;
    y = 10;
    xSpeed = 5+xx;
    ySpeed = 10+yy;
    size = 10;
  }
  
  Ball(float size, float xSpeed){
    x = 10;
    y = 10;
    this.xSpeed = xSpeed;
    this.ySpeed = size;
    this.size = size;
  }
}
