int MODE_CIRCLE = 1;
int MODE_BOUNCE = 2;
int MODE_LINE = 3;


class Box {

  boolean rotate = false;
  int mode = MODE_CIRCLE;
  int id = 0;
  int col = color(255, 100);
  int x, y, z;
  int s;
  float zOff = 0;
  float amp = 0;
  float namp = 0;
  Box(int theId, int theX, int theY, int theZ, float theZoff) {
    id = theId;
    x = theX;
    y = theY;
    z = theZ;
    zOff = theZoff;

    // println("Hello Box", theId, id);
  }

  void draw(int theTotal) {
    amp += (namp-amp)*0.02;
    pushMatrix();
    if (mode==MODE_CIRCLE) {
      rotateZ((TWO_PI/theTotal) * id);
      translate(x, y, sin(zOff + frameCount*0.1)*amp);
      if (rotate==true) {
        rotateZ(frameCount*0.01);
      }
    } else if (mode==MODE_BOUNCE) {
     // translate(10, 0, 0);
      rotateZ((TWO_PI/theTotal) *id);
      translate(x, y, sin(frameCount*0.1)*100);
    }
    else if (mode==MODE_LINE) {
     // translate(10, 0, 0);
      rotateZ((TWO_PI/theTotal) *id);
      translate(x, y, sin(frameCount*0.1)*100);
    }
    fill(col);
    box(sin(frameCount*0.01)*25);

    popMatrix();
  }
}