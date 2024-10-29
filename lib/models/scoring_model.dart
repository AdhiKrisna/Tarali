class ScoringModel{
  final String uId;
  final String nama;
  final String contentId;
  final String title;
  final int absen;
  final String kelas;
  final String cover;
  final double quizScore;
  final double readTestScore;
  final String readTestSource;
  final String readTestMessage;
  final String sekolah;

  ScoringModel({
    required this.uId,
    required this.nama,
    required this.contentId,
    required this.title,
    required this.kelas,
    required this.absen,
    required this.cover,
    required this.quizScore,
    required this.readTestScore,
    required this.readTestSource,
    required this.readTestMessage,
    required this.sekolah,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'nama': nama,
      'contentId': contentId,
      'title': title,
      'kelas': kelas,
      'absen': absen,
      'cover': cover,
      'quizScore': quizScore,
      'readTestScore': readTestScore,
      'readTestSource': readTestSource,
      'readTestMessage': readTestMessage,
      'sekolah': sekolah,
    };
  }
}