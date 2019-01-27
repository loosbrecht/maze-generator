import java.util.Stack; //<>// //<>//
import java.util.List;

class Maze {

  Cell[][] grid;
  List<Stack<Cell>> stacks;
  Cell[] currentCells;
  int rows;
  int cols;
  int pathFinders;

 boolean[] stillGoing;

  public Maze(int rows, int cols) {
    this(rows, cols, 1);
  }
  public Maze(int rows, int cols, int pathF) {
    this.rows = rows; //<>//
    this.cols = cols;
    this.pathFinders = pathF;
    this.stacks = new ArrayList<Stack<Cell>>();
 this.currentCells = new Cell[pathFinders];
    this.stillGoing = new boolean[pathFinders];
    for (int i=0; i< pathFinders; ++i) {
      stacks.add( new Stack<Cell>());
      stillGoing[i] = true;
    }
   


    initialiseMaze();
  }

  private void initialiseMaze() {
    grid = new Cell[rows][cols];
    for (int y=0; y<rows; y++) {
      for (int x=0; x<cols; x++) {
        grid[y][x] = new Cell(x, y, size);
      }
    }

 //<>//
    grid[0][0].current = true;
    grid[0][0].visited = true;
    for (int i = 0; i<pathFinders; ++i) {
      currentCells[i] = grid[0][0];
    }
  }

  public boolean multipleDepthFirstStep() {
    
    for (int i =0; i< pathFinders; ++i) {
      
      if (stillGoing[i]) {
        Cell res = depthFirstStep(currentCells[i], stacks.get(i));
        if (res == null) {
          currentCells[i].current = false;
          stillGoing[i] = false;
        } else {
          currentCells[i] = res;
         
        }
      }
    }
 
    for(int i = 0; i< pathfinders; ++i){
      //as long as one path is still going, continue processing
      if(stillGoing[i])
        return true;
    }
    return false;
  }

  /*
  Calculate the next step in the depth first algorithm
   returns false if done;
   */
  private Cell depthFirstStep(Cell current, Stack<Cell> stack) {
    // check if a unvisited cell is remaining
    if (!unvisitedCellRemaining())
      return null;
    // get all the unvisited neighours
    List<Cell> unvisitedNeighbours = getUnvisitedNeighbours(current);
    if (!unvisitedNeighbours.isEmpty()) {
      // get next random cell
      Cell next = unvisitedNeighbours.get((int)random(unvisitedNeighbours.size()));
      //push current to the stack
      stack.push(current);
      // remove walls;
      removeWalls(current, next);

      //keep the new current cell & mark as visited
      current.current = false;
      current = next;
      current.current = true;
      current.visited = true;
    } else if (!stack.isEmpty()) {
      // go back to the previous cell when current cell can't advance anymore
      current.current = false;
      current = stack.pop();
      current.current = true;
    } else {
      return null;
    }

    return current;
  }
  /*
   Check if an unvisited cell  is present in the grid
   */
  private boolean unvisitedCellRemaining() {
    for (Cell[] row : maze.grid) {
      for (Cell cell : row) {
        if (!cell.visited)
          return true;
      }
    }
    return false;
  }
  /*
   Get all the neighbouring cells that are unvisited
   */
  private List<Cell> getUnvisitedNeighbours(Cell c) {

    int x = c.x;
    int y = c.y;
    List<Cell> neighbours = new ArrayList<Cell>();
    //top
    if (y-1 >= 0 && !grid[y-1][x].visited)
      neighbours.add(grid[y-1][x]);
    //bottom
    if (y+1 < rows && !grid[y+1][x].visited)
      neighbours.add(grid[y+1][x]);

    if (x-1 >= 0 && !grid[y][x-1].visited)
      neighbours.add(grid[y][x-1]);

    if (x+1 < cols && !grid[y][x+1].visited)
      neighbours.add(grid[y][x+1]);

    return neighbours;
  }
  /*
   Remove the walls between the current and the next cell
   */
  private void removeWalls(Cell current, Cell next) {
    if (current.x+1 == next.x) {
      current.right = false;
      next.left = false;
    } else if (current.x-1 == next.x) {
      current.left = false;
      next.right = true;
    } else if (current.y+1 == next.y) {
      current.bottom = false;
      next.top = false;
    } else if (current.y-1 == next.y) {
      current.top = false;
      next.bottom = false;
    }
  }
}
