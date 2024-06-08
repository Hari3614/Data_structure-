class Node {
  Map<String, Node> children = {};
  bool isEnd = false;
}

class Trie {
  Node root = Node();

  void insert(String word) {
    Node current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        current.children[char] = Node();
      }
      current = current.children[char]!;
    }
    current.isEnd = true;
  }

  bool search(String word) {
    Node current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        return false;
      }
      current = current.children[char]!;
    }
    return current.isEnd;
  }

  List<String> prefixSearch(String prefix) {
    Node current = root;
    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];
      if (!current.children.containsKey(char)) {
        return [];
      }
      current = current.children[char]!;
    }

    List<String> words = [];

    void dfs(Node node, String currentWord) {
      if (node.isEnd) {
        words.add(currentWord);
      }
      node.children.forEach((char, childNode) {
        dfs(childNode, currentWord + char);
      });
    }

    dfs(current, prefix);
    return words;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("apple");
  trie.insert("ant");
  trie.insert("apricot");
  trie.insert("banana");

  print(trie.search("apple")); // true
  print(trie.search("ant")); // true
  print(trie.search("apricot")); // true
  print(trie.search("banana")); // true
  print(trie.prefixSearch("a")); // ["apple", "ant", "apricot"]
  print(trie.prefixSearch("ban")); // ["banana"]
}
