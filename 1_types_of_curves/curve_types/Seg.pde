class Seg{
  Pt A,B; String name;
  ArrayList<Pt> bezPts;
  
  Seg(Pt a, Pt b){ name =""; A=a; B=b; bezPts=new ArrayList<Pt>(); }
  Seg(String n, Pt a, Pt b){ name=n; A=a; B=b;  bezPts=new ArrayList<Pt>(); }
  
  ArrayList<Pt> toCrv(float d){
     bezPts.clear();
     Pt M=mpSeg();
         
     return bezPts;
  }
  
  Pt mpSeg(){
    return new Pt((A.x+B.x)/2,(A.y+B.y)/2);
  }
  
}