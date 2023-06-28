background(125);
size(600,600);

for (int i = 0; i < height; i++) {
  line(0, i*30, width, i*30);
}

float lastWidth = 0;
float randomWidth = random(0, 50);
float lastX = 0;

for (int y = 0; y < height; y += 30){
  for (float x = 0; x < width; x = lastX+lastWidth+5) {
    rect(x, y, randomWidth, 30);
    lastWidth = randomWidth;
    lastX = x;
    randomWidth = random(0, 50);
  }
}
