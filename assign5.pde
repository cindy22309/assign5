Bar myBar;
Ball myBall;
Brick [] myBrick;
int []life; 
int status;
int x;
int y;
int n;
int nn=3;
int lifelife=3;
int disappear=0;
int currentFrame=0;
final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_LOSE = 2;
final int GAME_WIN = 3;
final int CHEAK_WIN=4;
void setup(){
  size(640,480); 
  
   myBar = new Bar();
   myBall = new Ball();

  myBrick=new Brick[100];
   for(int n=0;n<24;n=n+1){
  
    x=(int)50+(int)(n%12)*50;
    y=50+50*(int)(n/12);
   myBrick[n]= new Brick(x,y);
  
myBrick[n].hit=0 ;

  }
 
}

   
void draw(){
 // frameRate(20);
  background(0);
  life();

   switch(status) {

  case GAME_START:
    /*---------Print Text-------------*/
   myBall.begin();
   myBar.move();       //Move Bar
  myBar.display();
  cheakBrick();
   Begin();
  life();
 
    /*--------------------------------*/
    break;
  
  case GAME_PLAYING:
  myBar.move();       //Move Bar
  myBar.display();    //Draw Bar
  myBall.move();       //Move Ball
  myBall.display(); 
  cheakBrick();
  myBall.xx=random(2,5); 
  myBall.yy=random(2,5);
  if(currentFrame>=60){
    boom();
    currentFrame=0;
  }
  currentFrame++;
    //Draw Ball
   break;
   
   case GAME_LOSE:
   textAlign(CENTER);
    textSize(60);
    text("GAMELOSE",320,240);
    if (key == ENTER){
      
      reset();
      
    }
   
   break;
   
   case GAME_WIN:
    textAlign(CENTER);
    textSize(60);
    text("GAMEWIN",320,240);
    if (key == ENTER){
      
      reset();
      
    }
    break;
 
}
}
void Begin() {
if (mousePressed && (mouseButton == RIGHT)){
  status=GAME_PLAYING;

}
}
void life(){
    textAlign(CENTER);
    textSize(20);
    text("LIFE",50,450);
  
    int []life = new int[3];
   
    for (int n = 0; n < nn; n++ ) {
         
      life[n] =n;
    ellipse(100+30*n,440,15,15);
     if(myBall.y>height){
    
   lifelife-=1;
   nn-=1;
    myBall.y=height;
    
   status=GAME_START;
     }
  if(lifelife==0){
  status=GAME_LOSE;

  }
     } 
    }

  
void reset(){
   nn=3;
   lifelife=3;
    for(int n=0;n<24;n=n+1){
  
    x=(int)50+(int)(n%12)*50;
    y=50+50*(int)(n/12);
   myBrick[n]= new Brick(x,y);
 myBrick[n].hit=0 ;}
   status=GAME_START;
}


void boom(){
  int tmp=0;
  for(int n=0;n<24;n=n+1) {
   if(myBrick[n].hit ==1){
     tmp++;
   }
  }
  println(tmp);
  if(tmp==24){
     status=GAME_WIN;
  }
}


void cheakBrick(){
// frameRate(20);
  for(int n=0;n<24;n=n+1) {
  if(myBrick[n].hit== 0){
      myBrick[n].display();
  }
  
      if(myBall.isHit(myBall.x , myBall.y , myBall.ssiz , myBrick[n].bX , myBrick[n].bY , myBrick[n].bssiz , myBrick[n].bssiz) == true){
      myBrick[n].hit = 1 ;
     // checkcheck();
     // checkk();
      }
   }
 }

