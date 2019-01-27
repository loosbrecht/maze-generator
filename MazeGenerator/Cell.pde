class Cell { //<>//
  int x;
  int y;
  int size;
  boolean current;
  boolean visited;
  //defines the wall of a cell
  boolean top, left, right, bottom;
  int r;
  int g;
  int b;

  public Cell(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.current = false;
    this.visited = false;
    this.top = true;
    this.left = true;
    this.right = true;
    this.bottom = true;
  }
  
  public void addcolor(int c){
    r = c;
    g = 0;
    b = 0;
    if(r >= 255){
      r = 255;
      g = c-255;
    }
    if(g > 255){
      g = 255;
      b = c - 500;
    }
  }

  public void draw() {

    int x0 = x*size;
    int y0 = y*size;

    //fill the cell with a colour
    if (current)
      fill(#E85959);
    else if (visited){
      // fill(#5A5A5A);
     fill(r,g,b);
    }else
      fill(200);
    noStroke();
    rect(x*size, y*size, size, size);
    //draw all the walls of this cell
    stroke(0);
    if (top)
      line(x0, y0, x0+size, y0);
    if (left)
      line(x0, y0, x0, y0+size);
    if (bottom)
      line(x0, y0+size, x0+size, y0+size);
    if (right)
      line(x0+size, y0, x0+size, y0+size);
  }
}
