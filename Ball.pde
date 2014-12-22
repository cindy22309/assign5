class Ball{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float ssiz;
  int life=3;
  float xx;
  float yy;
  void move(){
    x+=xSpeed;
    y+=ySpeed;
    life=3;
    if (x<ssiz/2 || x>width-ssiz/2){
      xSpeed *= -1;
    }
    if (y<ssiz/2){
      ySpeed *= -1;
    }
   
    float bottom = y+ssiz/2;
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
  ellipse(x,y,ssiz,ssiz);
  }else if(mouseX>580){
    x=580;
  y=height-60;
  ellipse(x,y,ssiz,ssiz);
  }else{
  x=mouseX;
  y=height-60;
  ellipse(x,y,ssiz,ssiz);}
  }
 
  void display(){
    ellipse(x,y,ssiz,ssiz);
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
    ssiz = 10;
  }
  
  Ball(float ssiz, float xSpeed){
    x = 10;
    y = 10;
    this.xSpeed = xSpeed;
    this.ySpeed = ssiz;
    this.ssiz = ssiz;
  }
}
