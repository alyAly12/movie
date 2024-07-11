import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overView;
  final double voteAverage;
  final String releaseDate;

  const Movies({
    required this.releaseDate,
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overView,
    required this.voteAverage,
  });

  @override
  List<Object> get props =>
      [id, title, backdropPath, genreIds, overView, voteAverage, releaseDate];
}
