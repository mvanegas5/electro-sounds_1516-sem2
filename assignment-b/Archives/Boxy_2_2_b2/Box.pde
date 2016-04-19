int MODE_CIRCLE = 1;
int MODE_LINE = 2;

class Box {

  boolean rotate = false;
  int mode = MODE_CIRCLE;
  int id = 0;
  int col = color(255, 100);
  int x, y, z;
  Box(int theId, int theX, int theY, int theZ) {
    id = theId;
    x = theX;
    y = theY;
    z = theZ;
    // println("Hello Box", theId, id);
  }

  void draw(int theTotal) {
    pushMatrix();
    if (mode==MODE_CIRCLE) {
      rotateZ((TWO_PI/theTotal) * id);
      translate(x, y, z);
      if (rotate==true) {
        rotateZ(frameCount*0.01);
      }

    fill(col);
    box(sin(frameCount*0.01)*15);

    popMatrix();
  }
}
}