// class Node {
//   late int value;
//   Node? next;

//   Node(int value) {
//     this.value = value;
//     next = null;
//   }
// }

// class LinkedList {
//   Node? head;
//   Node? tail;
//   late int size;

//   LinkedList() {
//     head = null;
//     tail = null;
//     size = 0;
//   }

//   bool isEmpty() {
//     return size == 0;
//   }

//   void append(int value) {
//     Node node = Node(value);
//     if (isEmpty()) {
//       head = node;
//       tail = node;
//     } else {
//       tail?.next = node;
//       tail = node;
//     }
//     size++;
//   }

//   // void printList() {
//   //   Node? current = head;
//   //   while (current != null) {
//   //     print(current.value);
//   //     current = current.next;
//   //   }
//   // }
//   void printList() {
//     List<int> listArray = []; // Initialize an empty list to store values
//     Node? current = head;

//     while (current != null) {
//       listArray
//           .add(current.value); // Add the value of the current node to the list
//       current = current.next; // Move to the next node
//     }

//     print(
//         listArray); // Print the array containing the values of the linked list
//   }
// }

// void main() {
//   LinkedList list = LinkedList();
//   list.append(10);
//   list.append(20);

//   list.printList();
// }

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

  list.reverse();
  list.printList();
}
