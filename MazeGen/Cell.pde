class Cell{
  int x;
  int y;
  boolean visited;
  boolean current;
  HashMap<String,Boolean> sides;
  
  Cell(int x_,int y_){
    x = x_;
    y = y_;
    sides = new HashMap<String,Boolean>();
    sides.put("top", true);
    sides.put("left", true);
    sides.put("bottom", true);
    sides.put("right", true);
  }
  
  void show(){
    if (!visited){
      fill(0);
    } else {
      fill(120,196,222); 
    }
    noStroke();
    rect(x*scale, y*scale, scale, scale);
    stroke(255);
    if(sides.get("top"))
      line(x*scale, y*scale, x*scale+scale, y*scale); //top
    if(sides.get("left"))
      line(x*scale, y*scale, x*scale, y*scale+scale); //left
    if(sides.get("bottom"))
      line(x*scale, y*scale+scale, x*scale+scale, y*scale+scale); //bottom
    if(sides.get("right"))
      line(x*scale+scale, y*scale, x*scale+scale, y*scale+scale); //right    
  }
  
   void highlight(){
    fill(244,167,66);
    noStroke();
    rect(x*scale, y*scale, scale, scale);
   }
   
   int index(int x, int y){
      if(x < 0 || x >= rows || y < 0 || y >= cols){
         return -1;
      }
      return x * cols + y; 
   }
   
   Cell getUnvisitedNeighbor(Cell[] grid){
       ArrayList<Cell> PotentialNeighbors = new ArrayList<Cell>();
       int ind;
       ind = index(x, y-1);
       if ( ind != -1 && !grid[ind].visited){
           PotentialNeighbors.add(grid[ind]);
       }
       ind = index(x-1, y);
       if ( ind != -1 && !grid[ind].visited){
           PotentialNeighbors.add(grid[ind]);
       }
       ind = index(x, y+1);
       if ( ind != -1 && !grid[ind].visited){
           PotentialNeighbors.add(grid[ind]);
       }
       ind = index(x+1, y);
       if ( ind != -1 && !grid[ind].visited){
           PotentialNeighbors.add(grid[ind]);
       }
       if (PotentialNeighbors.size() > 0){
         return PotentialNeighbors.get(floor(random(PotentialNeighbors.size())));  
       } else {
         return null;  
       }
   }
}