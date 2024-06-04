class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinarySearchTree {
  Node? root;

  bool isEmpty() {
    return root == null;
  }

  void insert(int value) {
    Node node = Node(value);
    if (isEmpty()) {
      root = node;
    } else {
      _insertNode(root, node);
    }
  }

  void _insertNode(Node? root, Node node) {
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

  bool search(Node? root, int value) {
    if (root == null) {
      return false;
    } else {
      if (root.value == value) {
        return true;
      } else if (root.value > value) {
        return search(root.left, value);
      } else {
        return search(root.right, value);
      }
    }
  }

  void preOrder(Node? root) {
    if (root != null) {
      print(root.value);
      preOrder(root.left);
      preOrder(root.right);
    }
  }

  List<int> inOrder(Node? root) {
    if (root == null) {
      return [];
    }
    return [...inOrder(root.left), root.value, ...inOrder(root.right)];
  }

  void postOrder(Node? root) {
    if (root != null) {
      postOrder(root.left);
      postOrder(root.right);
      print(root.value);
    }
  }

  void levelOrder() {
    if (root == null) return;
    List<Node?> queue = [root];

    while (queue.isNotEmpty) {
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

  int? min(Node? root) {
    if (root == null) return null;
    if (root.left == null) {
      return root.value;
    } else {
      return min(root.left);
    }
  }

  int? max(Node? root) {
    if (root == null) return null;
    if (root.right == null) {
      return root.value;
    } else {
      return max(root.right);
    }
  }

  void delete(int value) {
    root = _deleteNode(root, value);
  }

  Node? _deleteNode(Node? root, int value) {
    if (root == null) {
      return root;
    }

    if (root.value > value) {
      root.left = _deleteNode(root.left, value);
    } else if (root.value < value) {
      root.right = _deleteNode(root.right, value);
    } else {
      if (root.left == null && root.right == null) {
        return null;
      }

      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }

      root.value = min(root.right)!;
      root.right = _deleteNode(root.right, root.value);
    }

    return root;
  }

  bool isBST() {
    List<int> inorderTraversal = inOrder(root);
    for (int i = 1; i < inorderTraversal.length; i++) {
      if (inorderTraversal[i] <= inorderTraversal[i - 1]) {
        return false;
      }
    }
    return true;
  }

  int getHeight(Node? root) {
    if (root == null) {
      return 0;
    }
    int leftHeight = getHeight(root.left);
    int rightHeight = getHeight(root.right);
    return (leftHeight > rightHeight ? leftHeight : rightHeight) + 1;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();

  bst.insert(5);
  bst.insert(7);
  bst.insert(10);
  bst.insert(6);
  bst.insert(4);
  bst.insert(3);

  print("Searched Value is ${bst.search(bst.root, 50)}");

  print("Pre Order: ");
  bst.preOrder(bst.root);

  print("In Order: ");
  print(bst.inOrder(bst.root));

  print("Post Order: ");
  bst.postOrder(bst.root);

  print("Level Order: ");
  bst.levelOrder();

  bst.delete(3);

  print("After deleting 3:");
  bst.levelOrder();

  print("Minimum: ${bst.min(bst.root)}");
  print("Maximum: ${bst.max(bst.root)}");

  print(bst.isBST());
  print(bst.getHeight(bst.root));
}
