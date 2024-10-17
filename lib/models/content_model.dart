class ContentModel{
  final String title;
  final String pathStorage;

  ContentModel({
    required this.title,
    required this.pathStorage,
  });

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
      title: map['title'],
      pathStorage: map['pathStorage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'pathStorage': pathStorage,
    };
  }
}