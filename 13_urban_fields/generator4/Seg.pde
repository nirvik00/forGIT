class Seg{
  Pt p,q;
  boolean used=false;
  boolean me;
 
  Seg(Pt p_, Pt q_){
    p=p_;
    q=q_;
    
  }
  
  Pt getMp(){
    Pt r=new Pt((p.x+q.x)/2, (p.y+q.y)/2);
    return r;
  }
  
  void display(){
    if(used==false){
      stroke(0,0,255,100);
    }else{
      stroke(255,0,0,150);
    }
    strokeWeight(2);
    line(p.x,p.y,q.x,q.y);
  }
}
