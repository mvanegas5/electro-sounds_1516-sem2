ArrayList<Box> boxes;
ArrayList<Box> boxes2;

import peasy.*;

PeasyCam cam;

import codeanticode.syphon.*;

SyphonServer server;

void settings() {
  size(1280,720, P3D);
  PJOGL.profile=1;
}

void setup() {
  size(960, 540, P3D);
  //cam = new PeasyCam(this, 100);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500);

server = new SyphonServer(this, "Processing Syphon");

  boxes = new ArrayList();
  for (int i=0; i<15; i++) {
    boxes.add(new Box(i, 100, 0, 100, 0));
  }

  boxes2 = new ArrayList();  
  for (int i=0; i<45; i++) {
    boxes2.add(new Box(i, 200, 0, 200, HALF_PI));
  }
  
}

void draw() {
  background(200+sin(frameCount*0.01)*255, 200+cos(frameCount*0.01)*255, 200+cos(frameCount*0.01)*255);
  lights();
  stroke(0);
  noFill();
  stroke(255);
  strokeWeight(2);
  translate(width/2, height/2);
  rotateZ(frameCount*0.01);
  

  for (Box box : boxes) {
    box.draw(boxes.size());
  }

  for (Box box : boxes2) {
    box.draw(boxes2.size());
  }
  server.sendScreen();
}
void keyPressed() {
  switch(key) {
    case('1'):
    for (Box box : boxes) {
      box.namp = (box.amp>0.1) ? 0:200;
    }
    break;
    case('2'):
    for (Box box : boxes) {
      box.col = color( random(100,255),random(10,100),random(255),random(255));
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
      box.col = color(random(255), 0, 255*sin(frameCount*0.01)+255, random(255));
    }
    break;
    case('7'):
    for (Box box : boxes2) {
      box.mode = MODE_BOUNCE;
    }
    break;
    case('8'):
    for (Box box : boxes2) {
      box.mode = MODE_CIRCLE;
    }
    break;
  }
}