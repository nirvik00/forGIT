ArrayList<Pt> pts;
ArrayList<Pt> ptsC;
Pt A= new Pt(100,400);
Pt B= new Pt(230,100);
Pt C= new Pt(380,240);
boolean showLerp=true;

int t=10;
int img=0;

void setup(){
  size(500,500);
  pts=new ArrayList<Pt>();ptsC=new ArrayList<Pt>();
}
void draw(){
  background(255); 
  stroke(150,150,150);strokeWeight(2);line(A.x,A.y,B.x,B.y);line(B.x,B.y,C.x,C.y);  
  if(A.locked==1){noFill(); ellipse(A.x,A.y,25,25); fill(255,0,0,50); ellipse(A.x,A.y,10,10);}else{noFill(); ellipse(A.x,A.y,10,10);}
  if(B.locked==1){noFill(); ellipse(B.x,B.y,25,25); fill(255,0,0,50); ellipse(B.x,B.y,10,10);}else{noFill(); ellipse(B.x,B.y,10,10);}
  if(C.locked==1){noFill(); ellipse(C.x,C.y,25,25); fill(255,0,0,50); ellipse(C.x,C.y,10,10);}else{noFill(); ellipse(C.x,C.y,10,10);}
  
  fill(0);
  text("A",A.x+10,A.y+10);text("B",B.x+10,B.y+10);text("C",C.x+10,C.y+10);
  text("press t to increase linear interpolation points", 10,10);
  text("press e to decrease linear interpolation points", 10,25);
  text("press g to show linear interpolation lines", 10,40);
  text("press h to hide linear interpolation lines", 10,55);
  
  ArrayList<Pt> ptsA=Lerp(A,B,t);ArrayList<Pt> ptsB=Lerp(B,C,t);ArrayList<Pt> ptsC=new ArrayList<Pt>();
  for(int i=0; i<t; i++){
    Pt a=ptsA.get(i);Pt b=ptsB.get(i);
    ptsC.add(new Pt(a.x+(b.x-a.x)*i/t,a.y+(b.y-a.y)*i/t));    
  }
  ptsC.add(C); // linear interpolation operations


  if(showLerp==true){for(int i=0; i<t; i++){ stroke(200);strokeWeight(1); line(ptsA.get(i).x,ptsA.get(i).y,ptsB.get(i).x,ptsB.get(i).y); ellipse(ptsA.get(i).x,ptsA.get(i).y,5,5); ellipse(ptsB.get(i).x,ptsB.get(i).y,5,5);}} // shows the interpolation 
  for(int i=0; i<ptsC.size()-1; i++){strokeWeight(7); stroke(200,0,0,100);  line(ptsC.get(i).x,ptsC.get(i).y,ptsC.get(i+1).x,ptsC.get(i+1).y); } // shows the interpolated bezier curve
  stroke(0);strokeWeight(1);
}

void mouseMoved(){
  Pt mos=new Pt(mouseX, mouseY);
  float d0=mos.di(A);if(d0<30){A.locked=1;}else{A.locked=0;}
  float d1=mos.di(B);if(d1<30){B.locked=1;}else{B.locked=0;}
  float d2=mos.di(C);if(d2<30){C.locked=1;}else{C.locked=0;}
}

void mouseDragged(){
 if(A.locked==1){A.x=mouseX; A.y=mouseY; }
 if(B.locked==1){B.x=mouseX; B.y=mouseY; }
 if(C.locked==1){C.x=mouseX; C.y=mouseY; }
}

void saveImg(){
  img++;
  String s="demo"+img;
  save(s+".jpg");
}

void keyPressed(){
  if(key=='t') { if(t<100) t++; }
  if(key=='e') { if(t>0)  t--; }
  if(key=='g') {showLerp=true; }
  if(key=='h') {showLerp=false; }
  if(key=='s') {saveImg(); }
}