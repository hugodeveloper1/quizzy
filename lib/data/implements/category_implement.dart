import 'package:app_web/data/exception/data_exception.dart';
import 'package:app_web/data/response/category_entity_response.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryImplement {
  Future<Either<DataException, List<CategoryEntityResponse>>> getCategories();
}
