public class Physical extends Rectangle {
  public float speed;

  public Physical(float x, float y, float w, float h, float speed) {
    super(x, y, w, h);
    this.speed = speed;
  }

  public void update() {
    x += speed;
    if (speed > 0 && x > width) x = -w;
    else if (speed < 0 && x < -w) x = width + w;
  }

  public void show() {
    fill(25, 10, 40);
    rect(x, y, w, h);
  }
}
