selection(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int min = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[min]) {
        min = j;
      }
    }
    // Swap elements
    int temp = arr[i];
    arr[i] = arr[min];
    arr[min] = temp;
  }
  return arr;
}

void main() {
  print(selection([2, 7, 5, 4, 2, 1])); // Output: [1, 2, 2, 4, 5, 7]
}
