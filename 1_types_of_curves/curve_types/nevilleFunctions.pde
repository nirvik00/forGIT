void nevilleFunction(float[] ar, float[] bs){
  int num=30;
  float[][] pts01=new float[num+1][2];
  float[][] pts23=new float[num+1][2];
  float[][] nvSeg= new float[num+1][4];
  
  pts01=lerp(ar[0],ar[1],ar[2],ar[3],num);
  pts23=lerp(bs[0],bs[2],bs[2],bs[3],num);
  
  for(int i=0; i<num+1; i++){
    float a=pts01[i][0]; float b=pts01[i][1];
    float c=pts23[i][0]; float d=pts23[i][1];
    //ellipse(a,b,5,5); ellipse(c,d,5,5); line(a,b,c,d); /* display interpolations */     
    nvSeg[i][0]=a;nvSeg[i][1]=b;nvSeg[i][2]=c;nvSeg[i][3]=d;    
  } 
  
  float k=0f;
  for(int i=0; i<num-1; i++){    
    float a0=nvSeg[i][0];float b0=nvSeg[i][1];float a1=nvSeg[i][2];float b1=nvSeg[i][3];
    float p=a0+ (k/(num+1))*(a1-a0); float q=b0+ (k/(num+1))*(b1-b0);
    float a2=nvSeg[i+1][0];float b2=nvSeg[i+1][1];float a3=nvSeg[i+1][2];float b3=nvSeg[i+1][3];
    float r=a2+((k+1)/(num+1))*(a3-a2); float s=b2+((k+1)/(num+1))*(b3-b2);      
    stroke(255,0,0); strokeWeight(1); line(p,q,r,s);    
    k++;
  }
}