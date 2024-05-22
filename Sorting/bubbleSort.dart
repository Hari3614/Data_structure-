bubbleSort(List<int> arr) {
  var swapped;

  do {
    swapped = false;

    for (int i = 0; i < arr.length - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        int temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;

        swapped = true;
      }
    }
  } while (swapped);
  return arr;
}

void main() {
  print(bubbleSort([8, 20, 2, 4, -6]));
}
