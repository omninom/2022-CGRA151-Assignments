Ball[] balls = new Ball[1];

void setup() {
  background(125);
  size(800,600);
  for (int i = 0; i < balls.length; i++){
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < balls.length; i++){
    balls[i].move();
    balls[i].display();
  }
}
