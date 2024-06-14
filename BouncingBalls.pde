float circleX=0;  //random(0,100);
float circleY=0;
float speedX=3;
float speedY=3;

float b;
float h;
float a;
float c;

int score=0;
int time=2000;

void setup() {
  size(800,400);
}

void draw() {
  background(0);
  
  createBall();
  createBase();
  moveBall();
  checkEdges();
  checkScore();
  startGame();
  endGame();
  showScore();
}

void createBall() {
  ellipse(circleX,circleY,25,25);
} 

void createBase() {
  rect(mouseX,height-h,b=60,h=20);
}

void moveBall() {
  circleX=circleX+speedX;
  circleY=circleY+speedY;
}

void checkEdges() {
  if(circleX<0||circleX>width){
    speedX=speedX*-1;
  }
  
  if(circleY<0||circleY>height){
    speedY=speedY*-1;
  }
}

void checkScore() {
  if(circleX>=mouseX&&circleX<=mouseX+b/2&&circleY>height-25&&speedX>0){ //parte sx, palla verso dx -> sx
    score=score+1;
    speedX=speedX*-1;
    speedY=speedY*-1;
  }
  
  else if(circleX>=mouseX&&circleX<=mouseX+b/2&&circleY>height-25&&speedX<0){ //parte sx, palla verso sx -> sx
    score=score+1;
    speedX=speedX*1;
    speedY=speedY*-1;
  }
  
  if(circleX>mouseX+b/2&&circleX<=mouseX+b&&circleY>height-25&&speedX<0){ //parte dx, palla da dx -> sx
    score=score+1;
    speedX=speedX*-1;
    speedY=speedY*-1;
  }
  
  else if(circleX>mouseX+b/2&&circleX<=mouseX+b&&circleY>height-25&&speedX>0){ //parte dx, palla da sx -> sx
    score=score+1;
    speedX=speedX*1;
    speedY=speedY*-1;
  }
}

void startGame() {
  if(circleX>0&&circleX<width&&circleY>0&&circleY<height&&time>0){
    time=time-1;
  }
}

void endGame() {
  if(time==0){
    text("YOUR SCORE: " + score,100,100); 
    speedX=0;
    speedY=0;
    time=0;
  }
}

void showScore() {
  println("TIME: " + time + " SCORE: " + score);
}
