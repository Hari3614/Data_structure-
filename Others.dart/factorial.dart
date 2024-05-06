factorial(n) {
  int result = 1;
  for (int i = 2; i <= n; i++) {
    result = result * i;
  }
  return result;
}

void main() {
  print(factorial(2));
  print(factorial(3));
  print(factorial(4));
}
