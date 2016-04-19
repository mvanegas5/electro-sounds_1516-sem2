int _num = 1500;        
int _numSpheres = 10;    
int _threshold; 
float _maxRad, _maxNoise;

import codeanticode.syphon.*;

SyphonServer server;

HPoint[] _pointArr = {};
Sphere[] _sphereArr = {};

//================================= init

void settings() {
  size(1280, 720, P3D);
  PJOGL.profile=1;
}

void setup() {
  size(960, 540, P3D);
  smooth();
  strokeWeight(5);
  _maxNoise = random(1);
  server = new SyphonServer(this, "Processing Syphon");

  restart();
}

void restart() {
  background(0);
  newSpheres();
  newPoints();
}

void clearBackground() {
  background(255);
}

void newSpheres() {
  _sphereArr = (Sphere[])expand(_sphereArr, 0); 
  for (int x = 0; x <= _numSpheres; x++) {
    Sphere thisSphere = new Sphere();
    _sphereArr = (Sphere[])append(_sphereArr, thisSphere);
  }
}

void newPoints() {
  _pointArr = (HPoint[])expand(_pointArr, 0); 
  for (int x = 0; x <= _num; x++) {
    HPoint thisPoint = new HPoint(random(360), random(360));
    _pointArr = (HPoint[])append(_pointArr, thisPoint);
  }
}

//================================= interaction

void mousePressed() { 
  restart();
}

//================================= frame loop

void draw() {
  clearBackground();

  // update
  _maxNoise += 0.01;
  _maxRad = noise(_maxNoise) * 500; 
  _threshold = int(_maxRad / 3);
  for (int s = 0; s < _sphereArr.length; s++) {
    Sphere thisS = _sphereArr[s];
    thisS.update();
  }
  for (int x = 0; x < _pointArr.length; x++) {
    HPoint thisHP = _pointArr[x];
    thisHP.update();
  }

  // draw
  pushMatrix();
  background(200+sin(frameCount*0.01)*255, 200+cos(frameCount*0.01)*255, 200+cos(frameCount*0.01)*255);
  strokeWeight(5+sin(frameCount*0.01)*5);
  translate(width/2, height/2, -700);
  rotateY(_maxNoise);
  rotateZ(10+sin(frameCount*0.01)*10);
  for (int y = 0; y < _pointArr.length; y++) {
    HPoint fromHP = _pointArr[y];
    stroke(fromHP.col, 150);
    noFill();
    for (int z = 0; z < _pointArr.length; z++) {
      HPoint toHP = _pointArr[z];
      float diff = dist(fromHP.x, fromHP.y, fromHP.z, toHP.x, toHP.y, toHP.z);
      if (diff < _threshold) {
        line(fromHP.x, fromHP.y, fromHP.z, toHP.x, toHP.y, toHP.z);
      }
    }
  }
  popMatrix();
  server.sendScreen();
}

//================================= objects

class Sphere {
  float radius, radNoise;

  Sphere() {
    radNoise = random(50);
  }

  void update() {
    radNoise += 0.01;
    radius = 150 + (noise(radNoise) * _maxRad);
  }
}

class HPoint {
  float s, t;
  float x, y, z;
  int mySphere;
  color col;
  float time = 0;

  HPoint(float es, float tee) {
    s = es; 
    t = tee;
    time = time + 1;

    float q = noise(time);
    map(q, 0, 1, 0, 255);
    col = color(10 - (10*mySphere), q, (10*mySphere), 255); 

    mySphere = int(random(_numSpheres));
  }

  void update() {
    Sphere myS = _sphereArr[mySphere];
    x = myS.radius * (5+sin(s) * 5) * sin(t);
    y = myS.radius * sin(s) * cos(t);
    z = myS.radius * cos(t);
  }
}