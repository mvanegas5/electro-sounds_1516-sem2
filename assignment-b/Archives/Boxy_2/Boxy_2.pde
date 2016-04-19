ArrayList<Box> boxes;

import peasy.*;

PeasyCam cam;

void setup() {
  size(960, 540, P3D);
  //cam = new PeasyCam(this, 100);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500);
  
  boxes = new ArrayList();
  for (int i=0; i<20; i++) {
    boxes.add(new Box(i));
  }

 
}

void draw() {
  background(0);
  lights();
  noStroke();
  fill(255);
  stroke(255);
  strokeWeight(2);
  translate(width/2, height/2);
  rotateZ(frameCount*0.01);


  for (Box box : boxes) {
    box.draw();
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
      box.col = color(random(255), 0, 0);
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
}