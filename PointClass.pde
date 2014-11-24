class Point {
  float x, y, mass;
  Point(float _x, float _y) {
    x = _x;
    y = _y;
  }
  Point(float _x, float _y, float _mass) {
    x = _x;
    y = _y;
    mass = _mass;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  float getMass() {
    return mass;
  }
}

