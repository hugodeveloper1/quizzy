class AnswerEntityResponse {
  final String id;
  final String answer;
  final bool isAnswer;

  AnswerEntityResponse({
    required this.id,
    required this.answer,
    required this.isAnswer,
  });

  factory AnswerEntityResponse.fromMap(Map<String, dynamic> map) {
    return AnswerEntityResponse(
      id: map['_id'],
      answer: map['answer'] ?? '',
      isAnswer: map['is_answer'] ?? false,
    );
  }
}
