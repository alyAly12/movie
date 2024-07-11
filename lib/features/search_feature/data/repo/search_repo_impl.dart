import 'package:dartz/dartz.dart';
import 'package:moviez/core/exceptions/failure.dart';
import 'package:moviez/core/exceptions/server_exception.dart';
import 'package:moviez/features/search_feature/domain/entity/search_entity.dart';
import 'package:moviez/features/search_feature/domain/repo/base_search_repo.dart';

import '../data_source/search_data_source.dart';

class SearchRepoImpl extends SearchRepository{
  final SearchRemoteDataSource _baseSearchRemoteDataSource;

  SearchRepoImpl(this._baseSearchRemoteDataSource);

  @override
  Future<Either<Failure, List<SearchEntity>>> search(String title)async {
    try{
      final result = await _baseSearchRemoteDataSource.search(title);
      return right(result);
    }on ServerException catch(fail){
      return left(ServerFailure(fail.errorMessageModel.statusMessage));
    }
  }
}