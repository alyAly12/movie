import 'package:flutter/material.dart';

import 'home_popular_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Expanded(
          child: HomePopularWidget(),
        ),
      ],
    );
  }
}
