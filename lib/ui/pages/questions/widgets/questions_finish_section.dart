import 'package:app_web/presentation/responsive/responsive_layout.dart';
import 'package:app_web/ui/pages/home/view/home_view.dart';
import 'package:app_web/ui/pages/questions/cubit/questions_cubit.dart';
import 'package:app_web/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsFinishSection extends StatefulWidget {
  const QuestionsFinishSection({super.key});

  @override
  State<QuestionsFinishSection> createState() => _QuestionsFinishSectionState();
}

class _QuestionsFinishSectionState extends State<QuestionsFinishSection> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            height: size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  state.name,
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: sizeText1,
                  ),
                ),
                Text(
                  'Tu puntaje total fue',
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: sizeText1,
                  ),
                ),
                Text(
                  '${((state.count / state.totalQuestions) * 100)}/100 puntos',
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: sizeText3,
                  ),
                ),
                Text(
                  '${state.count}/${state.totalQuestions} preguntas fueron correctas',
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: sizeText2,
                  ),
                ),
                CustomButton(
                  value: 'Continuar',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  double get sizeText1 {
    final size = MediaQuery.of(context).size;
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return size.width * 0.045;

      case ResponsiveStatus.desktop:
        return size.width * 0.044;

      case ResponsiveStatus.web:
        return size.width * 0.02;
    }
  }

  double get sizeText2 {
    final size = MediaQuery.of(context).size;
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return size.width * 0.03;

      case ResponsiveStatus.desktop:
        return size.width * 0.04;

      case ResponsiveStatus.web:
        return size.width * 0.02;
    }
  }

  double get sizeText3 {
    final size = MediaQuery.of(context).size;
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return size.width * 0.065;

      case ResponsiveStatus.desktop:
        return size.width * 0.044;

      case ResponsiveStatus.web:
        return size.width * 0.02;
    }
  }
}
