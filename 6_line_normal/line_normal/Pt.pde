class Pt{
  float x,y; boolean selected=false; Pt(float x_, float y_){ x=x_; y=y_; }
  float di(Pt p){  return sqrt((p.x-x)*(p.x-x) + (p.y-y)*(p.y-y)); } 
  void setSelected(boolean t){ selected=t; }   
  boolean getSelected(){ return selected; }  
  void display(){if(selected==true){ fill(255,0,0); ellipse(x,y,5,5); } else{ fill(255); ellipse(x,y,5,5); } }  
  Pt add(Pt p){ return new Pt(x+p.x, y+p.y); }  
}//end of class
  