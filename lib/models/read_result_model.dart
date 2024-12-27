class ReadResultModel{
  final String url;
  final String note;
  final double score;

  ReadResultModel({
    required this.url,
    required this.note,
    required this.score,
  });

  factory ReadResultModel.fromMap(Map<String, dynamic> map) {
    return ReadResultModel(
      url: map['url'],
      note: map['note'],
      score: map['score'],
    );
  }
}