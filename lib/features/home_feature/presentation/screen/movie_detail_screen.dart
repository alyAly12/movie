
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../../domain/entities/genres.dart';
import '../bloc/detail_bloc/movie_details_bloc.dart';
import '../widgets/movie_detail_body.dart';



class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id)),
      child: const Scaffold(
        body: MovieDetailBody(
        ),
      ),
    );
  }
}


