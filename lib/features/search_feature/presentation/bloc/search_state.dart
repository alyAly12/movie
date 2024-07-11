part of 'search_bloc.dart';


 class SearchState {

   final List<SearchEntity> searchResults;
    final RequestState searchState;
   final String message;

   SearchState({
     this.searchResults = const [],
     this.searchState = RequestState.loading,
     this.message =''
   });
}


