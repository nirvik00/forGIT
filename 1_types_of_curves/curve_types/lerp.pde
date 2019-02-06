float[][] lerp(float a0, float b0, float a1, float b1, int num){
  float[][] pts= new float[num+1][2];
  float mag=di(a0,b0,a1,b1);
  int k=0;
  float n= 1f / ((float)num);
  for(float i=0f; i<1f+n; i+=n){    
    float ux=(a1-a0); float uy=(b1-b0);
    float x=a0+i*(ux); float y=b0+i*uy; 
    pts[k][0]=x; pts[k][1]=y;
    k++;
  }
  return pts;
}

float di(Pt P, Pt Q){
  float a=P.x; float b=P.y; float c=Q.x; float d=Q.y;
  return sqrt((a-c)*(a-c)+(b-d)*(b-d));
}

float di(float a, float b, float c, float d){
  return sqrt((a-c)*(a-c)+(b-d)*(b-d));
}