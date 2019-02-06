Pt V(Pt p, Pt q){ return new Pt(q.x-p.x, q.y-p.y); }
Pt addPt(Pt a, Pt b){ return new Pt(a.x+b.y, a.y+b.y); }
Pt U(Pt p, Pt q){ return new Pt((q.x-p.x)/Di(p,q), (q.y-p.y)/Di(p,q)); }
float dotPr(Pt p, Pt q){ return (p.x*q.x + p.y*q.y)/(nor(p)*nor(q)); }
float Di(Pt a, Pt b){ return sqrt((a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y)); }
Pt Sc(Pt p, Pt q, float r){ Pt v=U(p,q); return new Pt(p.x+v.x*r,p.y+v.y*r); }
Pt Sc(Pt p, float r){ return new Pt(p.x*r/nor(p),p.y*r/nor(p)); }
Pt Nor0(Pt v){ return new Pt(-v.y,v.x); }
Pt Nor1(Pt v){ return new Pt(v.y,-v.x); }
float nor(Pt p){ return sqrt((p.x+p.y)*(p.x+p.y)); }
boolean findIntx(Pt p, Pt q, Pt r, Pt s){
  float a1=q.y-p.y; float b1=p.x-q.x; float c1=(a1*q.x)+(b1*q.y);
  float a2=s.y-r.y; float b2=r.x-s.x; float c2=(a2*s.x)+(b2*s.y);
  float det= (a1*b2-a2*b1); 
  float x=(c1*b2-c2*b1)/det; float y=(c2*a1-c1*a2)/det;
  Pt I=new Pt(x,y);
  float d0=Di(I,p); float d1=Di(I,q); float d=Di(p,q);
  if(abs(d0+d1-d)<0.1){ return true; }
  else{ return false; }
}
ArrayList<Pt> Le(Pt a, Pt b, int num){
  ArrayList<Pt> fg=new ArrayList<Pt>(); fg.clear();
  Pt v=U(a,b); float d=Di(a,b)/num;
  for(int i=0; i<num; i++){ Pt p= new Pt(a.x+i*d*(b.x-a.x)/(a.di(b)),a.y+i*d*(b.y-a.y)/(a.di(b))); fg.add(p); }
  return fg;
}