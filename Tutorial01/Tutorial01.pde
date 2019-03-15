import fisica.*; // 라이브러리를 사용할 수 있도록 설정 

FWorld world;  // 물리적 환경의 세상 
PImage angrybird;
PImage pig;

FBox box;

void setup() {
  size(720, 480);
  //fullScreen();
  smooth();
  angrybird = loadImage("angrybird.png");
  angrybird.resize(30, 30);
  pig = loadImage("pig.png");
  pig.resize(30, 30);
  
  Fisica.init(this);  // 라이브러리 초기화 
  
  world = new FWorld();
  world.setEdges();
  world.remove(world.top);
  world.remove(world.left);
  world.remove(world.right);
  world.setGravity(0, 200);
  //world.setEdgesRestitution(0.6);
  
  box = new FBox(200, 20);
  box.setPosition(width/4, height - 100);
  box.setStatic(true);
  box.setRestitution(2.5);
  box.setRotation(radians(30));
  box.setName("box");
  world.add(box);
  
}

void draw(){
  background(127);
  world.step();
  world.draw();
}

void mousePressed() {
  
  //for(int i=0; i<100; i++)  {
    FCircle circle = new FCircle(30);
    circle.setPosition(mouseX, mouseY);
    circle.setFill(random(256), random(256), random(256));
    circle.attachImage(pig);
    world.add(circle);
  //}
}

void keyPressed()  {
  if(key == 'a') {
    FBox b = new FBox(30, 30);
    b.setPosition(mouseX, mouseY);
    b.attachImage(angrybird);
    world.add(b);
  }
}

void contactStarted(FContact c) {
  if(c.getBody1().getName().equals("box"))  {
    box.setFill(random(256));
  }
  
}

/*
연습문제  : 
01. 키를 누르면 랜덤한  위치에서 동그란공이  만들어지게 하세요.

*/
