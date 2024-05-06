class Node {
  late int value;
  Node? next;

  Node(this.value);
}

class LinkedList {
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
      tail = node;
    }
    size++;
  }

  preppend(int Value) {
    final node = Node(Value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      node.next = head;
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
      for (var i = 0; i < index - 1; i++) {
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

  int sumOf() {
    int sum = 0;
    var curr = this.head;
    while (curr != null) {
      sum += curr.value;
      curr = curr.next;
    }
    return sum;
  }

  removeVal(value) {
    var prev = this.head;
    if (value == this.head?.value) {
      this.head = this.head?.next;
      this.size--;
      return;
    } else {
      var removeNode;
      while (prev?.next != null && prev!.next!.value != value) {
        prev = prev.next;
      }
      removeNode = prev?.next;
      prev?.next = removeNode.next;
      this.size--;
      return;
    }
  }

  merge(LinkedList list2) {
    if (head == null) {
      return list2;
    }
    tail!.next = list2.head;
    tail = list2.tail;
    size += list2.size;
    list2.head = list2.tail = null;
    list2.size = 0;
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
  final list = LinkedList();
  list.append(10);
  list.append(20);
  list.append(30);
  list.append(40);
  list.append(50);
  list.preppend(11);
  list.insert(2, 99);

  list.removeAt(0);
  //print(list.sumOf());

  //list.reverse();
  list.printList();

  final list2 = LinkedList();

  list2.append(200);
  list2.append(200);
  list2.append(200);
  list.merge(list2);

  list.printList();
}
