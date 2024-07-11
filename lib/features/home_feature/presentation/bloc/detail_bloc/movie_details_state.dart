part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final String movieDetailsMessage;
  final RequestState movieDetailState;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsMessage = '',
    this.movieDetailState = RequestState.loading,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [movieDetail, movieDetailState, movieDetailsMessage];
}
