import java.util.*;
int convexhullpts=23;

ArrayList<Pt>hullPts;
boolean tweak=false;


void setup(){
  size(500,500);
  hullPts=new ArrayList<Pt>();
  initPts();
}

void initPts(){
  Pt points[] = new Pt[convexhullpts];    
  for(int i=0; i<convexhullpts; i++){
    points[i]=new Pt((int)random(50,400), int(random(50,400)));
    noFill();ellipse(points[i].x,points[i].y,10,10);
  }
  int n = points.length; 
  convexHull(points, n);  
}

int orientation(Pt p, Pt q, Pt r){
    int val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y);   
    if (val == 0) return 0; // collinear 
    return (val > 0)? 1: 2; // clock or counterclock wise 
}

void convexHull(Pt points[], int n){
  background(255);
  if (n < 3) {  println("nope");return;  }
  Vector<Pt> hull = new Vector<Pt>(); 
  int r = 0; 
  for (int i = 1; i < convexhullpts; i++){ 
    if (points[i].x < points[r].x){ r = i; } 
  }
  int p = r, q; 
  do
  { 
    hull.add(points[p]);  q = (p + 1) % n;     
    for(int i = 0; i < n; i++){  
      if (orientation(points[p], points[i], points[q])== 2){ q=i; }
    }
    p = q; 
  } while (p != r);
  
  hull.add(hull.get(0));
  for(int i=0; i<hull.size()-1; i++){
    Pt a=hull.get(i); Pt b=hull.get(i+1);
    stroke(150,150,150,150); strokeWeight(1); fill(255,0,0,150); ellipse(a.x,a.y,20,20);
   }
  for(int i=0; i<hull.size()-1; i++){
    Pt a=hull.get(i); Pt b=hull.get(i+1);    
    stroke(50,50,250,150); strokeWeight(1); line(a.x,a.y,b.x,b.y);
    stroke(0); strokeWeight(1); line(a.x,a.y,b.x,b.y);
    fill(0); text(i,a.x-15,a.y-15);
  }
  for(int i=0; i<convexhullpts; i++){
    noFill(); ellipse(points[i].x,points[i].y,10,10);
  }  
  hullPts.clear();
  hullPts.addAll(hull);
}

void draw(){
  
}

void keyPressed(){
  if(key=='a'){ tweak=true; }
  if(key=='b'){ initPts(); }
}

void mouseMoved(){
  Pt m=new Pt(mouseX, mouseY);
  for(int i=0; i<hullPts.size(); i++){
    Pt a=hullPts.get(i);
    float d= sqrt((a.x-m.x)*(a.x-m.x)+(a.y-m.y)*(a.y-m.y));
    if(d<30){
      a.locked=true;
    }
  }
}

void mouseDragged(){  
  for(int i=0; i<hullPts.size(); i++){
    Pt a=hullPts.get(i);
    a.x=mouseX; a.y=mouseY;
  }
}

void mousePressed(){
  initPts();  
}