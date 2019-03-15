import fisica.*;
import processing.sound.*;

FWorld world;
PImage ball;
PImage wood;

SoundFile[] file;
float[] octave = {0.25, 0.5, 1.0, 1.5, 2.0};
int[] playSound = {1, 1, 1, 1, 1};

long played = 0;

void setup() {
  size(720, 480);
  smooth();
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 200);
  
  FLine line = new FLine(0,height, width,height);
  world.add(line);
  
  for(int i=0; i<=8; i++) {
   FBox b = new FBox(4, 100);  
   b.setPosition(i*width/8, height-50);
   b.setStatic(true);
   world.add(b);
  }
  
  for(int i=0; i<=width/10; i++) {
    for(int j=0; j<=2;j++) {
     FCircle b = new FCircle(1);  
     b.setPosition(i*width/10, 100 + j*100);
     b.setStatic(true);
     world.add(b);
    }
  }
  
  for(int i=0; i<=width/10; i++) {
    for(int j=0; j<=2;j++) {
     FCircle b = new FCircle(1);  
     b.setPosition(i*width/10 + 35, 150 + j*100);
     b.setStatic(true);
     world.add(b);
    }
  }
 
  //world.setEdgesRestitution(0.6);
  //world.setEdgesFriction(1.0);
  ball = loadImage("ironball.png");
  ball.resize(30,30);
  
  file = new SoundFile[5];
  
  for (int i = 0; i < 5; i++) {
    file[i] = new SoundFile(this, (i+1) + ".aif");
  }
}

void draw(){
  background(255);
  world.step();
  world.draw();
}

void keyPressed() {
  FCircle circle = new FCircle(30);
  circle.setPosition(mouseX, mouseY);
  circle.setRestitution(0.5);
  circle.setVelocity(0, 200);
  circle.attachImage(ball);
  circle.setName("circle");
  
  world.add(circle);
}


void contactEnded(FContact c) {
  
  
}
