import fisica.*;

FWorld world;
PImage baseball;
PImage basketball;
PImage wood;

void setup() {
  size(720, 480);
  smooth();
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  world.remove(world.top);
  world.remove(world.left);
  world.remove(world.right);
  
  world.setEdgesRestitution(0.6);
  //world.setEdgesFriction(1.0);
  baseball = loadImage("baseball.png");
  baseball.resize(30,30);
  basketball = loadImage("basketball.png");
  basketball.resize(30,30);
  
  wood = loadImage("wood1.jpg");
  wood.resize(200, 20);
  
  FBox box = new FBox(200, 20);
  box.setPosition(width/2, height/2);
  box.attachImage(wood);
  box.setStatic(true);
  world.add(box);
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
  circle.attachImage(baseball);
  
  world.add(circle);
}

void contactStarted(FContact c) {
  
  
}
