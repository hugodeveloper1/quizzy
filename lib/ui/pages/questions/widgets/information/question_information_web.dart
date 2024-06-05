import 'package:app_web/domain/models/categorie_entity_model.dart';
import 'package:app_web/presentation/constants/constants_images.dart';
import 'package:app_web/presentation/theme/app_colors.dart';
import 'package:app_web/ui/pages/questions/cubit/questions_cubit.dart';
import 'package:app_web/ui/pages/questions/widgets/questions_staggered_grid.dart';
import 'package:app_web/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionInformationWeb extends StatelessWidget {
  const QuestionInformationWeb({
    super.key,
    required this.sizeLogo,
    required this.categories,
    required this.childAspectRatio,
  });

  final double sizeLogo;
  final List<CategoryEntityModel> categories;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = context.read<QuestionsCubit>();

    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        return Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Hero(
                tag: 'image',
                child: Image.asset(
                  ConstantsImages.image,
                  width: size.width * 0.4,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ConstantsImages.logo,
                      height: sizeLogo,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(height: size.height * 0.05),
                    TextFormField(
                      textAlign: TextAlign.center,
                      onChanged: cubit.changeName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                      decoration: const InputDecoration(
                        hintText: 'Nombres y apellidos',
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    QuestionsStaggeredGrid(
                      categories: categories,
                      category: state.selectedCategory,
                      childAspectRatio: childAspectRatio,
                      updateCategory: (category) {
                        cubit.changeCategory(category);
                      },
                    ),
                    SizedBox(height: size.height * 0.06),
                    CustomButton(
                      backgroundColor:
                          cubit.verify() ? null : AppColors.lightGrey,
                      width: size.width,
                      value: 'Empezar',
                      onTap: cubit.verify()
                          ? () {
                              cubit.changeSection(QuestionBody.questions);
                            }
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
