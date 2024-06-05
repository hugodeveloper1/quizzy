import 'package:app_web/presentation/responsive/responsive_layout.dart';
import 'package:app_web/ui/pages/questions/cubit/questions_cubit.dart';
import 'package:app_web/ui/pages/questions/widgets/questions_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsListSection extends StatefulWidget {
  const QuestionsListSection({super.key});

  @override
  State<QuestionsListSection> createState() => _QuestionsListSectionState();
}

class _QuestionsListSectionState extends State<QuestionsListSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: direction,
          child: Flex(
            direction: direction,
            children: [
              Container(
                width: sizeBlocLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: paddingBlocLeft,
                  vertical: paddingVerticalBlocLeft,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Buena suerte!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: sizeText1,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      state.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: sizeText2,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Marca la respuesta correcta para conseguir un mejor puntaje',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: sizeText3,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: sizeBlocRight,
                height: 700,
                child: QuestionsListWidget(
                  paddingBlocLeft: paddingBlocLeft,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  double get sizeBlocRight {
    final size = MediaQuery.of(context).size;
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return size.width;

      default:
        return size.width * 0.65;
    }
  }

  double get sizeBlocLeft {
    final size = MediaQuery.of(context).size;
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return size.width;

      default:
        return size.width * 0.35;
    }
  }

  double get paddingBlocLeft {
    final size = MediaQuery.of(context).size;
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return size.width * 0.05;

      default:
        return size.width * 0.02;
    }
  }

  double get paddingVerticalBlocLeft {
    final size = MediaQuery.of(context).size;
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return size.width * 0.15;

      default:
        return 0;
    }
  }

  double get sizeText1 {
    final size = MediaQuery.of(context).size;
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return size.width * 0.045;

      case ResponsiveStatus.desktop:
        return size.width * 0.035;

      case ResponsiveStatus.web:
        return size.width * 0.015;
    }
  }

  double get sizeText2 {
    final size = MediaQuery.of(context).size;
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return size.width * 0.055;

      case ResponsiveStatus.desktop:
        return size.width * 0.044;

      case ResponsiveStatus.web:
        return size.width * 0.02;
    }
  }

  double get sizeText3 {
    final size = MediaQuery.of(context).size;
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return size.width * 0.03;

      case ResponsiveStatus.desktop:
        return size.width * 0.02;

      case ResponsiveStatus.web:
        return size.width * 0.015;
    }
  }

  Axis get direction {
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return Axis.vertical;

      default:
        return Axis.horizontal;
    }
  }

  double get sizeLogo {
    final status = ResponsiveStatus.status(context);

    switch (status) {
      case ResponsiveStatus.mobile:
        return 100;

      case ResponsiveStatus.desktop:
        return 200;

      case ResponsiveStatus.web:
        return 300;
    }
  }
}
