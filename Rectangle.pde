public class Rectangle {
  public float x,y,w,h;

  public Rectangle(float x, float y, float w, float h) {
    this.x = x;
    this.w = w;
    this.y = y;
    this.h = h;
  }

  boolean intersects(Rectangle other) {
    float left = x;
    float right = x + w;
    float top = y;
    float bottom = y + h;

    float otherLeft = other.x;
    float otherRight = other.x + other.w;
    float otherTop = other.y;
    float otherBottom = other.y + other.h;

    return left < otherRight && right > otherLeft && top < otherBottom && bottom > otherTop;
  }
}
