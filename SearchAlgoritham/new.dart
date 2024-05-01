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

  preppend(value) {
    final node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      node.next = head;
      head = node;
    }
  }

  insert(int index, int value) {
    if (index < 0 || index > size) {
      print('invalid');
      return;
    }
    Node newNode = Node(value);
    if (index == 0) {
      newNode.next = head;
      head = newNode;
      if (tail == null) tail = newNode;
    } else {
      Node? current = head;
      for (int i = 0; i < index - 1; i++) current = current?.next;
      newNode.next = current!.next;
      current.next = newNode;
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
  list.append(33);
  list.append(18);

  list.insert(1, 25);

  list.preppend(99);

  list.printList();
}
