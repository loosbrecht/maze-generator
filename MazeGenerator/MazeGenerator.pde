

int number = 40; // number of columns and rows
int pathfinders = 4;

int cols;
int rows;
int size;
boolean doNextStep = true;
Maze maze;

void setup() {
  size(800, 800);
  cols =  number;
  rows = number;
  size = width/number;
  
  //maze = new DepthFirst(rows, cols,pathfinders,cols/2, rows/2 );
  maze = new DepthFirst(rows, cols);
  //frameRate(30);
}

void draw() {
  background(255);
  for (Cell[] row : maze.grid) {
    for (Cell cell : row) {
      cell.draw();
    }
  }
  //calculate the next step
  if (doNextStep) {
    doNextStep = maze.calculateNextStep();
  }
}
