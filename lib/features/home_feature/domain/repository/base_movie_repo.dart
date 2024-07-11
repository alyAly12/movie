import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';
import '../usecase/movie_detail_usecase.dart';

abstract class BaseMovieRepo{
  Future<Either<Failure,List<Movies>>> getPopularMovies();
  Future<Either<Failure , MovieDetail>> getMovieDetail(MovieDetailParameter parameter);

}