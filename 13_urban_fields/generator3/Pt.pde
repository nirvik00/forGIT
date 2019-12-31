class Pt{
  float x,y;
  Pt(float x_, float y_){
    x=x_;
    y=y_;
  }
  void display(){
    stroke(0);
    strokeWeight(1);
    fill(255);
    ellipse(x,y,10,10);
  }
  void display2(){
    stroke(0);
    strokeWeight(1);
    fill(255,0,0);
    ellipse(x,y,15,15);
  }
}
