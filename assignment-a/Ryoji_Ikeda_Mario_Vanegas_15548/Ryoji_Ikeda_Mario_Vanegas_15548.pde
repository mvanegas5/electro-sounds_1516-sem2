void setup() {
  size(960, 540,P2D);
  background(0);
  noSmooth();
  strokeWeight(10);
  frameRate(10);
}

void draw() {
  for (int i = 0; i < width; i++) {
    float r = random(255);
    stroke(r);
    line(i, 0, i, height);
  }
  for (int i = 0; i < width; i++) {
    float r = random(255);
    stroke(r);
    line(i, 270, i, height);
  }
  
}