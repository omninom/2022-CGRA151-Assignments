class Bat {
  PVector rect;
  float rw, rh;
  
  Bat(){
    rect = new PVector(mouseX, mouseY);
    rw = 150;
    rh = 25;
  }
  
  void move(){
    rect.x = mouseX;
    rect.y = mouseY;
  }
 
  void display(){
    rect(rect.x, rect.y, rw, rh);
  }
  
  PVector getVector(){
    return rect;
  }
  
  float getWidth(){
    return rw;
  }
  
  float getHeight(){
    return rh;
  }
}
