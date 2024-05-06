fibonacci(n) {
  List<int> fib = [0, 1];

  for (int i = 2; i < n; i++) {
    fib.add(fib[i - 1] + fib[i - 2]);
  }

  return fib;
}

void main() {
  print(fibonacci(2));
  print(fibonacci(3));
  print(fibonacci(7));
}
