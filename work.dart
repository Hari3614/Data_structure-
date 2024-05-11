class Node {
  late int value;
  Node? next;
  Node(this.value);
}

class linkeList {
  Node? head;
  Node? tail;
  int size = 0;

  appand(value) {
    final node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      tail!.next = node;
      tail = node;
    }
    size++;
  }

  removeAt(index) {
    if (index == 0) {
      if (this.size == 1) {
        head = null;
        tail = null;
      } else {
        head = head!.next;
      }
    } else {
      Node? removeNode;
      var curr = head;
      for (int i = 0; i < index - 1; i++) {
        curr = curr!.next;
      }
      removeNode = curr!.next;
      curr.next = removeNode!.next;
      if (index == this.size - 1) {
        tail = curr;
      }
    }
    this.size--;
  }

  insert(index, value) {
    if (index < 0 || index > size) {
      print('inavlide');
      return;
    }
    Node? newNode = Node(value);
    if (index == 0) {
      newNode.next = head;
      head = newNode;
      if (tail == null) tail = newNode;
    } else {
      Node? curr = head;
      for (int i = 0; i < index - 1; i++) curr = curr!.next;
      newNode.next = curr!.next;
      curr.next = newNode;
      if (index == size) tail = newNode;
    }
    size++;
  }

  reverse() {
    Node? curr = head;
    var prev = null;
    while (curr != null) {
      var next = curr.next;
      curr.next = prev;
      prev = curr;
      curr = next;
    }
    tail = head;
    head = prev;
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
  final list = linkeList();
  list.appand(30);
  list.appand(30);
  list.appand(30);
  // list.removeAt(2);
  list.insert(1, 99);
  list.reverse();

  list.printList();
}
