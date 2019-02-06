pt P1=new pt(101,100), tP1=new pt(100,150);
pt P2=new pt(412,351), tP2=new pt(353,401);

float t=0.50, dt=0.01;

ArrayList<pt> ptList;
boolean lock=false;
int locked_index;
pt locked_pt;

void setup(){
  size(500,500);
  ptList=new ArrayList<pt>();
  ptList.add(P1);
  ptList.add(P2);
  ptList.add(tP1);
  ptList.add(tP2);
}

void draw(){
  background(255);
  fill(0);   
  displayPts();
  drawBiArc();  
  //t+=dt; if ((t>=1)||(t<=0)) dt=-dt; drawMorph(t);
}

void drawBiArc(){
  noFill();
  vec T1=U(V(P1,tP1));vec T2=U(V(tP2,P2)); vec T= W(T1,T2); vec S=V(P1,P2);  
  float d=sq(dot(S,T))+(sq(n(S))*(4- n2(T)));
  float a=(sqrt(d)- dot(S,T))/(4-n2(T));
  pt B1=new pt(P1.x,P1.y).add(S(a,T1));pt B2=new pt(P2.x,P2.y).add(S(-a,T2));pt C1=L(B1,B2,0.5);
  ellipse(B1.x,B1.y,20,20);ellipse(B2.x,B2.y,20,20);
  drawCircleArcInHat(P1,B1,C1);drawCircleArcInHat(C1,B2,P2);
}

void keyPressed(){
  if(key=='u'){
    //conSameSide=true;
  }
}

/*
*  MORPH
*/   
pt linearMorph(pt pA, pt C, float t){
  pt A=pA.make();
  A.moveTowards(C,t);  
  return A;
}

/*
*  UI
*/

void displayPts(){
  stroke(0);
  for(int i=0;i<ptList.size(); i++){
    pt P=ptList.get(i);
    //text(P.x+","+P.y,P.x,P.y);
    noFill();
    stroke(100,100,100);
    ellipse(P.x,P.y,15,15);
    stroke(0,0,0);
    fill(0);
    ellipse(P.x,P.y,5,5);
  }
}

void mousePressed(){
  float x=mouseX;
  float y=mouseY;
  float r=50;
  for(int i=0; i<ptList.size(); i++){
    pt p0=ptList.get(i);
    if(dis(x,y,p0.x,p0.y)<25){
        lock=true;
        locked_pt=p0;
        locked_index=i;  
        stroke(255,255,255);
        fill(255,0,0,50);
        ellipse(p0.x,p0.y,20,20); 
      }
    }
}

public void mouseDragged(){
  if(lock==true){
    pt P=ptList.get(locked_index);
    P.x=(mouseX);
    P.y=(mouseY);  
    stroke(255,255,255);
    fill(255,0,0,50);
    ellipse(P.x,P.y,20,20);   
  }
}

public double dis(float x, float y, float a, float b){
  double d=sqrt(sq(x-a) + sq(y-b));
  return d;
}