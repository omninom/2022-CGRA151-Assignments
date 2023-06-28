background(125);
size(600,600);
float randomX = 0;
float randomY = 0;

for (int i= 0; i < 300; i++){
  randomX = random(0, width);
  randomY = random(0, height);
  triangle(randomX, randomY, random(randomX-60, randomX+60), random(randomY-60, randomY+60), random(randomX-60, randomX+60), random(randomY-60, randomY+60));
}
