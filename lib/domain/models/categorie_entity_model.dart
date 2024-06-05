import 'package:app_web/data/response/category_entity_response.dart';
import 'package:app_web/domain/models/question_entity_model.dart';

class CategoryEntityModel {
  final String id;
  final String name;
  final List<QuestionEntityModel> questions;

  CategoryEntityModel({
    required this.id,
    required this.name,
    required this.questions,
  });

  factory CategoryEntityModel.fromMap(CategoryEntityResponse response) {
    return CategoryEntityModel(
      id: response.id,
      name: response.name,
      questions: response.questions
          .map((e) => QuestionEntityModel.fromMap(e))
          .toList(),
    );
  }
}
