import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviez/core/component/custom_text_widget.dart';
import 'package:moviez/features/home_feature/domain/entities/movie.dart';
import 'package:moviez/features/home_feature/presentation/bloc/movies_bloc.dart';
import 'package:moviez/features/home_feature/presentation/bloc/movies_event.dart';
import 'package:moviez/features/home_feature/presentation/widgets/home_screen_body.dart';
import 'package:moviez/features/search_feature/presentation/screens/search_screen.dart';

import '../../../../core/services/service_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchValue = '';
  final List<Movies> _suggestions = [];
  Future<List<Movies>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.title.contains(searchValue.toLowerCase());
    }).toList();
  }
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()..add(GetPopularMoviesEvent()),
      child:   Scaffold(
        appBar:AppBar(
          title: const CustomTextWidget(title: 'Movies',color: Colors.white,fontWeight: FontWeight.bold,),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen()));
            },
                icon: const Icon(Icons.search,color: Colors.white,size: 25,))
          ],
        ) ,
        body:const HomeScreenBody(),
      ),
    );
  }
}

