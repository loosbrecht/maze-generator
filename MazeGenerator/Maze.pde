import java.util.Stack;
import java.util.List;

public abstract class Maze {

  Cell[][] grid;
  int rows;
  int cols;
  
  
  public Maze(int rows, int cols) {
    this.rows = rows;
    this.cols = cols;
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
 
}
