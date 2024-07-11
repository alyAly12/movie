import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';

class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.search,
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}