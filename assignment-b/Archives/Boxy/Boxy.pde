ArrayList<Box> boxes;

void setup() {
  size(960, 540, P3D);
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
      box.col = color(random(255), 0, random(255),random(255));
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

int MODE_CIRCLE = 1;
int MODE_LINE = 2;


class Box {

  boolean rotate = false;
  int mode = MODE_CIRCLE;
  int id = 0;
  int col = color(255, 100);

  Box(int theId) {
    id = theId;
    println("Hello Box", theId, id);
  }

  void draw() {
    pushMatrix();
    if (mode==MODE_CIRCLE) {
      rotateZ((TWO_PI/boxes.size()) * id);
      translate(100, 0, 100);
      if (rotate==true) {
        rotateZ(frameCount*0.01);
      }
    } else if (mode==MODE_LINE) {
      translate(10, 0, 0);
      rotateZ(frameCount*0.1);
      translate(20, 0, -id*150);
    }

    fill(col);
    box(sin(frameCount*0.01)*25);

    popMatrix();
  }
}