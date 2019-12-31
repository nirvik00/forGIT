Pt I;

float R=15;

void setup(){
  size(1000,700); 
  I=new Pt(width/2, height/2+100);
}

void draw(){
  background(255);
  stroke(0);
  strokeWeight(1);
  int a=50;
  int b=50;
  ArrayList<ArrayList<Pt>> rowPtLi=new ArrayList<ArrayList<Pt>>();
  for(int i=a; i<width-a; i+=a){
    ArrayList<Pt> rowLi=new ArrayList<Pt>();
    for(int j=b; j<height-b; j+=b){
      Pt p=new Pt(i,j);
      
      Pt u=new Pt(I.x-p.x, I.y-p.y);
      float d=sqrt(u.x*u.x+u.y*u.y);
      Pt q=generateSeg(p); 
      //p.display();
      //q.display2();
      rowLi.add(q);
    }
    rowPtLi.add(rowLi);
  }
  I.display2();
  generateQuads(rowPtLi);
}

void generateQuads(ArrayList<ArrayList<Pt>>pts){
  for(int i=0; i<pts.size()-1; i++){
    ArrayList<Pt> ptsRow1=pts.get(i);
    ArrayList<Pt> ptsRow2=pts.get(i+1);
    for(int j=0; j<ptsRow1.size()-1; j++){
      Pt p=ptsRow1.get(j);
      Pt q=ptsRow1.get(j+1);
      Pt r=ptsRow2.get(j+1);
      Pt s=ptsRow2.get(j);
      stroke(0,200,0,50);
      strokeWeight(5);
      
      line(p.x,p.y,q.x,q.y);
      line(q.x,q.y,r.x,r.y);
      line(r.x,r.y,s.x,s.y);
      line(s.x,s.y,p.x,p.y);
      
    }
  }
}

Pt generateSeg(Pt p){
  Pt q=new Pt(p.x+R, p.y);
  Pt u=new Pt(I.x-p.x, I.y-p.y);
  Pt v=new Pt(q.x-p.x, q.y-p.y);
  float normU=sqrt(u.x*u.x + u.y*u.y);
  float normV=sqrt(v.x*v.x + v.y*v.y);
  float dotProd=u.x*v.x + u.y*v.y;
  float ang=acos(dotProd/(normU*normV));
  if(p.y>I.y){
    ang=2*PI-ang;
  }
  float x=v.x*cos(ang) - v.y*sin(ang);
  float y=v.x*sin(ang) + v.y*cos(ang);
  Pt P=new Pt(p.x+x, p.y+y);
  // line(p.x,p.y,q.x,q.y);
  // line(p.x,p.y,P.x,P.y);
  return P;
}

void mousePressed(){
  Pt m=new Pt(mouseX, mouseY);
  I=new Pt(m.x,m.y);
}
