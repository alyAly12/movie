import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../core/exceptions/error_message_model.dart';
import '../../../../core/exceptions/server_exception.dart';
import '../../../../core/network/api_consts.dart';
import '../../domain/usecase/movie_detail_usecase.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
  Future<MovieDetailModel> getMovieDetails(MovieDetailParameter parameter);

}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    }
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  @override
  Future<MovieDetailModel> getMovieDetails(
      MovieDetailParameter parameter) async {
    final response =
        await Dio().get(ApiConstants.movieDetailsPath(parameter.movieId));

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}
