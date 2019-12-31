class Quad{
  Pt p,q,r,s;
  Quad(Pt a, Pt b, Pt c, Pt d){
    p=a;
    q=b;
    r=c;
    s=d;
  }
  void display(){
    stroke(0,200,0,50);
    strokeWeight(5);
    line(p.x,p.y,q.x,q.y);
    line(q.x,q.y,r.x,r.y);
    line(r.x,r.y,s.x,s.y);
    line(s.x,s.y,p.x,p.y);
  }
}
