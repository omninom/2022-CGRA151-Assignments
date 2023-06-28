PImage background1;
PImage background2;
PImage background3;

PImage spriteSheet;
int charDim = 56;
PImage[] idle = new PImage[6];
PImage[] run = new PImage[8];
PImage[] jump1 = new PImage[8];
PImage[] jump2 = new PImage[8];


int floor = 180-10-charDim;
int playerX = 300;
int playerY = floor;

double xSpeedAdder = 5;

int cameraX = 0;
boolean keyLeft, keyRight, keyUp, jump, fall;
String lastKey = "RIGHT";

void setup() {
  size(640, 180);
  background1 = loadImage("https://ecs.wgtn.ac.nz/foswiki/pub/Courses/CGRA151_2022T2/Assignment3/background_layer_1_sm.png");
  background2 = loadImage("https://ecs.wgtn.ac.nz/foswiki/pub/Courses/CGRA151_2022T2/Assignment3/background_layer_2_sm.png");
  background3 = loadImage("https://ecs.wgtn.ac.nz/foswiki/pub/Courses/CGRA151_2022T2/Assignment3/background_layer_3_sm.png");

  spriteSheet = loadImage("https://ecs.wgtn.ac.nz/foswiki/pub/Courses/CGRA151_2022T2/Assignment3/char_blue.png");
  for (int i = 0; i < idle.length; i++){
    idle[i] = spriteSheet.get(i*charDim, 0, charDim, charDim);
  }
  for (int i = 0; i < run.length; i++){
    run[i] = spriteSheet.get(i*charDim, 112, charDim, charDim);
  }
  for (int i = 0; i < jump1.length; i++){
    jump1[i] = spriteSheet.get(i*charDim, 168, charDim, charDim);
  }
  for (int i = 0; i < jump2.length; i++){
    jump2[i] = spriteSheet.get(i*charDim, 224, charDim, charDim);
  }
  

  
}

void draw() {
  if (playerX > 0.8*width && keyRight) {
    cameraX++;
    xSpeedAdder = 0;
  }
  else if (playerX < 0.2*width && keyLeft) {
    cameraX--;
    xSpeedAdder = 0;
  }
  else {
    xSpeedAdder = 5;
  }
  drawParallax(cameraX);
  move();
  drawCharacter();
  
  
}

int world2ScreenX(int x, int y, int z){
  return (x - cameraX)/z;
}

int world2ScreenX(int x){
  return (x - cameraX);
}

void drawParallax(int cameraX){
  image(background1, world2ScreenX(background1.width*(cameraX/background1.width), 0, 3), 0);
  image(background1, world2ScreenX(background1.width*(cameraX/background1.width+1), 0, 3), 0);    //right copy
  image(background1, world2ScreenX(background1.width*(cameraX/background1.width-1), 0, 3), 0);     //left copy
  image(background2, world2ScreenX(background2.width*(cameraX/background2.width), 0, 2), 0);
  image(background2, world2ScreenX(background2.width*(cameraX/background2.width+1), 0, 2), 0);    //right copy
  image(background2, world2ScreenX(background2.width*(cameraX/background2.width-1), 0, 2), 0);   //left copy
  image(background3, world2ScreenX(background3.width*(cameraX/background3.width), 0, 1), 0);
  image(background3, world2ScreenX(background3.width*(cameraX/background3.width+1), 0, 1), 0);    //right copy
  image(background3, world2ScreenX(background3.width*(cameraX/background3.width-1), 0, 1), 0);    //left copy
  
  
}

int animFrame(PImage[] sprite){
  return (frameCount/4)%sprite.length;
}

void drawCharacter(){
  if (keyRight && playerY == floor) {
    image(run[animFrame(run)], playerX, playerY);
  }
  else if (keyLeft && playerY == floor) {
    pushMatrix();
    scale(-1,1);
    image(run[animFrame(run)], -playerX-run[animFrame(run)].width, playerY);
    popMatrix();
  }
  
  else if (jump && lastKey.equals("RIGHT") || keyUp && lastKey.equals("RIGHT")){
    image(jump1[animFrame(jump1)], playerX, playerY);
    if (fall){
      image(jump2[animFrame(jump2)], playerX, playerY);
    }
  }
  
  else if (jump && lastKey.equals("LEFT") ||keyUp && lastKey.equals("LEFT")){
    pushMatrix();
    scale(-1,1);
    image(jump1[animFrame(jump1)], playerX, playerY);
    popMatrix();
  }
  
  
  else if (!keyLeft && lastKey.equals("LEFT")){
    pushMatrix();
    scale(-1,1);
    image(idle[animFrame(idle)], -playerX-idle[animFrame(idle)].width, playerY);
    popMatrix();
  }
  else if (!keyRight && lastKey.equals("RIGHT")){
    image(idle[animFrame(idle)], playerX, playerY);
  }
  
}


void move() {
  int weight = 1;
  int jumpPower = 28;
  if(keyLeft) playerX-= xSpeedAdder;
  if(keyRight) playerX+= xSpeedAdder;
  if(keyUp && playerY >= floor) {playerY-= jumpPower;  fall = true;}
  playerY += weight;
  if (playerY >= floor)  playerY = floor;        //stop falling through ground
  if (playerY == floor)  jump = false; fall = false;
  
  
}

void keyPressed() {
    if (keyCode == UP) {
      keyUp = true;
    }
    if (keyCode == LEFT) {
      keyLeft = true;
    }
    if (keyCode == RIGHT) {
      keyRight = true;
    }
}

void keyReleased() {
    if (keyCode == UP) {
      keyUp = false;
      jump = true;
    }
    if (keyCode == LEFT) {
      keyLeft = false;
      lastKey = "LEFT";
      
    }
    if (keyCode == RIGHT) {
      keyRight = false;
      lastKey = "RIGHT";
    }
}
