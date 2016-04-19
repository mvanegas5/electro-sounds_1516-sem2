
import processing.opengl.*;
import glitchP5.*; // import GlitchP5

GlitchP5 glitchP5; // declare an instance of GlitchP5. only one is needed


float[][] distances;
float maxDistance;
int spacer;

void setup() {
  size(960, 540);
  maxDistance = dist(width/2*sin(frameCount*0.1)+2, height/2, width, height);
  distances = new float[width][height];
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float distance = dist(width/2, height/2, x, y);
      distances[x][y] = distance/maxDistance * 255;
    }
  }
  spacer = 10;
  loop(); 

  glitchP5 = new GlitchP5(this);// Run once and stop
}

void draw() {
  strokeWeight(5*sin(frameCount*0.1)+7);
  background(255+sin(frameCount*0.3)*300, 255+sin(frameCount*0.05)*255, 255+sin(frameCount*0.1)*255);
  for (int y = 0; y < height; y += spacer) {
    for (int x = 0; x < width; x += spacer) {
      stroke(distances[x][y]);
      color(0,0,255+sin(frameCount*0.3)*300);
      rect(x + spacer/2, y + spacer/2,0,0);
    }
  }
  glitchP5.run();
}

void mousePressed()
{
  // trigger a glitch: glitchP5.glitch(  posX,       // 
  //                               posY,       // position on screen(int)
  //          posJitterX,     // 
  //          posJitterY,     // max. position offset(int)
  //          sizeX,       // 
  //          sizeY,       // size (int)
  //          numberOfGlitches,   // number of individual glitches (int)
  //          randomness,     // this is a jitter for size (float)
  //          attack,     // max time (in frames) until indiv. glitch appears (int)
  //          sustain      // max time until it dies off after appearing (int)
  //              );

  glitchP5.glitch(mouseX, mouseY, 200, 400, 200, 1200, 3, 1.0f, 10, 40);
}