int scale;
int rows;
int cols;
Cell[] grid;
Cell current;

void setup(){
  size(600,600);  
  scale = 20;
  rows = width/scale;
  cols = height/scale;
  grid = new Cell[rows*cols];
  int i = 0;
  for(int x = 0; x < rows; x++){
     for(int y = 0; y < cols; y++){
         //println(x,y);
         grid[i] = new Cell(x,y);
         i++;
     }
  }
  current = grid[0];
}

void draw(){
  //frameRate(1);
  translate(scale/2,scale/2);
  for(int i = 0; i < grid.length; i++){
      grid[i].show();
  }
  Cell next = current.getUnvisitedNeighbor(grid);
  if (next != null){
     if (next.x < current.x){
         current.sides.put("left", false);
         next.sides.put("right", false);
     }
     else if (next.x > current.x){
       current.sides.put("right", false);
       next.sides.put("left", false);
     }
     else if (next.y < current.y){
       current.sides.put("top", false);
       next.sides.put("bottom", false);
     }
     else if (next.y > current.y){
       current.sides.put("bottom", false);
       next.sides.put("top", false);
     }
     current.visited = true;
     current = next; 
  }
  current.highlight();
}