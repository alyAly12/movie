import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../../domain/usecase/movie_detail_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailUseCase movieDetailUseCase;
  MovieDetailsBloc(this.movieDetailUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
    await movieDetailUseCase(MovieDetailParameter(movieId: event.id));
    result.fold(
          (l) => emit(
            MovieDetailsState(
              movieDetailState:RequestState.error ,
              movieDetailsMessage:l.message
            )
          ),
          (r) => emit(
            MovieDetailsState(movieDetail: r,movieDetailState: RequestState.loaded)
      ),
    );
  }
}
