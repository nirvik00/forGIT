class Pt{
  float x,y;
  boolean lock=false;
  Pt(float x_, float y_){ x=x_; y=y_; }
  float di(Pt p){
    return sqrt((x-p.x)*(x-p.x) + (y-p.y)*(y-p.y));
  }
  Pt csq(Pt p, Pt q, float f){
    Pt u=new Pt(p.x-x, p.y-y);   
    Pt v=new Pt(q.x-x, q.y-y); 
    float t=(acos((u.x*v.x + u.y*v.y) / (di(p)*di(q))))/2; /* dot product for angle theta */
    Pt e=new Pt(u.x*cos(t)-u.y*sin(t), u.x*sin(t)+u.y*cos(t));  /* rotate u by theta/2 */ 
    Pt r=new Pt(x+(e.x), y+(e.y) );    /* move point to x,y */
    Pt w=new Pt(x+(x-r.x)*f/di(r),y+(y-r.y)*f/di(r)); /* scale it correctly */
    
    /*  at mid-point take unit normal to u and scale to f  */
    Pt mp=new Pt((p.x+x)/2,(p.y+y)/2);
    Pt nmp=new Pt(mp.x-u.y*f/di(p),mp.y+u.x*f/di(p)); 
    boolean U=ptInPoly(nmp,p,q,new Pt(x,y)); /* check if the normal is in or not */
    Pt nxy=new Pt(x-u.y*f/di(p),y+u.x*f/di(p));
    if(U==false){
      nmp=new Pt(mp.x+u.y*f/di(p),mp.y-u.x*f/di(p));
      nxy=new Pt(x+u.y*f/di(p),y-u.x*f/di(p));
    }
    Pt ux=new Pt((nxy.x-nmp.x)/nmp.di(nxy),(nxy.y-nmp.y)/nmp.di(nxy));
    //stroke(0);strokeWeight(1);line(mp.x,mp.y,nmp.x,nmp.y);
    //line(nxy.x,nxy.y,nmp.x,nmp.y);
     
    
    /* if the angle bisector is outside the triangle then adjust */
    boolean T=ptInPoly(w,p,q,new Pt(x,y));
    if(T==true){
      strokeWeight(20); stroke(0,255,0,50);
    }else{
      t=PI-t;
      e=new Pt(u.x*cos(t)-u.y*sin(t), u.x*sin(t)+u.y*cos(t)); 
      r=new Pt(x+(e.x), y+(e.y) );
      w=new Pt(x+(x-r.x)*f/di(r),y+(y-r.y)*f/di(r));
      strokeWeight(20); stroke(255,0,0,50); 
    }
    
    Pt fpt=intx(nxy,nmp,new Pt(x,y),w);   
    //line(x,y,w.x,w.y);
    return fpt;
  }
  
  float angle(Pt p, Pt q){
    Pt u=new Pt(p.x-x, p.y-y);Pt v=new Pt(q.x-x, q.y-y);
    float t= acos((u.x*v.x + u.y+v.y)/(di(p)*di(q)));
    return t;
  }
  
  Pt med(Pt p, Pt q, float f){
    Pt e=new Pt((p.x+q.x)/2,(p.y+q.y)/2);    
    Pt r=new Pt(x+(x-e.x)*-f/e.di(new Pt(x,y)), y+(y-e.y)*-f/e.di(new Pt(x,y)));
    return r;
  }


  boolean ptInPoly(Pt o, Pt p, Pt q, Pt r){
    float AR=heron(p,q,r);  
    float sum=0;
    sum+=heron(o,p,q);
    sum+=heron(o,p,r);
    sum+=heron(o,r,q);
    //sum=AR;
    boolean t=false;
    if(abs(sum-AR)<0.1){
      t=true; //in poly
    }else{
      t=false; //not in poly
    }
    fill(0);
    noFill();
    return t;
  }
  float heron(Pt e, Pt f, Pt g){
    float l=e.di(f);
    float m=f.di(g);
    float n=g.di(e);
    float s=(l+m+n)/2;
    float ar=sqrt(s*(s-l)*(s-m)*(s-n));
    return ar;
  }
  
  Pt intx(Pt p, Pt q, Pt r, Pt s){
    float a1=q.y-p.y; float b1=p.x-q.x; float c1=a1*q.x+b1*q.y;
    float a2=s.y-r.y; float b2=r.x-s.x; float c2=a2*s.x+b2*s.y;
    float det=a1*b2-a2*b1; 
    float rx=(c1*b2-c2*b1)/det; float ry=(c2*a1-c1*a2)/det;
    
    return new Pt(rx,ry);
  }
  
}