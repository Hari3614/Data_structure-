class Queue {
  List<dynamic> items = [];

  isEmpty() {
    return items.isEmpty;
  }

  enqueue(dynamic value) {
    items.add(value);
  }

  dequeue() {
    if (isEmpty()) {
      return null;
    }
    return items.removeAt(0);
  }

  display() {
    print(items);
  }
}

void main() {
  var queue = Queue();
  queue.enqueue(12);
  queue.enqueue(13);
  queue.enqueue(14);
  queue.enqueue(15);
  queue.display();
  queue.dequeue();
  queue.display();
}
