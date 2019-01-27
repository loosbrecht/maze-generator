import java.util.Stack;
import java.util.List;

public abstract class Maze {

  Cell[][] grid;
  int rows;
  int cols;
  int size;
  
  
  public Maze(int rows, int cols, int size) {
    this.rows = rows;
    this.cols = cols;
    this.size = size;
    initialiseMaze();
  }

  private void initialiseMaze() {
    grid = new Cell[rows][cols];
    for (int y=0; y<rows; y++) {
      for (int x=0; x<cols; x++) {
        grid[y][x] = new Cell(x, y, size);
      }
    }
  }
   abstract boolean calculateNextStep();
   
   /*
   Remove the walls between the current and the next cell
   */
   public void removeWalls(Cell current, Cell next) {
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
  
  /*
   Check if an unvisited cell  is present in the grid
   */
  public boolean unvisitedCellRemaining() {
    for (Cell[] row : maze.grid) {
      for (Cell cell : row) {
        if (!cell.visited)
          return true;
      }
    }
    return false;
  }
 
}
