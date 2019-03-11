import fisica.*;

FWorld world;
PImage img;

void setup() {
  size(720, 480);
  smooth();
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  world.setEdgesRestitution(0.6);
  //world.setEdgesFriction(1.0);
  img = loadImage("ryan.png");
  img.resize(30,30);
}

void draw(){
  background(255);
  world.step();
  world.draw();
}

void keyPressed() {
  FCircle circle = new FCircle(30);
  circle.setPosition(mouseX, mouseY);
  circle.setRestitution(0.6);
  circle.attachImage(img);
  world.add(circle);
}
