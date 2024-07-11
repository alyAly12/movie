import '../../domain/entities/movie_detail.dart';
import 'genres_model.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel(
      {required super.genres,
      required super.backdropPath,
      required super.id,
      required super.overView,
      required super.releaseDate,
      required super.runTime,
      required super.title,
      required super.voteAverage});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
          genres: List<GenresModel>.from(
              json['genres'].map((x) => GenresModel.fromJson(x))),
          backdropPath: json['backdrop_path'],
          id: json['id'],
          overView: json['overview'],
          releaseDate: json['release_date'],
          runTime: json['runtime'],
          title: json['title'],
          voteAverage: json['vote_average'].toDouble());
}
