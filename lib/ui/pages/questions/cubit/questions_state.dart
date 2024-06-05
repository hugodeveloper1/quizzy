part of 'questions_cubit.dart';

enum StatusPage {
  initial,
  complete,
  error,
  loading,
}

enum QuestionBody {
  informationUser,
  questions,
  finish,
}

class QuestionsState extends Equatable {
  const QuestionsState({
    this.statusInformation = StatusPage.initial,
    this.selectedCategory,
    this.name = '',
    this.section = QuestionBody.informationUser,
    this.count = 0,
    this.totalQuestions = 0,
  });

  final QuestionBody section;

  final StatusPage statusInformation;
  final CategoryEntityModel? selectedCategory;

  // Information del usuario
  final String name;
  final int count;
  final int totalQuestions;

  @override
  List<Object?> get props => [
        statusInformation,
        selectedCategory,

        //
        name,

        //
        section,
        count,
        totalQuestions,
      ];

  QuestionsState copyWith({
    QuestionBody? section,
    StatusPage? statusInformation,
    CategoryEntityModel? selectedCategory,
    String? name,
    int? count,
    int? totalQuestions,
  }) {
    return QuestionsState(
      section: section ?? this.section,
      statusInformation: statusInformation ?? this.statusInformation,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      name: name ?? this.name,
      count: count ?? this.count,
      totalQuestions: totalQuestions ?? this.totalQuestions,
    );
  }
}
