float x0=250, y0=250;

void setup(){
  size(700,500);
  background(255);
  ellipse(x0,y0,10,10);
  fill(255,0,0); text("Press 'e' to draw the angles", 10,400 );
}
void draw(){  
  
}

void keyPressed(){
  if(key=='e'){
    background(255);  fill(0); text("e was pressed", 600,400 );
    stroke(0); strokeWeight(1);
    float r=200;
    for(float i=0; i<2*PI-PI/6; i+=(PI/6)){
      float ang=i*180/PI;
      float x=x0+r*cos(i); float y=y0+r*sin(i); line(x0,y0,x,y); text(i, x,y); text(ang, x,y+30);
    }
  }
}