import fisica.*; 

FWorld world; 
PImage background;
PImage angrybird;
PImage pig;

void setup() {
  size(720, 480);
  smooth();

  Fisica.init(this);  // Fisica Initialization
  world = new FWorld();
  world.setEdges();
  world.remove(world.right);
  world.remove(world.left);
  
  background = loadImage("colored_desert.png");
  
  angrybird = loadImage("angrybird.png");
  angrybird.resize(30, 30);
  
  pig = loadImage("pig.png");
  pig.resize(30, 30);
  
  FBox b = new FBox(200, 10);
  b.setPosition(width/4, height - 100);
  b.setStatic(true);
  b.setRotation(radians(30));
  b.setRestitution(2.5);
  world.add(b);
}

void draw(){
  //background(127);
  image(background, 0, 0, width, height);
  world.step();
  world.draw();
}

void keyPressed() {
  FBox box = new FBox(30, 30);
  box.setPosition(mouseX, mouseY);
  box.attachImage(pig);
  world.add(box);
}

void mousePressed() {
   FCircle circle = new FCircle(30);
   circle.setPosition(mouseX, mouseY);
   circle.attachImage(angrybird);
   world.add(circle);
}
