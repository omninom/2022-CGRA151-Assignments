void setup() {
  background(125);
  size(600,600);
}
void draw() {
  background(125);
  if (mousePressed) {
    fill(225, 0, 0);
  }
  else {
    fill(0, 0, 255);
  }
  ellipse(mouseX, mouseY, 100, 100);
}
