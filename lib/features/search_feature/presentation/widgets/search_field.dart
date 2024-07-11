import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../bloc/search_bloc.dart';


class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      child: TextFormField(
        controller: _textController,
        style: textTheme.bodyLarge,
        onChanged: (title) {
          context.read<SearchBloc>().add(GetSearchResultsEvent(title));
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Colors.blue,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _textController.text = '';
              context.read<SearchBloc>().add( GetSearchResultsEvent(''));
            },
            child: const Icon(
              Icons.clear_rounded,
              color: Colors.red,
            ),
          ),
          hintText: AppStrings.search,
          hintStyle: textTheme.bodyLarge,
        ),
      ),
    );
  }
}