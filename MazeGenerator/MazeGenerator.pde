

int number = 40;
int cols;
int rows;
int size;
boolean doNextStep = true;
Maze maze;

void setup() {
  size(400, 400);
  cols =  number;
  rows = number;
  size = width/number;
  maze = new Maze(rows, cols);
  frameRate(30);
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
    doNextStep = maze.depthFirstStep();
    if (!doNextStep) {
      maze.current.current = false;
    }
  }
}
