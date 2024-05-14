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

  appende(value) {
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

  preppend(value) {
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

  remove(index) {
    if (index < 0 || index > size) {
      print('invalide');
      return;
    }
    if (index == 0) {
      if (size == 1) {
        head = null;
        tail = null;
      } else {
        head = head!.next;
        head!.prev = null;
      }
    } else if (index == size - 1) {
      tail = tail!.prev;
      tail!.next = null;
    } else {
      Node? curr = head;
      for (int i = 0; i < index; i++) {
        curr = curr!.next;
      }
      curr!.prev!.next = curr.next;
      curr.next!.prev = curr.prev;
    }
    size--;
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

  list.appende(25);
  list.preppend(33);

  list.remove(0);
  list.printList();
}
