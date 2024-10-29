class QuizResultModel{
  final List<int> jawaban;
  final double score;
  final int waktuPengerjaan;

  QuizResultModel({
    required this.jawaban,
    required this.score,
    required this.waktuPengerjaan,
  });

  factory QuizResultModel.fromMap(Map<String, dynamic> map) {
    return QuizResultModel(
      jawaban: map['jawaban'],
      score: map['score'],
      waktuPengerjaan: map['waktuPengerjaan'],
    );
  }
}