//tree test stuff
float windowX = 800, windowY = 800, maxMass = 100;
void setup() {
  size(int(windowX), int(windowY));
  testProgram();
}

void testProgram() {
  ArrayList<Point> testList = makePoints(1000);
  drawPoints(testList);
  QuadTreeNode quadTreeTest = new QuadTreeNode(testList, 0.0, windowX, 0.0, windowY);
}

ArrayList<Point> makePoints(int num) {
  ArrayList<Point> tempList = new ArrayList(num);
  for (int i = 0; i < num; i++) {
    Point temp = new Point(random(windowX), random(windowY), random(maxMass));
    tempList.add(temp);
  }
  return tempList;
}

void drawPoints(ArrayList<Point> pointList) {
  smooth(8);
  fill(240);
  rect(0, 0, windowX, windowY);
  noStroke();
  fill(0);
  for (Point temp : pointList) {
    ellipse(temp.getX(), temp.getY(), 2, 2);
    stroke(0);
    line(windowX, 0, windowY, windowY);
    line(0, windowX, windowY, windowY);
  }
}

void draw() {

}

