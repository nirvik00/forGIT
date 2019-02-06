
boolean CRV0=false;
boolean CRV1=false;
boolean CRV2=false;
boolean CRV3=false;


boolean lockA=false;
boolean lockB=false;
boolean lockC=false;
boolean lockD=false;
boolean lockE=false;
boolean lockF=false;


pt A=new pt(200,400);
pt B=new pt(100,300);
pt C=new pt(250,50);
pt D=new pt(450,100);
pt E=new pt(400,300);
pt F=new pt(300,350);

void setup(){
  size(700,700);
}
void draw(){  
  background(255);
  fill(0);
  ellipse(A.x,A.y,10,10);
  ellipse(B.x,B.y,10,10);
  ellipse(C.x,C.y,10,10);
  ellipse(D.x,D.y,10,10);
  ellipse(E.x,E.y,10,10);
  ellipse(F.x,F.y,10,10);
  noFill();
  
  text("A",A.x,A.y-15);
  text("B",B.x,B.y-15);
  text("C",C.x,C.y-15);
  text("D",D.x,D.y-15);
  text("E",E.x,E.y-15);
  text("F",F.x,F.y-15);
  if(CRV0==true) quadBezier();
  if(CRV1==true) cubicBezier();
  if(CRV2==true) quarticBezier();
  if(CRV3==true) quinticBezier();
  
  
  String str="keyboard controls ";
  str+="\n-----------------------------------------------";
  str+="\nPress 'a' for quadratic Bezier (red) ";
  str+="\nPress 'b' for cubic Bezier (green)";
  str+="\nPress 'c' for quartic Bezier (blue)";
  str+="\nPress 'd' for cubic Bezier (yellow)";
  fill(0); text(str,500,600);
  
}

public void quadBezier(){
  stroke(200);
  line(A.x,A.y,B.x,B.y);
  line(B.x,B.y,D.x,D.y);    
  for(float t=0; t<1; t+=0.01){
    float x=(A.x*pow((1-t),2)) + (B.x*2*(1-t)*t) + D.x*pow(t,2);
    float y=(A.y*pow((1-t),2)) + (B.y*2*(1-t)*t) + D.y*pow(t,2);
    fill(255,0,0);noStroke();ellipse(x,y,5,5);stroke(0);
  }
}

public void cubicBezier(){
  stroke(200);
  line(A.x,A.y,B.x,B.y);
  line(B.x,B.y,C.x,C.y);
  line(C.x,C.y,D.x,D.y);
  for(float t=0; t<1; t+=0.01){
    float x=(A.x*pow((1-t),3)) + (B.x*3*pow((1-t),2)*t) + (C.x*3*(1-t)*sq(t)) + D.x*pow(t,3);
    float y=(A.y*pow((1-t),3)) + (B.y*3*pow((1-t),2)*t) + (C.y*3*(1-t)*sq(t)) + D.y*pow(t,3);
    fill(0,255,0);noStroke();ellipse(x,y,5,5);stroke(0);
  }
}
public void quarticBezier(){
  stroke(200);
  line(A.x,A.y,B.x,B.y);
  line(B.x,B.y,C.x,C.y);
  line(C.x,C.y,D.x,D.y);
  line(D.x,D.y,E.x,E.y);  
  for(float t=0; t<1; t+=0.01){
    float x=(A.x*pow((1-t),4)) + (B.x*4*pow((1-t),3)*t) + (C.x*6*sq(1-t)*sq(t)) + (D.x*4*(1-t)*pow(t,3)) + E.x*pow(t,4);
    float y=(A.y*pow((1-t),4)) + (B.y*4*pow((1-t),3)*t) + (C.y*6*sq(1-t)*sq(t)) + (D.y*4*(1-t)*pow(t,3)) + E.y*pow(t,4);
    fill(0,0,255);noStroke();ellipse(x,y,5,5);stroke(0);
  }
}
public void quinticBezier(){
  stroke(200);
  line(A.x,A.y,B.x,B.y);
  line(B.x,B.y,C.x,C.y);
  line(C.x,C.y,D.x,D.y);
  line(D.x,D.y,E.x,E.y);
  line(E.x,E.y,F.x,F.y);
  for(float t=0; t<1; t+=0.001){
    float x=(A.x*pow((1-t),5)) + (B.x*5*pow((1-t),4)*t) + (C.x*10*pow((1-t),3)*sq(t)) + (D.x*10*sq(1-t)*pow(t,3)) + E.x*5*(1-t)*pow(t,4) + F.x*pow(t,5);
    float y=(A.y*pow((1-t),5)) + (B.y*5*pow((1-t),4)*t) + (C.y*10*pow((1-t),3)*sq(t)) + (D.y*10*sq(1-t)*pow(t,3)) + E.y*5*(1-t)*pow(t,4) + F.y*pow(t,5);
    fill(150,150,0);noStroke();ellipse(x,y,5,5);stroke(0);
  }
}

void keyPressed(){
  
  if(key=='a'){
    CRV0=true;
    CRV1=false;
    CRV2=false;
    CRV3=false;
  }
  if(key=='b'){
    CRV0=false;
    CRV1=true;
    CRV2=false;
    CRV3=false;
  }
  if(key=='c'){
    CRV0=false;
    CRV1=false;
    CRV2=true;
    CRV3=false;
  }
  if(key=='d'){
    CRV0=false;
    CRV1=false;
    CRV2=false;
    CRV3=true;
  }

}


void mousePressed(){
  float x=mouseX;
  float y=mouseY;
  float r=50;
  if(dis(x,y,A.x,A.y)<25){
    noFill();
    ellipse(A.x,A.y,r,r);
    lockA=true;
    lockB=false;
    lockC=false;
    lockD=false;
  }else if(dis(x,y,B.x,B.y)<25){
    noFill();
    ellipse(B.x,B.y,r,r);
    lockA=false;
    lockB=true;
    lockC=false;
    lockD=false;
  }else if(dis(x,y,C.x,C.y)<25){
    noFill();
    ellipse(C.x,C.y,r,r);
    lockA=false;
    lockB=false;
    lockC=true;
    lockD=false;    
  }else if(dis(x,y,D.x,D.y)<25){
    noFill();
    ellipse(D.x,D.y,r,r);
    lockA=false;
    lockB=false;
    lockC=false;
    lockD=true;
  }else if(dis(x,y,E.x,E.y)<25){
    noFill();
    ellipse(E.x,E.y,r,r);
    lockA=false;
    lockB=false;
    lockC=false;
    lockD=false;
    lockE=true;
    lockF=false;
  }else if(dis(x,y,F.x,F.y)<25){
    noFill();
    ellipse(F.x,F.y,r,r);
    lockA=false;
    lockB=false;
    lockC=false;
    lockD=false;
    lockE=false;
    lockF=true;    
  }
}

public void mouseDragged(){
  if(lockA==true){
    A.x=mouseX;
    A.y=mouseY;
  }else if(lockB==true){
    B.x=mouseX;
    B.y=mouseY;    
  }else if(lockC==true){
    C.x=mouseX;
    C.y=mouseY;    
  }else if(lockD==true){
    D.x=mouseX;
    D.y=mouseY;
  }else if(lockE==true){
    E.x=mouseX;
    E.y=mouseY;
  }else if(lockF==true){
    F.x=mouseX;
    F.y=mouseY;
  }
}

public double dis(float x, float y, float a, float b){
  double d=sqrt(sq(x-a) + sq(y-b));
  return d;
}