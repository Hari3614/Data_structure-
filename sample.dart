class Node {
  late int value;
  Node? next;
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
      head = node;
    }
    size++;
  }

  insert(index, value) {
    if (index < 0 || index > size) {
      print('invalide');
      return;
    }
    Node newNode = Node(value);
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

  remove(index) {
    if (index == 0) {
      if (size == 1) {
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
      if (index == size - 1) {
        tail = curr;
      }
    }
    size--;
  }

  sum() {
    int sum = 0;
    var curr = head;
    while (curr != null) {
      sum += curr.value;
      curr = curr.next;
    }
    return sum;
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

  list.appande(44);
  list.appande(33);
  list.preppend(55);
  list.insert(1, 22);
  // list.reverse();
  // list.remove(0);

  print(list.sum());
  list.printList();
}
