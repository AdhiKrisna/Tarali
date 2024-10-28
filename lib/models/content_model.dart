import 'package:tarali/models/warm_up_model.dart';

import 'kuis_model.dart';

class ContentModel{
  final String id;
  final String title;
  final String pathStorage;
  final String coverDashboard;
  final String cover;
  final int pageTotal;
  final String ayoBercerita;
  final List<KuisModel> kuis;
  final WarmUpModel pemanasan;

  ContentModel({
    required this.id,
    required this.title,
    required this.pathStorage,
    required this.coverDashboard,
    required this.cover,
    required this.pageTotal,
    required this.ayoBercerita,
    required this.kuis,
    required this.pemanasan,
  });

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
      id: map['id'],
      title: map['title'],
      pathStorage: map['pathStorage'],
      coverDashboard: map['cover_dashboard'],
      cover: map['cover'],
      pageTotal: map['pageTotal'],
      ayoBercerita: map['ayoBercerita'],
      kuis: map['kuis'],
      pemanasan: map['pemanasan']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'pathStorage': pathStorage,
      'coverDashboard': coverDashboard,
      'cover': cover,
      'pageTotal': pageTotal,
      'ayoBercerita': ayoBercerita,
      'kuis': kuis,
      'pemanasan': pemanasan,
    };
  }
}