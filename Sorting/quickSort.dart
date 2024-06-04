quick(List<int> arr) {
  if (arr.length < 2) {
    return arr;
  }

  int pivot = arr[arr.length - 1];
  List<int> left = [];
  List<int> right = [];

  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] < pivot) {
      left.add(arr[i]);
    } else {
      right.add(arr[i]);
    }
  }

  return [...quick(left), pivot, ...quick(right)];
}

void main() {
  print(quick([0, 9, 87, 65, 43]));
}
