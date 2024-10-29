import 'package:tarali/models/quiz_result_model.dart';
import 'package:tarali/models/read_result_model.dart';

class ScoringModel{
  final String contentId;
  final List<QuizResultModel> quiz;
  final List<ReadResultModel> read;

  ScoringModel({
    required this.contentId,
    required this.quiz,
    required this.read,
  });

}