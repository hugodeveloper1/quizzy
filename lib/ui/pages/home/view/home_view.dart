import 'package:app_web/presentation/responsive/responsive_layout.dart';
import 'package:app_web/ui/pages/home/cubit/home_cubit.dart';
import 'package:app_web/ui/pages/home/widgets/home_mobile.dart';
import 'package:app_web/ui/pages/home/widgets/home_web.dart';
import 'package:app_web/ui/pages/questions/cubit/questions_cubit.dart';
import 'package:app_web/ui/pages/questions/view/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void onTap(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return QuestionsView(
          categories: cubit.state.categories,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case StatusPage.complete:
              return ResponsiveLayout(
                mobile: HomeMobile(
                  onTap: () => onTap(context),
                ),
                desktop: HomeWeb(
                  onTap: () => onTap(context),
                  sizeTitle: 40,
                  sizeSubTitle: 16,
                  sizeLogo: 70,
                ),
                web: HomeWeb(
                  onTap: () => onTap(context),
                  sizeTitle: size.width * 0.035,
                  sizeSubTitle: size.width * 0.012,
                  sizeLogo: size.width * 0.065,
                ),
              );

            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
