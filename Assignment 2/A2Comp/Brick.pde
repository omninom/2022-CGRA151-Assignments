class Brick {
  PVector brickRect;
  float bw, bh;
  float hit = 0;
  boolean brickDelete = false;
  
  Brick(float x, float y){
    brickRect = new PVector(x, y);    //brick vector
    bw = 50;
    bh = 20;
  }
  
  
  void display(){
    if (hit == 0){                                        //actions for when the brick is hit once, twice, then 3 times
      fill(0,255,0);
      rect(brickRect.x, brickRect.y, bw, bh);
    }
    else if (hit == 1){
      fill(255,255,0);
      rect(brickRect.x, brickRect.y, bw, bh);
    }
    else if (hit == 2){
      fill(255,0,0);
      rect(brickRect.x, brickRect.y, bw, bh);
    }
    else if (hit == 3){
      brickDelete = true;
      
    }
  }
  
  boolean status(){                  // returns status of the brick and whether it should be deleted
    return brickDelete;
  }
  
  PVector getVector(){
    return brickRect;
  }
  
  float getWidth(){
    return bw;
  }
  
  float getHeight(){
    return bh;
  }
  
  void setHit(){
    this.hit +=1;
  }
}
