class Stack {
  List<dynamic> items = [];

  push(dynamic value) {
    items.add(value);
  }

  dynamic pop() {
    if (isEmpty()) {
      return null;
    }
    return items.removeLast();
  }

  dynamic peek() {
    if (isEmpty()) {
      return null;
    }
    return items.last;
  }

  bool isEmpty() {
    return items.isEmpty;
  }

  void display() {
    print(items);
  }
}

void main() {
  Stack myStack = Stack();
  myStack.push(12);
  myStack.push(103);
  myStack.push(1004);
  myStack.push(10005);
  myStack.push(100006);
  myStack.display();
  myStack.pop();
  myStack.display();
}
