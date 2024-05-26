insertionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int temp = arr[i];
    int j = i - 1;

    while (j >= 0 && arr[j] > temp) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = temp;
  }
  return arr;
}

void main() {
  print(insertionSort([0, 99, 5, 4, 8, 10]));
}
