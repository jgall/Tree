class Node {
  int value;
  Node child1, child2;

  Node(int _value) {
    value = _value;
    println(value);
    if (value>2) {
      child1= new Node(2);
      child2= new Node(value/2);
    }
  }
}

