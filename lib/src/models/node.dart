class Node {
  final String title;
  String? subtitle;
  List<NodeItem>? items;

  Node({
    required this.title,
    this.subtitle,
    this.items,
  });
}

class NodeItem {
  final String title;
  final String subtitle;

  NodeItem({
    required this.title,
    required this.subtitle,
  });
}
