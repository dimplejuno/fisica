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
 
  //world.setEdgesRestitution(0.6);
  //world.setEdgesFriction(1.0);
  ball = loadImage("ironball.png");
  ball.resize(30,30);

  
  wood = loadImage("wood1.jpg");
  wood.resize(400, 20);
  
  
  FBox box = new FBox(400, 20);
  box.setPosition(width/2, height/2);
  box.attachImage(wood);
  box.setStatic(true);
  box.setRestitution(0);
  box.setRotation(radians(30));
  box.setName("wood");
  world.add(box);
  
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
  circle.setRestitution(0);
  circle.setVelocity(0, 200);
  circle.attachImage(ball);
  circle.setName("circle");
  
  world.add(circle);
}


void contactEnded(FContact c) {
  
  if(c.getBody1().getName().equals("wood") && 
  c.getBody2().getName().equals("circle") && millis() - played > 100)  {
    
    float rate = octave[int(random(0, 5))];
    file[int(random(5))].play(rate, 1.0);
    
    played = millis();
  }
  
}
