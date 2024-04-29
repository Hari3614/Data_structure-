recursiveFactorial(n) {
  if (n == 0) {
    return 1;
  }
  return n * recursiveFactorial(n - 1);
}

void main() {
  print(recursiveFactorial(0));
  print(recursiveFactorial(2));
  print(recursiveFactorial(5));
}
