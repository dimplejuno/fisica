import fisica.*;

FWorld world;
PImage back;

void setup() {
  size(720, 480);
  smooth();
  Fisica.init(this);
  world = new FWorld();
  //world.setEdges();
  //world.remove(world.top);
  //world.remove(world.right);
  
  back = loadImage("back.jpg");
}

void draw(){
  //background(127);
  image(back,0,0,width,height);
  world.step();
  world.draw();
}

void mousePressed() {
  FCircle circle = new FCircle(4);
  circle.setPosition(mouseX, mouseY);
  world.add(circle);
}

void makeBox() {
  FBox box = new FBox(30, 30);
  box.setPosition(random(30, width-30), 30);
  world.add(box);
}


void keyPressed() {
  
  
  FBlob myBlob = new FBlob();
 myBlob.vertex(40, 10);
 myBlob.vertex(50, 20);
 myBlob.vertex(60, 30);
 myBlob.vertex(60, 40);
 myBlob.vertex(50, 50);
 myBlob.vertex(40, 60);
 myBlob.vertex(30, 70);
 myBlob.vertex(20, 60);
 myBlob.vertex(10, 50);
 myBlob.vertex(10, 40);
 myBlob.vertex(20, 30);
 myBlob.vertex(30, 20);
 myBlob.vertex(40, 10);
 world.add(myBlob);
 
 
 //FBlob myBlob2 = new FBlob();
 //myBlob2.setAsCircle(width/2, 40, 40);
 //world.add(myBlob2);
}
