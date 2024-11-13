class QuizExamModel{
  final int noSoal;
  final String soal;
  final int jawaban;
  final List<dynamic> opsi;

  QuizExamModel({
    required this.noSoal,
    required this.soal,
    required this.jawaban,
    required this.opsi,
  });

  factory QuizExamModel.fromMap(Map<String, dynamic> map) {
    return QuizExamModel(
      noSoal: map['noSoal'],
      soal: map['soal'],
      jawaban: map['jawaban'],
      opsi: map['opsi'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'noSoal': noSoal,
      'soal': soal,
      'jawaban': jawaban,
      'opsi': opsi,
    };
  }

  String getSoal() {
    return soal;
  }

}