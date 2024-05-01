class Node {
  late int value;
  Node? next;
  Node(this.value);
}

class Linkedlist {
  Node? head;
  Node? tail;
  int size = 0;

  append(value) {
    final node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      tail?.next = node;
      tail = node;
    }
    size++;
  }

  insert(index, value) {
    if (index < 0 || index > size) {
      print("invalid");
      return;
    }
    Node newNode = Node(value);
    if (index == 0) {
      newNode.next = head;
      head = newNode;
      if (tail == null) tail = newNode;
    } else {
      Node? currunt = head;
      for (int i = 0; i < index - 1; i++) currunt = currunt?.next;
      newNode.next = currunt!.next;
      currunt.next = newNode;

      if (index == size) tail = newNode;
    }
    size++;
  }

  printList() {
    var current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}

void main() {
  final list = Linkedlist();

  list.append(10);
  list.append(10);

  list.insert(0, 99);

  list.printList();
}
