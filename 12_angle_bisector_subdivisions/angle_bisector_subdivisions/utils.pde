void genSubdiv(Pt A, Pt B, Pt P, Pt Q){
  Pt u=new Pt((Q.x-P.x)/P.di(Q), (Q.y-P.y)/P.di(Q));
  Pt u_=new Pt(-u.y, u.x);
  Pt v=new Pt((B.x-A.x)/A.di(B), (B.y-A.y)/A.di(B));
  
  float L=35; float n=(P.di(Q))/L;
  ArrayList<Seg> segList=new ArrayList<Seg>();
  Seg seg0=new Seg(P,A); segList.add(seg0);
  for(float i=0; i<P.di(Q); i+=L){
    println(u.x, i, i*L);
    Pt X=new Pt(P.x+u.x*i, P.y+u.y*i); ellipse(X.x,X.y,5,5);
    Pt Y=new Pt(X.x-u.y*50, X.y+u.x*50); 
    Pt Z=intx(X,Y,A,B); line(Z.x,Z.y,X.x,X.y);
    Seg seg=new Seg(X,Z); segList.add(seg);
  }  
  Seg seg1=new Seg(Q,B); segList.add(seg1);
  
  for(int i=1; i<segList.size(); i++){
    Seg se0=segList.get(i-1);
    Seg se1=segList.get(i);
    
    fill(155,150,0,50);
    PShape sh=createShape();
    sh.beginShape();
    sh.vertex(se0.P.x,se0.P.y);
    sh.vertex(se0.Q.x,se0.Q.y);
    sh.vertex(se1.Q.x,se1.Q.y);
    sh.vertex(se1.P.x,se1.P.y);
    sh.endShape();
    
    shape(sh);
    
  }
}
  
Pt intx(Pt p, Pt q, Pt r, Pt s){
  float a1=q.y-p.y; float b1=p.x-q.x; float c1=a1*q.x+b1*q.y;
  float a2=s.y-r.y; float b2=r.x-s.x; float c2=a2*s.x+b2*s.y;
  float det=a1*b2-a2*b1; 
  float rx=(c1*b2-c2*b1)/det; float ry=(c2*a1-c1*a2)/det;   
  return new Pt(rx,ry);
}