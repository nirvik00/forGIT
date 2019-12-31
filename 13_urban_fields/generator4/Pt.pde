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
    ellipse(x,y,5,5);
  }
  void display2(){
    noStroke();
    fill(0,0,255,100);
    ellipse(x,y,15,15);
  }
}
