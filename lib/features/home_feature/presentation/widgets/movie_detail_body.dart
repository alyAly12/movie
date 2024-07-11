import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviez/core/component/custom_text_widget.dart';

import '../../../../core/network/api_consts.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/genres.dart';
import '../bloc/detail_bloc/movie_details_bloc.dart';

class MovieDetailBody extends StatelessWidget {
  const MovieDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {

        switch(state.movieDetailState){
          case RequestState.loading:
            return const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstants.imageUrl(
                              state.movieDetail!.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(title:state.movieDetail!.title,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child:CustomTextWidget(title:state.movieDetail!.releaseDate.split('-')[0],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 4),
                                  CustomTextWidget(title:(state.movieDetail!.voteAverage / 2 ).toStringAsFixed(1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  
                                  const SizedBox(width: 10),
                                  CustomTextWidget(title: '(${state.movieDetail!.voteAverage})',fontSize: 12,
                                    fontWeight: FontWeight.w500,color: Colors.black,)
                                ],
                              ),
                              const SizedBox(width: 16),
                              CustomTextWidget(title:_showDuration(state.movieDetail!.runTime),
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CustomTextWidget(title: state.movieDetail!.overView,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            maxLines: 20,
                          ),
                          const SizedBox(height: 8),
                          CustomTextWidget(title: '${AppStrings.genres} ${_showGenres(state.movieDetail!.genres)}',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          case RequestState.error:
            return const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
        }


      },
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }


}