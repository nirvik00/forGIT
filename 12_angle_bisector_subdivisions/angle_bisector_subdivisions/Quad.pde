class Quad{
  Pt A, B, C, D;
  Quad(Pt a, Pt b, Pt c, Pt d){
    A=a; B=b; C=c; D=d;
  }
  void display(int i){    
    fill(0);
    text("# " + i,((A.x+B.x)/2),(B.y+C.y)/2);
    fill(0,0,255,50);
    beginShape();
    vertex(A.x,A.y);
    vertex(B.x,B.y);
    vertex(C.x,C.y);
    vertex(D.x,D.y);
    endShape();
  }  
  void display2(){    
    fill(0);    
    fill(255,0,0);
    beginShape();
    vertex(A.x,A.y);
    vertex(B.x,B.y);
    vertex(C.x,C.y);
    vertex(D.x,D.y);
    endShape();
  }  
}