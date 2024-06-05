import 'package:app_web/domain/models/categorie_entity_model.dart';
import 'package:app_web/domain/repositories/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit(
    this.categoriesRepository,
  ) : super(const QuestionsState());

  final CategoryRepository categoriesRepository;

  void changeName(String value) {
    emit(state.copyWith(
      name: value,
    ));
  }

  void changeCategory(CategoryEntityModel category) {
    emit(state.copyWith(selectedCategory: category));
  }

  bool verify() {
    if (state.selectedCategory != null && state.name.trim().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void changeSection(QuestionBody section) {
    emit(state.copyWith(
      section: section,
    ));
  }

  void addResponse(bool isSelected) {
    final count = state.count;
    final totalQuestions = state.totalQuestions;

    if (isSelected) {
      emit(state.copyWith(
        count: count + 1,
        totalQuestions: totalQuestions + 1,
      ));
    } else {
      emit(state.copyWith(
        totalQuestions: totalQuestions + 1,
      ));
    }
  }
}
