class Pt{
  float x,y;
  int locked=0;
  Pt(float x_, float y_){x=x_; y=y_;}
  float di(Pt p){
    return sqrt((x-p.x)*(x-p.x)+(y-p.y)*(y-p.y));
  }
  float norm(){
    return sqrt(x*x + y*y);
  }
}