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

  appande(value) {
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

  preppende(value) {
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

  // remove(index) {
  //   if (index < 0 || index > size) {
  //     print('invalide');
  //     return;
  //   }

  //   if (index == 0) {
  //     if (size == 1) {
  //       head = null;
  //       tail = null;
  //     } else {
  //       head = head?.next;
  //       head!.prev = null;
  //     }
  //   } else if (index == size - 1) {
  //     tail = tail!.prev;
  //     tail!.next = null;
  //   } else {
  //     Node? curr = head;
  //     for (int i = 0; i < index; i++) {
  //       curr = curr!.next;
  //     }
  //     curr!.prev!.next = curr.next;
  //     curr.next!.prev = curr.prev;
  //   }
  //   size--;
  // }

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

  reverse() {
    var curr = head;
    Node? temp;
    while (curr != null) {
      temp = curr.prev;
      curr.prev = curr.next;
      curr.next = temp;
    }
    if (tail != null) {
      head = temp!.prev;
    }
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

  list.appande(10);
  list.preppende(99);
  // list.remove(0);

  list.printList();
}
