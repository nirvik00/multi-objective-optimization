class DNA{
  int[] genes;
  DNA(){
    genes=new int[22];    
    for(int i=0; i<genes.length; i++){
      genes[i]=(int)random(0,4);           
    }   
  }
  
  String fitness_numbers(ArrayList<String>target_num){ 
    String str_sum="";
    float[] fitness_arr=new float[target_num.size()];
    for(int i=0; i<target_num.size(); i++){      
      int id=Integer.parseInt(target_num.get(i).split(",")[0]);
      int num_req=Integer.parseInt(target_num.get(i).split(",")[1]);
      int genes_sum=0;
      for(int j=0; j<genes.length; j++){
        int genes_id=genes[j];
        if(id==genes_id){
          genes_sum++;
        }        
      }
      if(i<target_num.size()-1){
        str_sum+=genes_sum+",";
      }else{
        str_sum+=genes_sum;
      }
      float fitness=((float)num_req/(num_req+(Math.abs(genes_sum-num_req))));
      fitness_arr[i]=fitness;
    }
    float sum=0;
    for(int i=0; i<fitness_arr.length; i++){
      sum+=fitness_arr[i];
    }
    float f=sum/fitness_arr.length;
    String ret_str=str_sum+"-"+f;
    //println(str_sum+":"+f);
    return ret_str;
  }
  
  DNA crossOver(DNA dnaB){
    DNA child=new DNA();
    for(int i=0; i<genes.length; i++){
      if(i<genes.length/2){
        child.genes[i]=genes[i];
      }else{
        child.genes[i]=dnaB.genes[i];
      }
    }
    child.mutate();
    return child;
  }
  
  void mutate(){
    for(int i=0; i<genes.length; i++){
      float r=random(0,1);
      if(r<0.1){
        genes[i]=(int)random(0,4);
      }
    }    
  }
  
  String displayGenes(){
    String s="";
    for(int i=0; i<genes.length; i++){      
      s+=genes[i]+",";      
    }
    //println(s);
    return s;
  }
  
}