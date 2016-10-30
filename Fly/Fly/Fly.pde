PImage img;
ArrayList<Firefly> fs = new ArrayList<Firefly>();

void setup(){
  size(1280,720);
  colorMode(HSB,width,1,1);
  fs.add(new Firefly());
  img = loadImage ("pana_1.png");
}

void draw(){
  background(0);
  // 飛ばす
  for(int i=0;i<fs.size();i++){
    fs.get(i).fly();
  }
}

void mousePressed(){
// マウスボタンが押されたら粒子を増やす(100個まで)
  fs.add(new Firefly());
  if(fs.size()>100){
    fs.remove(0);
  }
}

class Firefly{
  Ball b;    // ボール
  float px;  // ノイズ
  float py;  // ノイズ
  float xx=0; // ノイズをつくるため
  float yy=0; // ノイズをつくるため
  float t=0;  // 時間ステップ
  float a = 0; // 振幅
//  boolean z = true;
  
  Firefly(){
    b=new Ball(random(width),random(height),random(-1,1),random(-1,1));
  }
  // 見えないボールの周りに粒子を飛ばす
  void fly(){
    b.move(new PVector(mouseX+random(-100,100),mouseY+random(-100,100)));
    px=noise(xx,yy);
    py=noise(xx);
    a = noise(yy)*50;
   // noStroke();
    //fill(255);
    //ellipse(a*cos(px+t)+b.p.x,a*sin(py+t)+b.p.y,px*10,px*10);
    image(img, a*cos(px+t)+b.p.x,a*sin(py+t)+b.p.y,50, 50);
    xx+=0.01;
    yy+=0.01;
    t+=0.01;
  }
}

class Ball{
  PVector p; // 位置
  PVector v; // 運動量
  float dt = 0.1; // 時間刻み幅
  Ball(){
    p = new PVector();
    v = new PVector();
  }
  Ball(float x, float y, float vx, float vy){
    p = new PVector(x,y);
    v = new PVector(vx,vy);
  }
  // マウスに向かってくる
  void move(PVector tar){
    v.mult(0.99);
    v.add(0.01*(tar.x-p.x),0.01*(tar.y-p.y),0);
    p.add(v.x * dt,v.y * dt,0);
    // 端の処理
    if(p.x<0){
      v.x*=-0.01;
      p.x=0;
    }
    else if(p.x>width){
      v.x*=-0.01;
      p.x=width;
    }
    
  }
  /*void display(){
    ellipse(p.x,p.y,10,10);
  }*/
}