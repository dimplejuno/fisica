import fisica.*;

FWorld world;

void setup() {
  size(720, 480);
  smooth();
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
}

void draw(){
  background(127);
  world.step();
  world.draw();
}



void keyPressed() {
      for(int i=0; i<100; i++) {
    FCircle circle = new FCircle(30);
    circle.setPosition(mouseX, mouseY);
    circle.setFill(random(256), 40, 235);
    world.add(circle);
  }
  
  //FBox box = new FBox(30, 30);
  //box.setPosition(mouseX, mouseY);
  //world.add(box);
  
  //FDistanceJoint spring = new FDistanceJoint(circle, box);
  //world.add(spring);
  
  //FPrismaticJoint rotor = new FPrismaticJoint(world.top, box);
  //world.add(rotor);
  
  //FRevoluteJoint axis = new FRevoluteJoint(circle, box);
  //world.add(axis);
}
