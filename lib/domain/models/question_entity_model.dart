import 'package:app_web/data/response/question_entity_response.dart';
import 'package:app_web/domain/models/answer_entity_model.dart';

class QuestionEntityModel {
  final String id;
  final String question;
  final List<AnswerEntityModel> answers;
  final String answerId;

  QuestionEntityModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.answerId,
  });

  factory QuestionEntityModel.fromMap(QuestionEntityResponse response) {
    return QuestionEntityModel(
      id: response.id,
      question: response.question,
      answerId: response.answerId,
      answers:
          response.answers.map((x) => AnswerEntityModel.fromMap(x)).toList(),
    );
  }

  QuestionEntityModel copyWith({
    String? id,
    String? question,
    List<AnswerEntityModel>? answers,
    String? answerId,
  }) {
    return QuestionEntityModel(
      id: id ?? this.id,
      question: question ?? this.question,
      answers: answers ?? this.answers,
      answerId: answerId ?? this.answerId,
    );
  }
}
