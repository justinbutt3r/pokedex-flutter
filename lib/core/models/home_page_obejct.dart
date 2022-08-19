class HomePageObject {
  HomePageObject({required this.title, required this.children});

  final String title;
  final List<ChildLinkObject> children;
}

class ChildLinkObject {
  ChildLinkObject({required this.label, required this.path});

  final String label;
  final String path;
}
