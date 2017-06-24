class CellObj{
  float posy, dy;
  ArrayList<String>geoList;
  DNA dna;
  
  CellObj(float posy_, DNA dna_){
    dna=dna_;
    posy=posy_;        
    geoList=new ArrayList<String>();
    
    stroke(0,0,0);
    strokeWeight(1);
    int counter=0;
    for(int i=0; i<10; i++){      
      int f0=dna.genes[counter];      
      int re0=getColr(f0)[0];
      int gr0=getColr(f0)[1];
      int bl0=getColr(f0)[2];
      fill(re0, gr0, bl0);
      //rect(20+i*20, posy+70 ,20,20);
      geoList.add(20+i*20 +"," + (posy+70) +","+ f0);
      counter++;
    }
    for(int i=0; i<10; i++){      
      int f1=dna.genes[counter];
      int re1=getColr(f1)[0];
      int gr1=getColr(f1)[1];
      int bl1=getColr(f1)[2];
      fill(re1, gr1, bl1);
      //rect(20+i*20,(posy+110),20,20);
      geoList.add(20+i*20 +"," + (posy+110) +","+ f1);
      counter++;
    }
  
    int f2=dna.genes[counter];
    int re2=getColr(f2)[0];
    int gr2=getColr(f2)[1];
    int bl2=getColr(f2)[2];
    fill(re2, gr2, bl2);
    //rect(20,(posy+90),20,20);
    geoList.add(20 +"," + (posy+90) +","+ f2);
    counter++;
    
  
    int f3=dna.genes[counter];
    int re3=getColr(f3)[0];
    int gr3=getColr(f3)[1];
    int bl3=getColr(f3)[2];
    fill(re3, gr3, bl3);
    //rect(200,(posy+90),20,20);
    geoList.add(200 +"," + (posy+90) +","+ f3);
    counter++;
    
  }
  float fitness_distance(ArrayList<String>target_di){    
    String str_fit="";
    for(int i=0; i<target_di.size(); i++){
      int id0=Integer.parseInt(target_di.get(i).split(",")[0]);
      int id1=Integer.parseInt(target_di.get(i).split(",")[1]);
      float target_dist=Float.parseFloat(target_di.get(i).split(",")[2]);      
      //start for each index      
      for(int j=0; j<geoList.size(); j++){       
        String s0=geoList.get(j);
        float x0=Float.parseFloat(s0.split(",")[0]);
        float y0=Float.parseFloat(s0.split(",")[1]);
        int idx0=Integer.parseInt(s0.split(",")[2]);
        float sum=0;
        int counter=0;                
        if(id0==idx0){
          String str_fit_ite="";
          for(int k=0; k<geoList.size(); k++){
            String s1=geoList.get(k);
            float x1=Float.parseFloat(s1.split(",")[0]);
            float y1=Float.parseFloat(s1.split(",")[1]);
            int idx1=Integer.parseInt(s1.split(",")[2]);
            if(id1==idx1){
              float d=dis(x0,y0,x1,y1);
              sum+=d;
              counter++;
            }            
          }
          //total sum of EACH index fitnesses
          float avg_dist=sum/counter;
          float f= ((target_dist)/(target_dist + Math.abs(target_dist-avg_dist)));
          str_fit_ite+=f+",";
          str_fit+=f+",";
          //println(sum+","+counter+","+avg_dist+","+str_fit_ite);
        }   
        //println("ite"+str_fit);
      }
      
    }
    //println("final"+str_fit);
    float sumX=0;
    for(int i=0; i<str_fit.split(",").length-1; i++){
      sumX+=Float.parseFloat(str_fit.split(",")[i]);
    }
    //println(str_fit.split(",").length + " - "+ sumX);
    float avg_fitness=(sumX/(str_fit.split(",").length));
    return avg_fitness;
  }
  
  float dis(float x0, float y0, float x1, float y1){
    float d=(float)(Math.sqrt((x0-x1)*(x0-x1) + (y0-y1)*(y0-y1)));
    return d;
  }
  
  int[] getColr(int function){
    int[] colr=new int[3];
    if(function==0){
      colr[0]=255;
      colr[1]=255;
      colr[2]=0;
    }else if(function==1){
      colr[0]=255;
      colr[1]=0;
      colr[2]=0;
    }else if(function==2){
      colr[0]=0;
      colr[1]=255;
      colr[2]=0;
    }else if(function==3){
      colr[0]=0;
      colr[1]=0;
      colr[2]=255;
    }
    return colr;
  }
  
  public void displayGeo(){
    for(int i=0; i<geoList.size(); i++){
        String s=geoList.get(i);        
        float x=Float.parseFloat(s.split(",")[0]);
        float y=Float.parseFloat(s.split(",")[1]);
        int f=Integer.parseInt(s.split(",")[2]);
        int f1=dna.genes[i];
        int re1=getColr(f1)[0];
        int gr1=getColr(f1)[1];
        int bl1=getColr(f1)[2];
        fill(re1, gr1, bl1);
        rect(x,y,20,20);
      }
  }
}