import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../entity/search_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchEntity>>> search(String title);
}