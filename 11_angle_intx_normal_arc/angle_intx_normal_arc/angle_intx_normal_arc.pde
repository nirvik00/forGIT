Pt A=new Pt(200,200); 
Pt B=new Pt(200,100); 
Pt D=new Pt(400,200);

void setup(){
  size(500,500);
}
void draw(){
  background(255);
  float dr=50;
  Pt u=new Pt((D.x-A.x)*dr/A.di(D), (D.y-A.y)*dr/A.di(D));
  
  stroke(0);strokeWeight(2);
  fill(255,0,0,50);
  beginShape();
  for(float i=0; i<PI/2; i+=PI/50){
    float e=2*PI-i;
    float x=A.x+ u.x*cos(e)-u.y*sin(e);
    float y=A.y+ u.x*sin(e)+u.y*cos(e);
    vertex(x,y);
  }
  vertex(A.x,A.y);
  vertex(D.x,D.y);
  endShape();
  
  stroke(150);strokeWeight(1);
  line(A.x,A.y,B.x,B.y); line(A.x,A.y,D.x,D.y);
  
  if(A.locked==1){noFill(); ellipse(A.x,A.y,25,25); fill(255,0,0,50); ellipse(A.x,A.y,10,10);}else{noFill(); ellipse(A.x,A.y,10,10);}
  if(B.locked==1){noFill(); ellipse(B.x,B.y,25,25); fill(255,0,0,50); ellipse(B.x,B.y,10,10);}else{noFill(); ellipse(B.x,B.y,10,10);}
  if(D.locked==1){noFill(); ellipse(D.x,D.y,25,25); fill(255,0,0,50); ellipse(D.x,D.y,10,10);}else{noFill(); ellipse(D.x,D.y,10,10);}
}

void mouseMoved(){
  Pt mos=new Pt(mouseX, mouseY);
  float d0=mos.di(A);if(d0<30){A.locked=1;}else{A.locked=0;}
  float d1=mos.di(B);if(d1<30){B.locked=1;}else{B.locked=0;}
  float d2=mos.di(D);if(d2<30){D.locked=1;}else{D.locked=0;}
}

void mouseDragged(){
 if(A.locked==1){A.x=mouseX; A.y=mouseY; }
 if(B.locked==1){B.x=mouseX; B.y=mouseY; }
 if(D.locked==1){D.x=mouseX; D.y=mouseY; }
}