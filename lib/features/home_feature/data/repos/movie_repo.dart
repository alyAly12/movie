import 'package:dartz/dartz.dart';
import 'package:moviez/core/exceptions/failure.dart';
import 'package:moviez/core/exceptions/server_exception.dart';
import 'package:moviez/features/home_feature/domain/entities/movie.dart';
import 'package:moviez/features/home_feature/domain/entities/movie_detail.dart';
import 'package:moviez/features/home_feature/domain/usecase/movie_detail_usecase.dart';
import '../../domain/repository/base_movie_repo.dart';
import '../data_source/movie_data_source.dart';

class MovieRepo extends BaseMovieRepo {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MovieRepo(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies()async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(
      MovieDetailParameter parameter) async{
    final result =  await baseMovieRemoteDataSource.getMovieDetails(parameter);
    try{
      return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
