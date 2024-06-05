import 'package:app_web/data/response/answer_entity_response.dart';

class QuestionEntityResponse {
  final String id;
  final String question;
  final String answerId;
  final List<AnswerEntityResponse> answers;
  QuestionEntityResponse({
    required this.id,
    required this.question,
    required this.answerId,
    required this.answers,
  });

  factory QuestionEntityResponse.fromMap(Map<String, dynamic> map) {
    return QuestionEntityResponse(
      id: map['_id'] ?? '',
      question: map['question'] ?? '',
      answerId: map['answer_id'] ?? '',
      answers: List<AnswerEntityResponse>.from(
          map['answers']?.map((x) => AnswerEntityResponse.fromMap(x))),
    );
  }
}
