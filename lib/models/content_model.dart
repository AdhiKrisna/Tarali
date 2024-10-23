import 'kuis_model.dart';

class ContentModel{
  final String title;
  final String pathStorage;
  final String coverDashboard;
  final String cover;
  final int pageTotal;
  final String ayoBercerita;
  final List<KuisModel> kuis;

  ContentModel({
    required this.title,
    required this.pathStorage,
    required this.coverDashboard,
    required this.cover,
    required this.pageTotal,
    required this.ayoBercerita,
    required this.kuis,
  });

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
      title: map['title'],
      pathStorage: map['pathStorage'],
      coverDashboard: map['cover_dashboard'],
      cover: map['cover'],
      pageTotal: map['pageTotal'],
      ayoBercerita: map['ayoBercerita'],
      kuis: map['kuis'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'pathStorage': pathStorage,
      'coverDashboard': coverDashboard,
      'cover': cover,
      'pageTotal': pageTotal,
      'ayoBercerita': ayoBercerita,
      'kuis': kuis,
    };
  }
}