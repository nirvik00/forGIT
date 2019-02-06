class Pt{
  int x, y;
  Pt P0;
  boolean locked=false;
  Pt (){}
  Pt(int x_, int y_){
    x=x_; y=y_;
  }
  float di(Pt b){
    return sqrt((x-b.x)*(x-b.x) + (y-b.y)*(y-b.y));
  }
  float leftDi(){
    return P0.x-x;
  } 
}