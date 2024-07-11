

import 'package:dartz/dartz.dart';
import 'package:moviez/features/search_feature/domain/entity/search_entity.dart';

import '../../../../core/base_usecase/base_usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../repo/base_search_repo.dart';

class SearchUseCase extends BaseUseCase<List<SearchEntity>, String> {
  final SearchRepository _baseSearchRepository;

  SearchUseCase(this._baseSearchRepository);

  @override
  Future<Either<Failure, List<SearchEntity>>> call(String param) async {
    return await _baseSearchRepository.search(param);
  }
}