class Queue {
  List<dynamic> items = [];

  isEmpty() {
    return items.isEmpty;
  }

  equeque(value) {
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
  var que = Queue();

  que.equeque(99);
  que.equeque(99);
  que.equeque(99);
  que.equeque(99);

  que.dequeue();

  que.display();
}
