ArrayList<Box> boxes;
ArrayList<Box> boxes2;

import peasy.*;

PeasyCam cam;

void setup() {
  size(960, 540, P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

  boxes = new ArrayList();
  for (int i=0; i<15; i++) {
    boxes.add(new Box(i, 100, 0, 100));
  }

  boxes2 = new ArrayList();  
  for (int i=0; i<45; i++) {
    boxes2.add(new Box(i, 200, 0, 200));
  }
  
}

float s = 255;

void draw() {
  background(0);
  lights();
  noStroke();
  fill(255);
  stroke(s);
  strokeWeight(2);
  translate(width/2, height/2);
  rotateZ(frameCount*0.01);


  for (Box box : boxes) {
    box.draw(boxes.size());
  }

  for (Box box : boxes2) {
    box.draw(boxes2.size());
  }
}
void keyPressed() {
  switch(key) {
    case('1'):
    for (Box box : boxes) {
      box.rotate = !box.rotate;
    }
    break;
    case('2'):
    for (Box box : boxes) {
      box.col = color(random(100), 0, random(120), random(255));
    }
    break;
    case('3'):
    for (Box box : boxes) {
      box.mode = MODE_LINE;
    }
    break;
    case('4'):
    for (Box box : boxes) {
      box.mode = MODE_CIRCLE;
    }
    break;
  }
  switch(key) {
    case('5'):
    for (Box box : boxes2) {
      box.rotate = !box.rotate;
    }
    break;
    case('6'):
    for (Box box : boxes2) {
      box.col = color(random(255), 0, random(120), random(255));
    }
    break;
    case('7'):
    for (Box box : boxes2) {
      box.mode = MODE_LINE;
    }
    break;
    case('8'):
    for (Box box : boxes2) {
      box.mode = MODE_CIRCLE;
    }
    break;
  }
}