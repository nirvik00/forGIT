class Pt{
  String name;
  float x,y;
  Pt(){ }
  Pt(float x_, float y_){ name=""; x=x_; y=y_; }
  Pt(String n, float x_, float y_){ name=n;x=x_; y=y_; }
  void display(){ stroke(0); strokeWeight(1); fill(0); ellipse(x,y,5,5); text(name,x+10,y+15); }  
} 