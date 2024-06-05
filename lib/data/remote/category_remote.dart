// ignore_for_file: deprecated_member_use

import 'package:app_web/data/api/api.dart';
import 'package:app_web/data/api/end_point_constant.dart';
import 'package:app_web/data/exception/data_exception.dart';
import 'package:app_web/data/implements/category_implement.dart';
import 'package:app_web/data/response/category_entity_response.dart';
import 'package:dartz/dartz.dart';

class CategoryRemote extends CategoryImplement {
  @override
  Future<Either<DataException, List<CategoryEntityResponse>>>
      getCategories() async {
    late String path = EndPointConstants.categories;
    final response = await Api.createDio().get(path);
    final list = ((response.data ?? []) as List).map((e) {
      return CategoryEntityResponse.fromMap(e);
    }).toList();
    return Right(list);
  }
}
