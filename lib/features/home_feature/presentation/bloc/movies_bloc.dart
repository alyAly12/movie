import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base_usecase/base_usecase.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecase/movie_popular_usecase.dart';
import 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MoviesBloc(this.getPopularMoviesUseCase) : super(const MoviesState()) {
    on<GetPopularMoviesEvent>(_getPopularMovies);
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(MoviesState(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(MoviesState(
              popularMovies: r,
              popularState: RequestState.loaded,
            )));
  }
}
