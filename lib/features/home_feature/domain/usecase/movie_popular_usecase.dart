import 'package:dartz/dartz.dart';

import '../../../../core/base_usecase/base_usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repo.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movies>, NoParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetPopularMoviesUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await baseMovieRepo.getPopularMovies();
  }
}
