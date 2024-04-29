recursiveFibonacci(n) {
  if (n < 2) {
    return n;
  }
  return recursiveFibonacci(n - 1) + recursiveFibonacci(n - 2);
}

void main() {
  print(recursiveFibonacci(0));
  print(recursiveFibonacci(2));
  print(recursiveFibonacci(6));
}
