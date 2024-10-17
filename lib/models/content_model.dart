class ContentModel{
  final String title;
  final String pathStorage;
  final String coverDashboard;
  final String cover;

  ContentModel({
    required this.title,
    required this.pathStorage,
    required this.coverDashboard,
    required this.cover,

  });

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
      title: map['title'],
      pathStorage: map['pathStorage'],
      coverDashboard: map['cover_dashboard'],
      cover: map['cover'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'pathStorage': pathStorage,
      'coverDashboard': coverDashboard,
      'cover': cover,
    };
  }
}