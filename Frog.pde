public class Frog extends Rectangle {
  private Physical sitting = null;

  public Frog(float x, float y, float w) {
    super(x, y, w, w);
  }

  public void sit(Physical log) {
    sitting = log;
  }

  public void update() {
    if (sitting != null)
      x += sitting.speed;

    x = constrain(x, 0, width-w);
    y = constrain(y, 0, height-h);
  }

  public void show() {
    fill(0, 255, 0, 200);
    image(loadImage("frog.png"), x, y, w, w);
  }

  public void move(float xdir, float ydir) {
    x += xdir * grid;
    y += ydir * grid;
    sit(null);
  }
  
}
