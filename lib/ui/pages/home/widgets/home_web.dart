import 'package:app_web/presentation/constants/constants_images.dart';
import 'package:app_web/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeWeb extends StatelessWidget {
  const HomeWeb({
    super.key,
    required this.sizeTitle,
    required this.sizeSubTitle,
    required this.sizeLogo,
    required this.onTap,
  });

  final double sizeTitle;
  final double sizeSubTitle;
  final double sizeLogo;
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
            height: sizeLogo, // size.width * 0.065,
            fit: BoxFit.fitHeight,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Hero(
                    tag: 'text',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '''Aprender\n'''
                          '''Nuevos conceptos\n'''
                          '''cada minuto''',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: sizeTitle,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                        Text(
                          'Te ayudamos a prepararte para los exámenes y cuestionarios',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: sizeSubTitle, // size.width * 0.012,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Hero(
                  tag: 'image',
                  child: Image.asset(
                    ConstantsImages.image,
                    width: size.width * 0.4,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
