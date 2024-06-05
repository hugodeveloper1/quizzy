import 'package:app_web/domain/models/categorie_entity_model.dart';
import 'package:app_web/domain/repositories/category_repository.dart';
import 'package:app_web/ui/pages/questions/cubit/questions_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.categoriesRepository,
  ) : super(const HomeState());

  final CategoryRepository categoriesRepository;

  void getCategories() async {
    final response = await categoriesRepository.getCategories();

    response.fold(
      (l) {},
      (r) {
        emit(state.copyWith(
          categories: r,
          status: StatusPage.complete,
        ));
      },
    );
  }
}
