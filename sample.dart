import 'dart:collection';

class Node {
  late int value;
  Node? next;
  Node(this.value);
}

class linkedList {
  Node? head;
  Node? tail;
  int size = 0;

  append(value) {
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

  insert(value, index) {
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

  remove(int index) {
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
        tail == curr;
      }
      this.size--;
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

  list.append(20);
  list.append(20);
  list.append(20);
  list.append(20);
  list.preppend(30);
  list.insert(99, 1);
  //list.reverse();

  list.remove(0);

  list.printList();
}
