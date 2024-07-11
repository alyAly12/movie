import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviez/core/utils/enums.dart';
import 'package:moviez/features/search_feature/presentation/widgets/search_field.dart';
import 'package:moviez/features/search_feature/presentation/widgets/search_grid_view.dart';
import '../../../../core/component/error_text.dart';
import '../../../../core/services/service_locator.dart';
import '../bloc/search_bloc.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                const SearchField(),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    switch (state.searchState) {
                      case RequestState.loading:
                        return  const Expanded(
                            child: Center(child: CircularProgressIndicator()));
                      case RequestState.loaded:
                        return SearchGridView(results: state.searchResults);
                      case RequestState.error:
                        return const Expanded(child: ErrorText());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
