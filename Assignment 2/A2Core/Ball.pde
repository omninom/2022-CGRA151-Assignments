class Ball {
  float r;    //radius
  PVector c;  // vector of center of circle
  float vx, vy;    // x velocity of circle, y velocity of circle
  
  Ball(){
    r = 20;    
    c = new PVector(r, 100);
    vx = 2;
    vy = 2;
  }
  
  void move(){
    c.x += vx;
    c.y += vy;
    if (c.x > width - r){  //right edge
      vx *= -1;
      c.x = width-r;    //pop outside
    }
    else if (c.x < r){    // left edge
      vx*=-1;
      c.x = r;
    }
    if (c.y > height - r){
      vy *= -1;
      c.y = height-r;
    }
    else if (c.y < r){
      vy *= -1;
      c.y = r;
    }
    
    boolean circleAbove = (c.y < bat.getVector().y);
    boolean circleBelow = (c.y > bat.getVector().y+bat.getHeight());
    boolean circleLeft = (c.x < bat.getVector().x);
    boolean circleRight = (c.x > bat.getVector().x+bat.getWidth());
    
    if (circleAbove && checkCollision(c, bat.getVector())){    //above bat collision
      vy*=-1;
      c.y = bat.getVector().y-r;    //pop ball outside of bat
      println("top");
    }
    else if (circleBelow && checkCollision(c, bat.getVector())){    // below bat collision
      vy*=-1;
      c.y = bat.getVector().y+bat.getHeight()+r;
      println("bottom");
    }
    else if (circleLeft && checkCollision(c, bat.getVector())){    //left bat collision
      vx*=-1;
      c.x = bat.getVector().x-r;
      println("Left");
    }
    else if (circleRight && checkCollision(c, bat.getVector())){    //right bat collision
      vx*=-1;
      c.x = bat.getVector().x+bat.getWidth()+r;
      println("Right");
    }
    

  }
  
  boolean checkCollision(PVector ball, PVector bat){
    PVector pointOnRect = new PVector(0,0);
    pointOnRect.x = constrain(ball.x, bat.x, bat.x + 150);
    pointOnRect.y = constrain(ball.y, bat.y, bat.y + 25);
    PVector circleToRect = pointOnRect.sub(ball);
    return (circleToRect.mag() < 20); 
  }
  
  
  
  void display(){
    ellipse(c.x, c.y, 2*r, 2*r);
  }
  
  PVector getVector(){
    return c;
  }
}
