import 'package:equatable/equatable.dart';
import 'genres.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overView;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;

  const MovieDetail(
      {required this.genres,
      required this.backdropPath,
      required this.id,
      required this.overView,
      required this.releaseDate,
      required this.runTime,
      required this.title,
      required this.voteAverage});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overView,
        releaseDate,
        runTime,
        voteAverage,
        title,
        genres
      ];
}
