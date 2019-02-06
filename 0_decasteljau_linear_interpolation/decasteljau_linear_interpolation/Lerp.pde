
Pt Lerp(Pt a, Pt b, float t){
  Pt c= new Pt(a.x+(b.x-a.x)*t,a.y+(b.y-a.y)*t);
  return c;
}

ArrayList<Pt> Lerp(Pt a, Pt b, int t){
  ArrayList<Pt> pts=new ArrayList<Pt>();
  Pt u=new Pt(b.x-a.x,b.y-a.y);
  for(float i=0; i<1.0; i+=(1.0/t)){pts.add(new Pt(a.x+u.x*i, a.y+u.y*i));}
  return pts;
}