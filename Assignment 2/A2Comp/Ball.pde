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
    if (c.y > height - r){  // bottom edge
      vy *= -1;
      c.y = height-r;
    }
    else if (c.y < r){    // top edge
      vy *= -1;
      c.y = r;
    }
    
    boolean circleAbove = (c.y < bat.getVector().y);                      //check if circle is above bat
    boolean circleBelow = (c.y > bat.getVector().y+bat.getHeight());
    boolean circleLeft = (c.x < bat.getVector().x);
    boolean circleRight = (c.x > bat.getVector().x+bat.getWidth());
    
    if (circleAbove && checkCollision(ball, bat)){    //above bat collision
      vy*=-1;
      c.y = bat.getVector().y-r;    //pop ball outside of bat
      println("top");
    }
    else if (circleBelow && checkCollision(ball, bat)){    // below bat collision
      vy*=-1;
      c.y = bat.getVector().y+bat.getHeight()+r;
      println("bottom");
    }
    else if (circleLeft && checkCollision(ball, bat)){    //left bat collision
      vx*=-1;
      c.x = bat.getVector().x-r;
      println("Left");
    }
    else if (circleRight && checkCollision(ball, bat)){    //right bat collision
      vx*=-1;
      c.x = bat.getVector().x+bat.getWidth()+r;
      println("Right");
    }
   
    
    for (int i = 0; i < bricks.length; i++){
      if (c.y < bricks[i].getVector().y && checkCollision(ball, bricks[i]) || c.y > bricks[i].getVector().y+bricks[i].getHeight() && checkCollision(ball, bricks[i])){
        vy*=-1;
        bricks[i].setHit();
      }
      else if (c.x <bricks[i].getVector().x && checkCollision(ball, bricks[i]) || c.x > bricks[i].getVector().x+bricks[i].getWidth() && checkCollision(ball, bricks[i])){
        vx*=-1;
        bricks[i].setHit();
      }
      if (bricks[i].status()){
        bricks[i].getVector().set(0,0);
      }
        
    }
   
  }
  
  boolean checkCollision(Ball ball, Bat bat){      //check collision using centre of circle clamped to the sides of rectangle    https://learnopengl.com/In-Practice/2D-Game/Collisions/Collision-Detection
    PVector pointOnRect = new PVector(0,0);
    pointOnRect.x = constrain(ball.getVector().x, bat.getVector().x, bat.getVector().x + bat.getWidth());
    pointOnRect.y = constrain(ball.getVector().y, bat.getVector().y, bat.getVector().y + bat.getHeight());
    PVector circleToRect = pointOnRect.sub(ball.getVector());
    return (circleToRect.mag() < 20); 
  }
  
  boolean checkCollision(Ball ball, Brick brick){
    PVector pointOnRect = new PVector(0,0);
    pointOnRect.x = constrain(ball.getVector().x, brick.getVector().x, brick.getVector().x + brick.getWidth());
    pointOnRect.y = constrain(ball.getVector().y, brick.getVector().y, brick.getVector().y + brick.getHeight());
    PVector circleToRect = pointOnRect.sub(ball.getVector());
    return (circleToRect.mag() < 20); 
  }
  
  void display(){
    fill(255);
    ellipse(c.x, c.y, 2*r, 2*r);
  }
  
  PVector getVector(){
    return c;
  }
}
