Ball ball;
Bat bat;

void setup(){
  size(600,600);
  frameRate(60);
  ball = new Ball();
  bat = new Bat();
}

void draw(){
  background(0);
  stroke(255);
  ball.move();
  ball.display();
  bat.move();
  bat.display();
}


  
