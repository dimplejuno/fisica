import fisica.*;

FWorld world;

void setup() {
  size(720, 480);
  smooth();
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  world.remove(world.top);
  world.remove(world.left);
  world.remove(world.right);
}

void draw(){
  background(127);
  world.step();
  world.draw();
}

void mousePressed() {
  FCircle circle = new FCircle(40);
  circle.setPosition(mouseX, mouseY);
  world.add(circle);
}

void makeBox() {
  FBox box = new FBox(30, 30);
  box.setPosition(random(30, width-30), 30);
  world.add(box);
}

void makePoly() {
  FPoly myPoly = new FPoly();
  myPoly.vertex(0, -50);
  myPoly.vertex(14, -20);
  myPoly.vertex(47, -15);
  myPoly.vertex(23, 7);
  myPoly.vertex(29, 40);
  myPoly.vertex(0, 25);
  myPoly.vertex(-29, 40);
  myPoly.vertex(-23, 7);
  myPoly.vertex(-47, -15);
  myPoly.vertex(-14, -20);
  myPoly.setPosition(random(width), 50);
  world.add(myPoly);
  
  FPoly myPoly2 = new FPoly();
  myPoly2.vertex(20, 20);
  myPoly2.vertex(40, 20);
  myPoly2.vertex(40, 40);
  myPoly2.vertex(60, 40);
  myPoly2.vertex(60, 60);
  myPoly2.vertex(20, 60);
  myPoly2.setPosition(random(width), 50);
  world.add(myPoly2);
}


void keyPressed() {

  FBlob myBlob = new FBlob();
   float x = width/2;
   float y = 50;
   myBlob.vertex(x+40, y+10);
   myBlob.vertex(x+50, y+20);
   myBlob.vertex(x+60, y+30);
   myBlob.vertex(x+60, y+40);
   myBlob.vertex(x+50, y+50);
   myBlob.vertex(x+40, y+60);
   myBlob.vertex(x+30, y+70);
   myBlob.vertex(x+20, y+60);
   myBlob.vertex(x+10, y+50);
   myBlob.vertex(x+10, y+40);
   myBlob.vertex(x+20, y+30);
   myBlob.vertex(x+30, y+20);
   myBlob.vertex(x+40, y+10);
   //myBlob.setAsCircle(random(width), 50, 30, 30);
   
   world.add(myBlob);

  
}
