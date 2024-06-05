import 'package:app_web/domain/models/categorie_entity_model.dart';
import 'package:app_web/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class QuestionsStaggeredGrid extends StatelessWidget {
  const QuestionsStaggeredGrid({
    super.key,
    required this.categories,
    this.crossAxisCount = 2,
    this.spacing = 20,
    this.childAspectRatio = 1.8,
    required this.updateCategory,
    this.category,
  });

  final List<CategoryEntityModel> categories;
  final int crossAxisCount;
  final double spacing;
  final double childAspectRatio;
  final Function(CategoryEntityModel) updateCategory;
  final CategoryEntityModel? category;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final c = categories[index];
        final selected = category == c;
        return CustomCard(
          background: selected ? Theme.of(context).primaryColor : null,
          onTap: () => updateCategory(c),
          child: Center(
            child: Text(
              c.name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                    color: selected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        );
      },
    );
  }
}
