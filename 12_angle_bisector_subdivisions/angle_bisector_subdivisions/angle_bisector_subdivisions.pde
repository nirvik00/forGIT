Pt a=new Pt(150,150);
Pt b=new Pt(550,150);
Pt c=new Pt(550,550);
Pt d=new Pt(150,550);

Pt[] pts={a,b,c,d};
boolean lock;

void setup(){
  size(700,700);  
}
void draw(){
  generate();
}

void update(){
  for(int i=0; i<4; i++){
    Pt A=pts[i]; Pt pA;
    for(int j=0; j<4; j++){
      Pt B=pts[j]; Pt pB;
      if(A.di(B)<5 && i != j){
        if(i==0){ 
          pA=pts[3];
        }else{
          pA=pts[i-1];
        }
        if(j==3){
          pB=pts[0];
        }else{
          pB=pts[j+1];
        }
       
        
      }
    }
  }
}

void generate(){
  background(255);
  stroke(0); strokeWeight(1);
  line(a.x,a.y,b.x,b.y);
  line(b.x,b.y,c.x,c.y);
  line(c.x,c.y,d.x,d.y);
  line(d.x,d.y,a.x,a.y);
  
  for(int i=0; i<4; i++){
    if(pts[i].lock==false){
      noFill(); strokeWeight(1); stroke(0);    
    }else{
      fill(255,0,0,50); strokeWeight(1); stroke(150);
    }
    ellipse(pts[i].x,pts[i].y,25,25);
  }
  float f=-70;
  Pt p=a.csq(b,d,f); 
  Pt q=b.csq(c,a,f);
  Pt r=c.csq(d,b,f);
  Pt s=d.csq(a,c,f);
  
  stroke(0); strokeWeight(1);
  line(a.x,a.y,p.x,p.y); 
  line(b.x,b.y,q.x,q.y);
  line(c.x,c.y,r.x,r.y);
  line(d.x,d.y,s.x,s.y);
  
  line(p.x,p.y,q.x,q.y);
  line(q.x,q.y,r.x,r.y);
  line(r.x,r.y,s.x,s.y);
  line(s.x,s.y,p.x,p.y);
  
  genSubdiv(a,b,p,q);
  genSubdiv(b,c,q,r);
  genSubdiv(c,d,r,s);
  genSubdiv(d,a,s,p);
  
  
  
  fill(0); 
  text("a", a.x-20,a.y-20);
  text("b", b.x+20,b.y-20);
  text("c", c.x+20,c.y+20);
  text("d", d.x-20,d.y+20);
  
  text("p", p.x+10,p.y+10);  
  text("q", q.x-10,q.y+10);
  text("r", r.x-10,r.y-10);
  text("s", s.x+10,s.y-10);
  text("Press  'r' or 'R' to reset", 150,70);
  
}

void mouseMoved(){
 Pt m=new Pt(mouseX, mouseY);
 for(int i=0; i<4; i++){
   if((pts[i].di(m)<25)){
     pts[i].lock=true;     
   }
 }  
 for(int i=0; i<4; i++){
   if((pts[i].di(m)>25)){
     pts[i].lock=false;
   }
 }
}
void mouseDragged(){
  Pt m=new Pt(mouseX, mouseY);
  for(int i=0; i<4; i++){
   if(pts[i].lock==true){     
     pts[i].x=m.x; pts[i].y=m.y;
   }
 }
}

void mouseReleased(){
  Pt m=new Pt(mouseX, mouseY);
  for(int i=0; i<4; i++){
   if(pts[i].lock==true){     
     pts[i].x=m.x; pts[i].y=m.y;
     pts[i].lock=false;
   }
 }
}
void reset(){
  a=new Pt(100,100);
  b=new Pt(400,100);
  c=new Pt(400,400);
  d=new Pt(100,400);
  pts[0]=a; pts[1]=b; pts[2]=c; pts[3]=d;
}
void keyPressed(){
  if(key=='r') reset();
  if(key=='g') generate();
}