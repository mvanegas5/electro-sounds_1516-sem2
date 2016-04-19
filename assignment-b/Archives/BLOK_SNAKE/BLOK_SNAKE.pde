float rotateVal = 0.0;
int unit = 200;
int count;
Module[] mods;
ArrayList<Box> boxes;

void setup() {
  size(960, 540, P3D);
  noStroke();
  smooth();
  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Module[count];
  println(count);
  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.05, 0.8), unit);
    }
  }
}

void draw() {
  //rotate// Val += .02;
  //background(75, 0, 50);
  //translate(width/2,height/2);
  //rotateZ(rotateVal);
  //lights();
  //for (Module mod : mods) {
  //  //mod.update();
  //  mod.display();
  background(0);
  lights();
  noStroke();
  fill(255);
  translate(width/2, height/2);
  rotateZ(frameCount*0.01);

  for (Box box : boxes) {
    box.draw();
    for (Module mod : mods) {
   mod.update();
   mod.display();
  }
}