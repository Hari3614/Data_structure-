mergeSort(List<int> arr) {
  if (arr.length < 2) {
    return arr;
  }

  int mid = (arr.length / 2).floor();
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);

  return merge(mergeSort(left), mergeSort(right));
}

merge(List<int> left, List<int> right) {
  List<int> sortedArray = [];

  while (left.isNotEmpty && right.isNotEmpty) {
    if (left.first <= right.first) {
      sortedArray.add(left.removeAt(0));
    } else {
      sortedArray.add(right.removeAt(0));
    }
  }

  return [...sortedArray, ...left, ...right];
}

void main() {
  print(mergeSort([4, 3, 2, 1]));
}
