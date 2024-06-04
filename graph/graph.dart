class Graph {
  Map<String, List<String>> adjacencyList = {};

  bool addVertex(String vertex) {
    if (!adjacencyList.containsKey(vertex)) {
      adjacencyList[vertex] = [];
      return true;
    }
    return false;
  }

  bool addEdge(String vertex1, String vertex2) {
    if (adjacencyList.containsKey(vertex1) &&
        adjacencyList.containsKey(vertex2)) {
      adjacencyList[vertex1]!.add(vertex2);
      adjacencyList[vertex2]!.add(vertex1);
      return true;
    }
    return false;
  }

  bool removeEdge(String vertex1, String vertex2) {
    if (adjacencyList.containsKey(vertex1) &&
        adjacencyList.containsKey(vertex2)) {
      adjacencyList[vertex1] =
          adjacencyList[vertex1]!.where((v) => v != vertex2).toList();
      adjacencyList[vertex2] =
          adjacencyList[vertex2]!.where((v) => v != vertex1).toList();
      return true;
    }
    return false;
  }

  Graph? removeVertex(String vertex) {
    if (!adjacencyList.containsKey(vertex)) {
      return null;
    }

    while (adjacencyList[vertex]!.isNotEmpty) {
      String temp = adjacencyList[vertex]!.removeLast();
      removeEdge(vertex, temp);
    }

    adjacencyList.remove(vertex);
    return this;
  }

  List<String> bfs(String startVertex) {
    Map<String, bool> visited = {};
    List<String> queue = [startVertex];
    List<String> result = [];

    visited[startVertex] = true;

    while (queue.isNotEmpty) {
      String currentVertex = queue.removeAt(0);
      result.add(currentVertex);

      adjacencyList[currentVertex]!.forEach((neighbor) {
        if (!visited.containsKey(neighbor)) {
          visited[neighbor] = true;
          queue.add(neighbor);
        }
      });
    }

    return result;
  }

  List<String> dfs(String startVertex) {
    Map<String, bool> visited = {};
    List<String> result = [];

    void dfsRecursive(String vertex) {
      visited[vertex] = true;
      result.add(vertex);

      adjacencyList[vertex]!.forEach((neighbor) {
        if (!visited.containsKey(neighbor)) {
          dfsRecursive(neighbor);
        }
      });
    }

    dfsRecursive(startVertex);
    return result;
  }

  bool hasCycle() {
    Map<String, bool> visited = {};

    for (String vertex in adjacencyList.keys) {
      if (!visited.containsKey(vertex)) {
        if (hasCycleDfs(vertex, null, visited)) {
          return true;
        }
      }
    }

    return false;
  }

  bool hasCycleDfs(String vertex, String? parent, Map<String, bool> visited) {
    visited[vertex] = true;

    for (String neighbor in adjacencyList[vertex]!) {
      if (!visited.containsKey(neighbor)) {
        if (hasCycleDfs(neighbor, vertex, visited)) {
          return true;
        }
      } else if (neighbor != parent) {
        return true;
      }
    }

    return false;
  }

  bool hasPath(String startVertex, String targetVertex) {
    Map<String, bool> visited = {};
    return hasPathDfs(startVertex, targetVertex, visited);
  }

  bool hasPathDfs(
      String currentVertex, String targetVertex, Map<String, bool> visited) {
    visited[currentVertex] = true;

    for (String neighbor in adjacencyList[currentVertex]!) {
      if (!visited.containsKey(neighbor)) {
        if (hasPathDfs(neighbor, targetVertex, visited)) {
          return true;
        }
      } else if (neighbor == targetVertex) {
        return true;
      }
    }

    return false;
  }
}

void main() {
  Graph myGraph = Graph();
  myGraph.addVertex("A");
  myGraph.addVertex("B");
  myGraph.addVertex("C");
  myGraph.addVertex("D");
  myGraph.addEdge("A", "B");
  myGraph.addEdge("A", "C");
  myGraph.addEdge("A", "D");
  myGraph.addEdge("B", "D");
  myGraph.addEdge("C", "D");

  print(myGraph);

  print("BFS Traversal: ${myGraph.bfs("A")}");

  print("DFS Traversal: ${myGraph.dfs("A")}");
}
