Pt I;
float R=50;
float A=0;
float MaxDi=250;
ArrayList<Seg> segLi;
ArrayList<Pt> ptLi;

float randomAng=PI/45;

int numItrs;
int maxPts;

void setup(){
  size(500,500);
  
  segLi=new ArrayList<Seg>();
  ptLi=new ArrayList<Pt>();
  
  I=new Pt(width/2, height/2);
  ptLi.add(I);
  
  init();
}

void init(){
  moveUp(I);
  moveDn(I);
  moveLe(I);
  moveRi(I);
}

void draw(){
  background(255);
  I.display();
  for(int i=0; i<segLi.size(); i++){
    segLi.get(i).display();
  }
  for(int i=0; i<ptLi.size(); i++){
    ptLi.get(i).display();
  }
  
}

void runProgPt(){
  int i=(int) random(ptLi.size());
  Pt p=ptLi.get(i);
  move(p);
  println(ptLi.size(), segLi.size());
}

void keyPressed(){
  if(key=='e' || key=='E'){
    R=50;
    for(int i=0; i<300; i++){
      runProgPt();
    }
  }
  if(key=='r' || key=='R'){
    ptLi.clear();
    segLi.clear();
    init();
  }
}
