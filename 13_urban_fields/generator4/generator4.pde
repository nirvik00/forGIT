Pt I;
void setup(){
  size(500,500);
  I=new Pt(200,200);
  init();
}

void init(){
  float r=25;
  Pt a=new Pt(I.x+r, I.y);
  Pt b=new Pt(I.x-r, I.y);
  Pt c=new Pt(I.x, I.y+r);
  Pt d=new 
}

void draw(){
  background(255);
  I.display2();
}
