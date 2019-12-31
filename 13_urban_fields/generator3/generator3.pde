Pt I;
float R=50;
float A=0;
float MaxDi;
float randomAng=0; // PI/45;

ArrayList<Seg> segLi;
ArrayList<Pt> ptLi;
ArrayList<Pt> attrLi;

int MaxNum=5;

void setup(){
  size(1000,700);
  MaxDi=width/2;
  segLi=new ArrayList<Seg>();
  ptLi=new ArrayList<Pt>();
  attrLi=new ArrayList<Pt>();
  
  I=new Pt(width/2, height/2);
  // ptLi.add(I);
  
  init();
}

void init(){
  // add attractor points
  for(int i=0; i<MaxNum; i++){
    Pt a=new Pt(random(width/2)+250, random(height/2)+150);
    attrLi.add(a);
  }
  
  // add initial segments from I
  for(int i=0; i<attrLi.size(); i++){
    Pt p=attrLi.get(i);
    ptLi.add(p);
    moveUp(p);
    moveDn(p);
    moveLe(p);
    moveRi(p);
  }
}

void draw(){
  background(255);
  // I.display();
  for(int i=0; i<segLi.size(); i++){
    segLi.get(i).display();
  }
  for(int i=0; i<ptLi.size(); i++){
    ptLi.get(i).display();
  }
  for(int i=0; i<attrLi.size(); i++){
    attrLi.get(i).display2();
  }
  
  fill(0);
  text("Press r or R to reset", 10,10);
  text("Press (multiple) e or E to generate", 10,30);
  noFill();
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
    for(int i=0; i<100; i++){
      runProgPt();
    }
  }
  if(key=='r' || key=='R'){
    ptLi.clear();
    segLi.clear();
    attrLi.clear();
    init();
  }
}
