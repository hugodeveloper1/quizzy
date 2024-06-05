import 'package:app_web/domain/repositories/category_repository.dart';
import 'package:app_web/presentation/theme/app_theme.dart';
import 'package:app_web/ui/pages/home/cubit/home_cubit.dart';
import 'package:app_web/ui/pages/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CategoryRepository>(
          create: (context) => CategoryRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(
              RepositoryProvider.of(context),
            )..getCategories(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: const HomeView(),
        ),
      ),
    );
  }
}
