import '../../domain/entities/movie.dart';

class MovieModel extends Movies {
  const MovieModel(
      {required super.releaseDate,
      required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.overView,
      required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      releaseDate: json['release_date'],
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overView: json['overview'],
      voteAverage: json['vote_average'].toDouble());
}
