class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value, [this.left, this.right]);

  List<int> inOrder(TreeNode? root, [List<int>? arr]) {
    arr ??= [];
    if (root != null) {
      inOrder(root.left, arr);
      arr.add(root.value);
      inOrder(root.right, arr);
    }
    return arr;
  }

  bool isBST(TreeNode? root, [int? min, int? max]) {
    if (root == null) {
      return true;
    }
    if ((min != null && root.value <= min) ||
        (max != null && root.value >= max)) {
      return false;
    }
    return isBST(root.left, min, root.value) &&
        isBST(root.right, root.value, max);
  }

  int getHeight(TreeNode? root) {
    if (root == null) {
      return 0;
    }
    int leftHeight = getHeight(root.left);
    int rightHeight = getHeight(root.right);
    return (leftHeight > rightHeight ? leftHeight : rightHeight) + 1;
  }
}

void main() {
  TreeNode root = TreeNode(10);
  root.left = TreeNode(5);
  root.right = TreeNode(15);
  root.left!.left = TreeNode(3);
  root.left!.right = TreeNode(12);
  root.right!.right = TreeNode(18);

  print(root.inOrder(root));
  print(root.isBST(root));
  print(root.getHeight(root));
}
