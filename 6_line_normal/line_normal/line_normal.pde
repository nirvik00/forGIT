
Pt a=new Pt(200,180);
Pt b=new Pt(370,200);

ArrayList<Pt> pt2List;
ArrayList<Pt> pt3List;

void setup(){
  size(500,500);
  pt2List=new ArrayList<Pt>();  
  pt3List=new ArrayList<Pt>();
}

void draw(){
  background(255);  
  float s=50;
    
  Pt c=a.add(Sc(Nor0(U(a,b)),s));
  Pt d=a.add(Sc(Nor1(U(a,b)),s));
  
  ellipse(a.x,a.y,5,5);ellipse(b.x,b.y,5,5);ellipse(c.x,c.y,5,5);ellipse(d.x,d.y,5,5);  
  line(a.x,a.y,b.x,b.y); line(a.x,a.y,c.x,c.y);line(a.x,a.y,d.x,d.y);
  
  fill(0);text("a",a.x,a.y);text("b",b.x,b.y);text("c",c.x,c.y);text("d",d.x,d.y);  
  
  if(pt2List.size()>0){
    for(int i=0; i<10; i++){
      pt2List.get(i).display();
      Pt p=pt2List.get(i);
      Pt q=p.add(Sc(Nor0(U(a,b)),s));
      line(p.x,p.y,q.x,q.y);
      pt3List.add(q);
      if(i>0){
        Pt r=pt3List.get(i-1);
        line(q.x,q.y,r.x,r.y);
      }
    }    
  }
}

void mousePressed(){
  pt2List.clear();
  pt2List=Le(a,b,10);
  
}