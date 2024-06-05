import 'package:app_web/data/response/question_entity_response.dart';

class CategoryEntityResponse {
  final String id;
  final String name;
  final List<QuestionEntityResponse> questions;

  CategoryEntityResponse({
    required this.id,
    required this.name,
    required this.questions,
  });

  factory CategoryEntityResponse.fromMap(Map<String, dynamic> map) {
    return CategoryEntityResponse(
      id: map['_id'],
      name: map['name'] ?? '',
      questions: List<QuestionEntityResponse>.from(
          map['questions']?.map((x) => QuestionEntityResponse.fromMap(x))),
    );
  }
}
