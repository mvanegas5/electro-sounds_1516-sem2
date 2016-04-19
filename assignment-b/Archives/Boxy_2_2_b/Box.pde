int MODE_CIRCLE = 1;
int MODE_LINE = 2;

class Box {

  boolean rotate = false;
  int mode = MODE_CIRCLE;
  int id = 0;
  int col = color(255, 100);
  int x, y, z;
  int s;
  
  Box(int theId, int theX, int theY, int theZ,float theSpeed) {
    id = theId;
    s = theSpeed;
    x = theX;
    y = theY;
    z = theZ;
    
    // println("Hello Box", theId, id);
  }

  void draw(int theTotal) {
    s = ++0.01;
    
    pushMatrix();
    if (mode==MODE_CIRCLE) {
      rotateZ((TWO_PI/theTotal) * id);
      translate(x, y, z);
      if (rotate==true) {
        rotateZ(frameCount*0.01);
      }
    } else if (mode==MODE_LIN) {
      translate(10, 0, 0);
      rotateZ((TWO_PI/theTotal) *id);
      translate(x*1, ++y, ++z);
    }

    fill(col);
    box(sin(frameCount*0.01)*25);

    popMatrix();
  }
}