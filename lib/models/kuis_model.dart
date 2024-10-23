class KuisModel{
  final int noSoal;
  final String soal;
  final int jawaban;
  final List<dynamic> opsi;

  KuisModel({
    required this.noSoal,
    required this.soal,
    required this.jawaban,
    required this.opsi,
  });

  factory KuisModel.fromMap(Map<String, dynamic> map) {
    return KuisModel(
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

}