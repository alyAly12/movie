
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviez/features/search_feature/domain/entity/search_entity.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/usecase/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';




class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase _searchUseCase;
  SearchBloc(this._searchUseCase) : super(SearchState()) {
    on<GetSearchResultsEvent>(_getSearchResults);
  }
  Future<void> _getSearchResults(
      GetSearchResultsEvent event, Emitter<SearchState> emit) async {
    final result = await _searchUseCase.call(event.title);
    result.fold(
        (l)=>emit(SearchState(
          searchState: RequestState.error,
          message: l.message
        )),
        (r)=> emit(SearchState(searchResults: r,
        searchState: RequestState.loaded
        )));
  }
}
