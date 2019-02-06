void bezierFunction(Pt A, Pt B, Pt C, Pt D){ 
  Pt M=new Pt("M",(A.x+B.x)/2,(A.y+B.y)/2); M.display();
  int num=30;
  ArrayList<Pt> pts01 =new ArrayList<Pt>();
  ArrayList<Pt> pts23 =new ArrayList<Pt>();
  ArrayList<Pt> bezSeg=new ArrayList<Pt>(); 
  
  pts01=lerp(C,M,num); pts23=lerp(M,D,num);
  
  
  for(int i=0; i<pts01.size(); i++){
    Pt P=pts01.get(i); Pt Q=pts23.get(i);
    ArrayList<Pt>R=lerp(P,Q,num); bezSeg.add(R.get(i));    
  }
  noFill();
  beginShape();
  for(int i=0; i<bezSeg.size(); i++){
    vertex(bezSeg.get(i).x,bezSeg.get(i).y);
  }
  endShape();
  
  
  
  
}

ArrayList<Pt> lerp(Pt P, Pt Q, int num){
  ArrayList<Pt> ptL=new ArrayList<Pt>(); 
  for(int i=0; i<num+1; i++){
    float x=P.x+i*(Q.x-P.x)/num; float y=P.y+i*(Q.y-P.y)/num;
    ptL.add(new Pt(x,y));
  }
  return ptL;
}