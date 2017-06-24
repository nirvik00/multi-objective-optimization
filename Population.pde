PFont font;  

class Population{
  ArrayList<DNA> dnalist;
  ArrayList<DNA> matingPool;
  ArrayList<String>target_number;
  ArrayList<String>target_distances;
  
  Population(ArrayList<String>target_num_, ArrayList<String>target_di_){
    font=createFont("Consolas", 14);
    
    target_number=new ArrayList<String>();    
    target_number.clear();
    target_number.addAll(target_num_);
    
    target_distances=new ArrayList<String>();    
    target_distances.clear();
    target_distances.addAll(target_di_);
    
    dnalist=new ArrayList<DNA>();
    matingPool=new ArrayList<DNA>();
    
    for(int i=0; i<7; i++){
      DNA dna=new DNA();
      dnalist.add(dna);    
      dna.displayGenes();
    }
  }
  
  void createMatingPool(){
    if(matingPool.size()>8000){
      ArrayList<DNA>remList=new ArrayList<DNA>();
      for(int i=500; i<7000; i++){
        remList.add(matingPool.get(i));
      }      
      background(255);
      text("clearing memory",200,200);
      matingPool.removeAll(remList);
    }
    for(int i=0; i<dnalist.size(); i++){
      DNA dna=dnalist.get(i);
      float f0=Float.parseFloat(dna.fitness_numbers(target_number).split("-")[1]);
      CellObj cell=new CellObj(90*i, dna); 
      float f1=cell.fitness_distance(target_distances);
      float f=(f0+f1)/2;
      println(f0+" , "+f1+" , "+f);
      int num=(int)(f*10);
      for(int j=0; j<num; j++){
        matingPool.add(dna);
      }
    }
  }
  
  void naturalSelection(){    
    for(int i=0; i<dnalist.size(); i++){
      int a=int(matingPool.size()-1);
      int b=int(matingPool.size()-1);
      DNA dnaA=matingPool.get(a);
      DNA dnaB=matingPool.get(b);
      DNA dnaC=dnaA.crossOver(dnaB);
      dnalist.set(i,dnaC);      
    }
  }
  
  void displayPopulation(){
    for(int i=0; i<dnalist.size(); i++){
      DNA dna=dnalist.get(i);
      dna.displayGenes();
    }
  }

void plotPopulation(){
   background(255);
   for(int i=0; i<dnalist.size(); i++){
     DNA dna=dnalist.get(i);     
     
     CellObj cell=new CellObj(90*i, dna); 
     cell.displayGeo();
     
     String str=dna.fitness_numbers(target_number);  
     String str0=str.split("-")[0];
     String str1=str.split("-")[1];
     String strf=str0+" : "+str1;
     float fit=Float.parseFloat(str1);     
     float f0=Float.parseFloat(dna.fitness_numbers(target_number).split("-")[1]);      
     float f1=cell.fitness_distance(target_distances);
     float f=((3*f0)+f1)/4;
        
     fill(0);
     text(strf, 250, 125+90*i);
     text(f1, 400, 125+90*i);
     text(f, 500, 125+90*i);
     
     if(fit>0.90 && fit<0.99){
       delay(1000);
       noFill();       
       stroke(255,0,0);
       strokeWeight(1);
       rect(10,60+90*i,555,80);
     }
     
     if(fit>0.99){
       delay(5000);
       noFill();
       stroke(255,0,0);
       strokeWeight(1.25);
       rect(10,60+90*i,555,80);
       strokeWeight(1);
       rect(12.5,63+90*i,550,75);
     }
   }
   write();
 }
 
  
void write(){
  fill(0);  
  text("1. NUMBERS :  yellow -> 7   red-> 7    green -> 3    blue -> 5", 50, 735 );
  text("2. DISTANCES :  yellow [0]   red [1]    green [2]    blue [3]", 50, 770 );
  for(int i=0; i<target_distances.size(); i++){
    String s0=target_distances.get(i).split(",")[0];
    String s1=target_distances.get(i).split(",")[1];
    String s2=target_distances.get(i).split(",")[2];
    text("["+s0+"] - "+"["+s1+"]"+" => "+s2, 50, 790+i*16 );
  }
  fill(0,0,255);
  text("FITNESSES EVALUATED FOR :", 30, 35);
  text("1. Numbers", 250, 35);
  text("2. Distances", 385, 35);
  text("3. Relationships", 490, 35);
  
}
}