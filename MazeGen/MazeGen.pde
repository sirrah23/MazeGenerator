int scale;
int rows;
int cols;
Cell[] grid;
Cell current;
ArrayList<Cell> stack = new ArrayList<Cell>();

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
  //frameRate(4);
  //translate(scale/2,scale/2);
  for(int i = 0; i < grid.length; i++){
      grid[i].show();
  }
  current.highlight();
  Cell next = current.getUnvisitedNeighbor(grid);
  if (next != null){
     removeWall(next, current);
     if (!current.visited){
       stack.add(current);
     }
     current.visited = true;
     current = next; 
     return;
  } else if (stack.size()>0) {
      current.visited = true;  // duplicated in code, causes issues...
      current = stack.get(stack.size()-1);
      stack.remove(stack.size()-1);
      return;
  }
}

void removeWall(Cell a, Cell b){
     if (a.x < b.x){
         b.sides.put("left", false);
         a.sides.put("right", false);
     }
     else if (a.x > b.x){
       b.sides.put("right", false);
       a.sides.put("left", false);
     }
     else if (a.y < b.y){
       b.sides.put("top", false);
       a.sides.put("bottom", false);
     }
     else if (a.y > b.y){
       b.sides.put("bottom", false);
       a.sides.put("top", false);
     }
  
}