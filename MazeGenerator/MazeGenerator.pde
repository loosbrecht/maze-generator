import java.util.*;

int number = 70; // number of columns and rows
int pathfinders = 4;

int cols;
int rows;
int size;
boolean doNextStep = true;
Maze maze;

void setup() {
  size(700, 700);
  cols =  number;
  rows = number;
  size = width/number;
  
  //maze = new DepthFirst(rows, cols,pathfinders,cols/2, rows/2 );
 // maze = new DepthFirst(rows, cols,size,pathfinders);
 maze = new Wilson(rows,cols,size);
  
}

void draw() {
  //calculate the next step
  if (doNextStep) {
    doNextStep = maze.calculateNextStep(); //<>//
  }
  
  background(255);
  for (Cell[] row : maze.grid) {
    for (Cell cell : row) {
      cell.draw();
    }
  }
   //<>//
}
