class WarmUpModel{
  final int jawaban;
  final List<dynamic> opsi;

  WarmUpModel({
    required this.jawaban,
    required this.opsi,
  });

  factory WarmUpModel.fromMap(Map<String, dynamic> map) {
    return WarmUpModel(
      jawaban: map['jawaban'],
      opsi: map['opsi'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jawaban': jawaban,
      'opsi': opsi,
    };
  }
}