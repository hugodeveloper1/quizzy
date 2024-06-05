import 'package:app_web/data/response/answer_entity_response.dart';

class AnswerEntityModel {
  final String id;
  final String answer;
  final bool isAnswer;

  AnswerEntityModel({
    required this.id,
    required this.answer,
    required this.isAnswer,
  });

  factory AnswerEntityModel.fromMap(AnswerEntityResponse response) {
    return AnswerEntityModel(
      id: response.id,
      answer: response.answer,
      isAnswer: response.isAnswer,
    );
  }
}
