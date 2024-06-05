import 'package:app_web/domain/models/categorie_entity_model.dart';
import 'package:app_web/domain/repositories/category_repository.dart';
import 'package:app_web/ui/pages/questions/cubit/questions_cubit.dart';
import 'package:app_web/ui/pages/questions/widgets/questions_finish_section.dart';
import 'package:app_web/ui/pages/questions/widgets/questions_information_user.dart';
import 'package:app_web/ui/pages/questions/widgets/questions_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({
    super.key,
    required this.categories,
  });

  final List<CategoryEntityModel> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => QuestionsCubit(
          RepositoryProvider.of<CategoryRepository>(context),
        ),
        child: _Content(
          categories: categories,
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({
    required this.categories,
  });

  final List<CategoryEntityModel> categories;

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  PageController pageController = PageController();

  void changeSection(QuestionBody section) {
    pageController.animateToPage(
      section.index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionsCubit, QuestionsState>(
      listenWhen: (p, c) => p.section != c.section,
      listener: (context, state) {
        changeSection(state.section);
      },
      child: PageView.builder(
        itemCount: QuestionBody.values.length,
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          switch (QuestionBody.values[index]) {
            case QuestionBody.informationUser:
              return QuestionInformationUser(
                categories: widget.categories,
              );

            case QuestionBody.questions:
              return const QuestionsListSection();

            case QuestionBody.finish:
              return const QuestionsFinishSection();
          }
        },
      ),
    );
  }
}
