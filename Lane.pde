public class Lane extends Rectangle {
  private Physical[] tiles;
  private int col;
  private int type;

  public Lane(int index, int t, int n, float len, float spacing, float speed, color col) {
    super(0, index*grid, width, grid);
    this.col = col;
    this.type = t;
    this.tiles = new Physical[n];
    float offset = random(0, 200);
    
    for (int i = 0; i < n; i++)
      tiles[i] = new Physical(offset + spacing*i, index*grid, grid*len, grid, speed);
  }

  public Lane(int index, color col) {
    super(0, index*grid, width, grid);
    this.tiles = new Physical[0];
    this.type = SAFE;
    this.col = col;
  }

  public void check(Frog frog) {
    if (type == CAR_ID) {
      
      for (Physical t : tiles) {
        if (frog.intersects(t))
          reset();
      }
      
    } else if (type == LOG_ID) {
      
      boolean onGround = false;
      for (Physical t : tiles) {
        if (frog.intersects(t)) {
          onGround = true;
          frog.sit(t);
        }
      }
      
      if (!onGround)
        reset();
    }
  }

  public void run() {
    fill(col);
    noStroke();
    rect(x, y, w, h);
    
    for (Physical t : tiles) {
      t.update();
      t.show();
    }
  }
}
