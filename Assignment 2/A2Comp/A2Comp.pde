Ball ball;
Bat bat;
Brick[] bricks = new Brick[12];

void setup(){
  size(600,600);
  frameRate(60);
  ball = new Ball();
  bat = new Bat();
  for (int i = 0; i < bricks.length; i++){
    float x = (50+10)*i;
    float y = 20;
    bricks[i] = new Brick(x, y);
  }
}

void draw(){
  background(0);
  stroke(255);
  ball.move();
  ball.display();
  bat.move();
  bat.display();
  for (int i = 0; i < bricks.length; i++){
    bricks[i].display();
  }
  
}


  
