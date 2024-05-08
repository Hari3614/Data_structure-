class Node {
  late int value;
  Node? next;
  Node? prev;
  Node(this.value);
}

class linkedList {
  Node? head;
  Node? tail;
  int size = 0;

  appand(value) {
    Node? node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      tail!.next = node;
      node.prev = tail;
      tail = node;
    }
    size++;
  }

  preppand(value) {
    Node? node = Node(value);

    if (head == null) {
      head = node;
      tail = node;
    } else {
      node.next = head;
      head!.prev = node;
      head = node;
    }
    size++;
  }

  printList() {
    var curr = head;
    while (curr != null) {
      print(curr.value);
      curr = curr.next;
    }
  }
}

void main() {
  final list = linkedList();

  list.appand(10);

  list.preppand(40);
  list.printList();
}
