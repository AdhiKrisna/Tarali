class ScoringModel{
  final String uId;
  final String contentId;
  final String title;
  final int absen;
  final String cover;
  final double quizScore;
  final double readTestScore;
  final String readTestMessage;
  final String sekolah;

  ScoringModel({
    required this.uId,
    required this.contentId,
    required this.title,
    required this.absen,
    required this.cover,
    required this.quizScore,
    required this.readTestScore,
    required this.readTestMessage,
    required this.sekolah,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'contentId': contentId,
      'title': title,
      'absen': absen,
      'cover': cover,
      'quizScore': quizScore,
      'readTestScore': readTestScore,
      'readTestMessage': readTestMessage,
      'sekolah': sekolah,
    };
  }
}