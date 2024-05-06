class Node {
  late int value;
  Node? next;
  Node(this.value);
}

class linkedList {
  Node? head;
  Node? tail;
  int size = 0;

  appand(value) {
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
    size++;
  }

  insert(index, value) {
    if (index < 0 || index > size) {
      print('invalid');
      return;
    }
    Node? newNode = Node(value);
    if (index == 0) {
      newNode.next = head;
      head = newNode;
      if (tail == null) tail = newNode;
    } else {
      Node? curr = head;
      for (int i = 0; i < index - 1; i++) curr = curr?.next;
      newNode.next = curr!.next;
      curr.next = newNode;
      if (index == size) tail = newNode;
    }
    size++;
  }

  reverse() {
    var curr = head;
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

  // removeAt(int index) {
  //   if (index == 0) {
  //     if (this.size == 1) {
  //       this.head = null;
  //       this.tail = null;
  //     } else {
  //       this.head = this.head?.next;
  //     }
  //   } else {
  //     Node? removeNode;
  //     var curr = this.head;
  //     for (int i = 0; i < index - 1; i++) {
  //       curr = curr!.next;
  //     }

  //     removeNode = curr!.next;
  //     curr.next = removeNode!.next;
  //     if (index == this.size - 1) {
  //       this.tail = curr;
  //     }
  //   }
  //   this.size--;
  // }

  removeAt(int index) {
    if (index == 0) {
      if (this.size == 1) {
        this.head = null;
        this.tail = null;
      } else {
        this.head = this.head?.next;
      }
    } else {
      Node? removeNode;
      var curr = this.head;
      for (int i = 0; i < index - 1; i++) {
        curr = curr!.next;
      }
      removeNode = curr!.next;
      curr.next = removeNode!.next;
      if (index == this.size - 1) {
        this.tail = curr;
      }
    }
    this.size--;
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
  list.appand(30);
  list.preppend(55);

  list.insert(0, 99);

  //list.reverse();

  list.printList();
}
