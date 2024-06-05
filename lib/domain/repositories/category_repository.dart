import 'package:app_web/data/exception/data_exception.dart';
import 'package:app_web/data/remote/category_remote.dart';
import 'package:app_web/domain/models/categorie_entity_model.dart';
import 'package:dartz/dartz.dart';

class CategoryRepository {
  final _remote = CategoryRemote();

  Future<Either<DataException, List<CategoryEntityModel>>>
      getCategories() async {
    final response = await _remote.getCategories();

    return response.fold(
      (l) => Left(l),
      (r) {
        final list = r.map((e) {
          return CategoryEntityModel.fromMap(e);
        }).toList();
        return Right(list);
      },
    );
  }
}
