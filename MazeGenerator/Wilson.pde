
/*

 cell.visited means that the cell is to stay permanently
 cell.current is the current walk that is growing. As soon as the current cell comes to a visited cell the walk is added to the permanent maze
 */
class Wilson extends Maze {

  List<Cell> walk;


  public Wilson(int rows, int cols, int size) {
    super(rows, cols, size);

    walk = new ArrayList<Cell>();


    int r =(int) random(grid.length);  
    int c = (int) random(grid[0].length);

 //<>//
    grid[r][c].current = false;
    grid[r][c].visited = true;
    grid[r][c].g = 90;
    grid[r][c].b = 90;
    grid[r][c].r = 90;
  }


  public boolean calculateNextStep() {

   List<Cell> unused = getUnusedCells();
   if(unused.isEmpty()){
     return false;
   }
    //create startpoint for the algorithm
    if (walk.isEmpty()) {
      Cell cell = unused.get((int)random(unused.size()));
      cell.current = true;
      walk.add(cell);
      return true;
    }


    //add a random cell to the line
    Cell last = walk.get(walk.size()-1);
    List<Cell> possibleNext = getAllNeighbours(last);
    //remove the last item from the list
    if (walk.size()>1) {
      //remove the previous from the possible options
      possibleNext.remove(walk.get(walk.size()-2));
    }
    Cell next = possibleNext.get((int)random(possibleNext.size()));

    // the walk is finished since it reached a part of the permanent maze
    if (next.visited == true) {
      removeWalls(last, next);
      for (Cell c : walk) {
        c.visited = true;
        c.current = false;
        c.r = 90;
        c.g = 90;
        c.b = 90;
      }
      walk.clear();
      return true;
    }
    // a loop is created, delete all the items from the list untill next is reached
    if (next.current == true) {
      ListIterator<Cell> it = walk.listIterator(walk.size());
      while (it.hasPrevious()) {
        Cell c = it.previous();
        if (c.equals(next)) {
          c.resetShields();
          if (it.hasPrevious()) {
            removeWalls(c, it.previous());
            break;
          }
        }
        c.resetShields();
        c.current = false;
        it.remove();
      }
      return true;
    }
    // last option is that the next item is added to the walk 
    walk.add(next);
    next.current = true;

    removeWalls(last, next);


    return true;
  }

  private List<Cell> getUnusedCells() {

    List<Cell> lst = new ArrayList<Cell>();
    for (Cell[] row : maze.grid) {
      for (Cell cell : row) {
        if (!cell.visited) {
          lst.add(cell);
        }
      }
    }
    return lst;
  }


  /*
   Get all the neighbouring cells that are unvisited
   */
  private List<Cell> getAllNeighbours(Cell c) {

    int x = c.x;
    int y = c.y;
    List<Cell> neighbours = new ArrayList<Cell>();
    //top
    if (y-1 >= 0 )
      neighbours.add(grid[y-1][x]);
    //bottom
    if (y+1 < rows)
      neighbours.add(grid[y+1][x]);

    if (x-1 >= 0)
      neighbours.add(grid[y][x-1]);

    if (x+1 < cols)
      neighbours.add(grid[y][x+1]);

    return neighbours;
  }
}
