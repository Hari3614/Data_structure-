int countDuplicates(String input) {
  Map<String, int> charFrequency = {};

  String lowercaseInput = input.toLowerCase();

  for (int i = 0; i < lowercaseInput.length; i++) {
    String currentChar = lowercaseInput[i];

    if (currentChar.isNotEmpty &&
        currentChar.toLowerCase() != currentChar.toUpperCase()) {
      charFrequency[currentChar] = (charFrequency[currentChar] ?? 0) + 1;
    }
  }
  int duplicatesCount = charFrequency.values.where((count) => count > 1).length;

  return duplicatesCount;
}

void main() {
  String input = "Hello, World!";
  int duplicates = countDuplicates(input);
  print("Number of duplicates in the string: $duplicates");
}
