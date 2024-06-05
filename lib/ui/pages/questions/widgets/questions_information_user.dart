import 'package:app_web/domain/models/categorie_entity_model.dart';
import 'package:app_web/presentation/responsive/responsive_layout.dart';
import 'package:app_web/ui/pages/questions/widgets/information/question_information_mobile.dart';
import 'package:app_web/ui/pages/questions/widgets/information/question_information_web.dart';
import 'package:flutter/material.dart';

class QuestionInformationUser extends StatelessWidget {
  const QuestionInformationUser({
    super.key,
    required this.categories,
  });

  final List<CategoryEntityModel> categories;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveLayout(
      mobile: QuestionInformationMobile(
        sizeLogo: size.width * 0.2,
        categories: categories,
        childAspectRatio: 1.8,
      ),
      desktop: QuestionInformationWeb(
        sizeLogo: size.width * 0.12,
        categories: categories,
        childAspectRatio: 1.8,
      ),
      web: QuestionInformationWeb(
        sizeLogo: size.width * 0.09,
        categories: categories,
        childAspectRatio: 3,
      ),
    );
  }
}
