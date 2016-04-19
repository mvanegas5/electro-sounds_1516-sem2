float xstart = random(100, 600);
float xend = random(100, 600);
float ystart = random(400, 600);
float yend = random (400, 600);
float deg = random (.01, .2);
float rad = radians(deg);
float deg2 = random(-.01, .2);
float rad2 = random(deg2);

void setup() {
  size(960, 540);
}
void draw() {
  background(255, 255, 229, 60);
  stroke(0, 100);
  for (int i= 20; i < 80; i += 1) {
    line(xstart, i+100, xend, i+350);
    rotate(deg);
  }
  for (int i= 20; i < 80; i += 1) {
    line(xstart, ystart, i+100, yend);
    rotate(deg2);
  }
  for (int i=10; i < 80; i += 1) {
    line(i+50, ystart, i+100, yend);
    rotate(deg2);
  }
  for (int i=20; i < 80; i += 1) {
    line(i+100, ystart, xend, yend);
    rotate(deg);
  }
}

void mousePressed() {
 xstart += random(-50, 50);
 xend += random(-50, 50);
 ystart += random(-50, 50);
 yend += random(-50, 50);
 redraw();
 
 while (keyPressed);
 {
   save("FreiderNake_Mario.jpg");
 }
}