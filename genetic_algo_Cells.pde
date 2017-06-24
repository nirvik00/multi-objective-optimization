ArrayList<String>target_numbers;
ArrayList<String>target_distances;

Population pop;

void setup(){
  //frameRate(10); 
  size(600,900);
  background(255);

  target_numbers=new ArrayList<String>();
  target_numbers.add("0,7");
  target_numbers.add("1,7");
  target_numbers.add("2,3");
  target_numbers.add("3,5");
  
  target_distances=new ArrayList<String>();
  target_distances.add("0,1,70");
  target_distances.add("0,2,50");
  target_distances.add("0,3,35");
  target_distances.add("1,2,70");
  //target_distances.add("2,3,60");
   
  pop=new Population(target_numbers, target_distances);
  
}

void draw(){
  pop.createMatingPool();
  pop.naturalSelection();
  pop.displayPopulation();
  pop.plotPopulation(); 

}

void mousePressed(){  
 saveFrame("nir1######.jpg");
}