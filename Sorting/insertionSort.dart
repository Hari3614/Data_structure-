insertionSort(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    int temp = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > temp) {
      arr[j + 1] = arr[i];
      j = j - 1;
    }
    arr[j + 1] = temp;
  }
  return arr;
}

void main() {
  print(insertionSort([10, -5, 6, 9, 2]));
}
