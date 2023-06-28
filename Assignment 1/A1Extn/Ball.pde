class Ball{
  float x;
  float y;
  float radius;
  float xspeed;
  float yspeed;
  float r;
  float g;
  float b;
  
  Ball(){
    radius = random(0, 25);
    x = random(radius, width-radius);
    y = random(radius, height-radius);
    xspeed = random(0, 10);
    yspeed = random(0, 10);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  void move(){
    x += xspeed;
    y += yspeed;
    if (x + radius > width || x - radius < 0){
      xspeed = -xspeed;
    }
    if (y + radius> height || y - radius < 0){
      yspeed = -yspeed;
    }
  }
  
  void display(){
    noStroke();
    fill(r, g, b, 125);
    ellipseMode(RADIUS);
    ellipse(x, y, radius, radius);
  }
}
