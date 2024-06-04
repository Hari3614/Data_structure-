class Node {
  late int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BST {
  Node? root;

  insert(value) {
    Node? node = Node(value);
    if (root == null) {
      root = node;
    } else {
      _insertNode(root, node);
    }
  }

  _insertNode(Node? root, Node node) {
    if (root == null) return;

    if (root.value > node.value) {
      if (root.left == null) {
        root.left = node;
      } else {
        _insertNode(root.left, node);
      }
    } else {
      if (root.right == null) {
        root.right = node;
      } else {
        _insertNode(root.right, node);
      }
    }
  }

  preOrder(Node? root) {
    if (root != null) {
      print(root.value);
      preOrder(root.left);
      preOrder(root.left);
    }
  }

  levelOrder() {
    if (root == null) return;
    List<Node?> queue = [root];

    while (queue.isEmpty) {
      Node? curr = queue.removeAt(0);
      print(curr!.value);

      if (curr.left != null) {
        queue.add(curr.left);
      }

      if (curr.right != null) {
        queue.add(curr.right);
      }
    }
  }

  min(Node? root) {
    if (root == null) return null;

    if (root.left == null) {
      return root.value;
    } else {
      return min(root.left);
    }
  }

  max(Node? root) {
    if (root == null) return null;

    if (root.right == null) {
      return root.value;
    } else {
      max(root.right);
    }
  }
}
