class QuadTreeNode {
  ArrayList<Point> pointList, c1List = new ArrayList(0), c2List = new ArrayList(0), c3List = new ArrayList(0), c4List = new ArrayList(0);
  float x1, x2, y1, y2, centroidPoint, centroidMass;
  Point centroid;
  QuadTreeNode c1, c2, c3, c4;

  QuadTreeNode(ArrayList<Point> points, float _x1, float _x2, float _y1, float _y2) {
    pointList = points;
    x1 = _x1;
    x2 = _x2;
    y1 = _y1;
    y2 = _y2;

    makeChildren();
    findCentroid();
  }

  void makeChildren() {
    if (pointList.size() > 1) {
      for (Point temp : pointList) {
        if (temp.getX() < (x1+x2)/2 && temp.getY() < (y1+y2)/2) {
          c1List.add(temp);
        } else if (temp.getX() > (x1+x2)/2 && temp.getY() < (y1+y2)/2) {
          c2List.add(temp);
        } else if (temp.getX() > (x1+x2)/2 && temp.getY() > (y1+y2)/2) {
          c3List.add(temp);
        } else if (temp.getX() < (x1+x2)/2 && temp.getY() > (y1+y2)/2) {
          c4List.add(temp);
        }
      }
      c1 = new QuadTreeNode(c1List, x1, (x1+x2)/2, y1, (y1+y2)/2);
      c2 = new QuadTreeNode(c2List, (x1+x2)/2, x2, y1, (y1+y2)/2);
      c3 = new QuadTreeNode(c3List, (x1+x2)/2, x2, (y1+y2)/2, y2);
      c4 = new QuadTreeNode(c4List, x1, (x1+x2)/2, (y1+y2)/2, y2);

      //draws visualization
      line((x1+x2)/2, y1, (x1+x2)/2, y2);
      line(x1, (y1+y2)/2, x2, (y1+y2)/2);
    }
  }

  void findCentroid() {
    if (pointList.size() > 1) {
      float massTotal = 0, pointAvgX = 0, pointAvgY = 0;
      for (Point temp : pointList) {
        massTotal = massTotal + temp.getMass();
      }
      for (Point temp : pointList) {
        pointAvgX = pointAvgX + temp.getX()*temp.getMass()/massTotal;
        pointAvgY = pointAvgY + temp.getY()*temp.getMass()/massTotal;
      }
      centroid = new Point(pointAvgX, pointAvgY, massTotal);
    } else if( pointList.size() == 1) {
      centroid = pointList.get(0);
    } 
  }
}

