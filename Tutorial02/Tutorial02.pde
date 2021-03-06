import fisica.*;

FWorld world;

void setup() {
  size(720, 480);
  smooth();
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  world.remove(world.top);
  world.remove(world.right);
}

void draw(){
  background(127);
  world.step();
  world.draw();
}

void mousePressed() {
  FCircle circle = new FCircle(30);
  circle.setPosition(mouseX, mouseY);
  world.add(circle);
}
