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