Pt move(Pt p){
  float r=random(10);
  Pt R;
  if(r<2.5){
    R=moveUp(p);
  }else if(r>2.5 && r<5.0){
    R=moveDn(p);
  }else if(r>5.0 && r<7.5){
    R=moveLe(p);
  }else{
    R=moveRi(p);
  }
  return R;
}

Pt getDir(float ang){
  ang+=random(randomAng);
  float x=R*cos(ang);
  float y=R*sin(ang);
  Pt p=new Pt(x,y);
  return p;
}

Pt moveUp(Pt p){
  Pt q=getDir(-PI/2);
  Pt r=new Pt(p.x+q.x, p.y+q.y);
  float di=sqrt((I.x-r.x)*(I.x-r.x) + (I.y-r.y)*(I.y-r.y));
  if(di<MaxDi){
    addSegPt(p,r);
  }
  return r;
}

Pt moveDn(Pt p){
  Pt q=getDir(PI/2);
  Pt r=new Pt(p.x+q.x, p.y+q.y);
  float di=sqrt((I.x-r.x)*(I.x-r.x) + (I.y-r.y)*(I.y-r.y));
  if(di<MaxDi){
    addSegPt(p,r);
  }
  return r;
}

Pt moveLe(Pt p){
  Pt q=getDir(-PI);
  Pt r=new Pt(p.x+q.x, p.y+q.y);
  float di=sqrt((I.x-r.x)*(I.x-r.x) + (I.y-r.y)*(I.y-r.y));
  if(di<MaxDi){
    addSegPt(p,r);
  }
  return r;
}

Pt moveRi(Pt p){
  Pt q=getDir(0);
  Pt r=new Pt(p.x+q.x, p.y+q.y);
  float di=sqrt((I.x-r.x)*(I.x-r.x) + (I.y-r.y)*(I.y-r.y));
  if(di<MaxDi){
    addSegPt(p,r);
  }
  return r;
}

boolean checkGlobalDist(Pt r){
  Pt v=new Pt(I.x-r.x, I.y-r.y);
  float d=sqrt(v.x*v.x + v.y*v.y);
  if(d<250) return true;
  return false;
}

void addSegPt(Pt p, Pt r){
  int sum=0;
  boolean t=checkGlobalDist(r);
  if(t==true){
    for(int i=0; i<ptLi.size(); i++){
      Pt q=ptLi.get(i);
      Pt u=new Pt(r.x-q.x, r.y-q.y);
      float d=sqrt(u.x*u.x + u.y*u.y);
      if(d<R/2){
        sum++;
        break;
      }
    }
    if(sum==0){
      ptLi.add(r);
      Seg seg=new Seg(p,r);
      segLi.add(seg);
    }
  }
}
