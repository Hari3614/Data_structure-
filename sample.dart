class Node {
  late int value;
  Node? next;
  Node(this.value);
}

class Linkedlist {
  Node? head;
  Node? tail;
  int size = 0;

  append(vale) {
    final node = Node(vale);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      tail?.next = node;
      tail = node;
    }
    size++;
  }

  preppend(vale) {
    final node = Node(vale);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      node.next = head;
      head = node;
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
  var list = Linkedlist();

  list.append(10);
  list.append(55);
  list.append(66);
  list.append(13);
  list.append(100);
  list.preppend(99);

  list.printList();
}
