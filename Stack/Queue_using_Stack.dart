class Queue {
  List<dynamic> stack = [];

  void enqueue(dynamic value) {
    List<dynamic> tempstack = [];
    while (stack.isNotEmpty) {
      tempstack.add(stack.removeLast());
    }
    stack.add(value);
    while (tempstack.isNotEmpty) {
      stack.add(tempstack.removeLast());
    }
  }

  dynamic dequeue() {
    if (stack.isEmpty) {
      return null;
    }
    return stack.removeLast();
  }
}

void main() {
  Queue myQueue = Queue();
  myQueue.enqueue(1);
  myQueue.enqueue(2);
  myQueue.enqueue(3);
  print(myQueue.dequeue()); // Output: 1
  myQueue.enqueue(4);
  print(myQueue.dequeue()); // Output: 2
  print(myQueue.dequeue()); // Output: 3
}
