size(750, 800);
background(255);

fill(0, 0, 255);
rect(50, 100, 300, 150); 

fill(0, 255, 0);
ellipseMode(CORNER);
ellipse(50, 300, 300, 150);

fill(255, 0, 0);
triangle(50, 550, 200, 500, 350, 650);

fill(225, 225, 0);
beginShape();
vertex(450, 150);
vertex(450, 200);
vertex(500, 200);
vertex(500, 250);
vertex(600, 175);
vertex(500, 100);
vertex(500, 150);
vertex(450, 150);
endShape();

stroke(255, 165, 0);  //orange line
strokeWeight(5);
line(450, 450, 500, 650);
stroke(0,255,128);  //green line
strokeWeight(10);
line(500, 450, 550, 650);
stroke(128,0,255);  //purple line
strokeWeight(15);
line(550, 450, 600, 650);
