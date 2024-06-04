class Stack {
  List<dynamic> q = [];

  void push(dynamic value) {
    List<dynamic> temp = [];
    while (q.isNotEmpty) {
      temp.add(q.removeAt(0));
    }
    q.add(value);
    while (temp.isNotEmpty) {
      q.add(temp.removeAt(0));
    }
  }

  dynamic pop() {
    if (q.isEmpty) {
      return null;
    }
    return q.removeAt(0);
  }
}

void main() {
  Stack myStack = Stack();
  myStack.push(1);
  myStack.push(2);
  myStack.push(3);
  print(myStack.pop());
  myStack.push(4);
  print(myStack.pop());
  print(myStack.pop());
}
