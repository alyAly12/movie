part of 'movies_bloc.dart';

 class MoviesState extends Equatable{
   final List<Movies> popularMovies;
   final RequestState popularState;
   final String popularMessage;

   const MoviesState({
     this.popularMovies =const [],
     this.popularState = RequestState.loading,
     this.popularMessage= ''
 });

  @override
  // TODO: implement props
  List<Object?> get props => [popularMovies,popularState,popularMessage];
}


