import 'package:app_web/ui/pages/questions/cubit/questions_cubit.dart';
import 'package:app_web/ui/pages/questions/widgets/questions/item_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsListWidget extends StatefulWidget {
  const QuestionsListWidget({
    super.key,
    required this.paddingBlocLeft,
  });

  final double paddingBlocLeft;

  @override
  State<QuestionsListWidget> createState() => _QuestionsListWidgetState();
}

class _QuestionsListWidgetState extends State<QuestionsListWidget> {
  PageController pageController = PageController(initialPage: 0);

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(_listener);
  }

  void _listener() {
    currentPage = (pageController.page ?? 0).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionsCubit>();

    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        return PageView.builder(
          itemCount: (state.selectedCategory?.questions ?? []).length,
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          itemBuilder: (context, index) {
            return Center(
              child: ItemQuestion(
                paddingBlocLeft: widget.paddingBlocLeft,
                questions: state.selectedCategory?.questions[index],
                totalQuestions:
                    (state.selectedCategory?.questions ?? []).length,
                isFinish: currentPage ==
                    ((state.selectedCategory?.questions ?? []).length - 1),
                indexQuestion: currentPage + 1,
                onFinish: () {
                  cubit.changeSection(QuestionBody.finish);
                },
                next: (currentPage ==
                        ((state.selectedCategory?.questions ?? []).length - 1))
                    ? null
                    : () {
                        pageController.animateToPage(
                          currentPage + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate,
                        );
                      },
                selectedAnswer: (bool isSelected) {
                  cubit.addResponse(isSelected);
                },
              ),
            );
          },
        );
      },
    );
  }
}
