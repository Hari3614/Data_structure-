class Node {
  late int value;
  Node? prev;
  Node? next;

  Node(this.value);
}

class DoublyLinkedList {
  Node? head;
  Node? tail;
  int size = 0;

  append(int value) {
    final node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      tail?.next = node;
      node.prev = tail;
      tail = node;
    }
    size++;
  }

  preppend(int value) {
    final node = Node(value);
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

  insert(int index, int value) {
    if (index < 0 || index > size) {
      print('Invalid index');
      return;
    }

    Node newNode = Node(value);
    if (index == 0) {
      newNode.next = head;
      if (head != null) head!.prev = newNode;
      head = newNode;
      if (tail == null) tail = newNode;
    } else {
      Node? current = head;
      for (int i = 0; i < index - 1; i++) current = current?.next;
      newNode.next = current!.next;
      if (current.next != null) current.next!.prev = newNode;
      current.next = newNode;
      if (index == size) tail = newNode;
    }
    size++;
  }

  reverse() {
    var curr = head;
    Node? temp;

    while (curr != null) {
      temp = curr.prev;
      curr.prev = curr.next;
      curr.next = temp;
      curr = curr.prev;
    }

    if (temp != null) {
      head = temp.prev;
    }
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
  final list = DoublyLinkedList();
  list.append(10);
  list.append(20);
  list.append(30);
  list.append(40);
  list.append(50);
  list.preppend(11);
  list.insert(2, 99);

  list.reverse();
  list.printList();
}
