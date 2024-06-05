import 'package:app_web/presentation/constants/constants_images.dart';
import 'package:app_web/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 15,
          ),
          child: Image.asset(
            ConstantsImages.logo,
            height: 70,
            fit: BoxFit.fitHeight,
          ),
        ),
        Expanded(
          child: Hero(
            tag: 'text',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '''Aprender\n'''
                    '''Nuevos conceptos\n'''
                    '''cada minuto''',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Text(
                    'Te ayudamos a prepararte para los exámenes y cuestionarios',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 35),
                  CustomButton(
                    value: 'Empieza a resolver',
                    onTap: onTap,
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Hero(
              tag: 'image',
              child: Image.asset(
                ConstantsImages.image,
                width: size.width * 0.7,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
