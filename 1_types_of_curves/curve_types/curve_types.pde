float x0, y0, x1, y1;
float x2, y2, x3, y3;

Pt A,B,C,D;


float holdx, holdy; boolean hold=false;

void setup(){
  size(500,500);
  x0=250; y0=50; x1=250; y1=300; 
  x2=50; y2=400; x3=450; y3=400;
  
  
}

void draw(){
  background(255);
  stroke(0,0,0); strokeWeight(1);
  A=new Pt("A",x0,y0);B=new Pt("B",x1,y1);
  C=new Pt("C",x2,y2);D=new Pt("D",x3,y3);
  
  line(x0,y0,x1,y1);line(x2,y2,x3,y3);
  A.display(); B.display(); C.display(); D.display();  
  
  float[] ar={x0,y0,x1,y1};
  float[] bs={x2,y2,x3,y3};
  nevilleFunction(ar,bs);
  
  float[] ar1={x1,y1,x0,y0};
  float[] bs1={x3,y3,x2,y2};
  nevilleFunction(ar1,bs1);  
  
  bezierFunction(A,B,C,D);
}


void mousePressed(){
  if(abs(mouseX-x0)<30 && abs(mouseY-y0)<30){ holdx=x0; holdy=y0; hold=true; }
  if(abs(mouseX-x1)<30 && abs(mouseY-y1)<30){ holdx=x1; holdy=y1; hold=true;}
  if(abs(mouseX-x2)<30 && abs(mouseY-y2)<30){ holdx=x2; holdy=y2; hold=true;}
  if(abs(mouseX-x3)<30 && abs(mouseY-y3)<30){ holdx=x3; holdy=y3; hold=true;}
}
void mouseDragged(){

}
void mouseReleased(){
  if(hold==true && holdx==x0 && holdy==y0){ x0=mouseX; y0=mouseY; hold=false; }
  if(hold==true && holdx==x1 && holdy==y1){ x1=mouseX; y1=mouseY; hold=false; }
  if(hold==true && holdx==x2 && holdy==y2){ x2=mouseX; y2=mouseY; hold=false; }
  if(hold==true && holdx==x3 && holdy==y3){ x3=mouseX; y3=mouseY; hold=false; }
}