import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/base_usecase/base_usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../entities/movie_detail.dart';
import '../repository/base_movie_repo.dart';

class GetMovieDetailUseCase
    extends BaseUseCase<MovieDetail, MovieDetailParameter> {
  final BaseMovieRepo baseMovieRepo;

  GetMovieDetailUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailParameter parameters) async {
    return await baseMovieRepo.getMovieDetail(parameters);
  }
}

class MovieDetailParameter extends Equatable {
  final int movieId;

  const MovieDetailParameter({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
