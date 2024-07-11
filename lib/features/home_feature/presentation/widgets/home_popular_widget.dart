import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviez/core/component/custom_text_widget.dart';
import 'package:moviez/core/utils/enums.dart';
import 'package:moviez/features/home_feature/domain/entities/movie.dart';
import 'package:moviez/features/home_feature/presentation/bloc/movies_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/network/api_consts.dart';
import '../screen/movie_detail_screen.dart';

class HomePopularWidget extends StatelessWidget {
  const HomePopularWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        switch(state.popularState){
          case RequestState.loading:
            return const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator(),),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 10),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MovieDetailScreen(id:movie.id),
                              ),
                            );
                            /// to do
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(
                                8.0)),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey[850]!,
                                        highlightColor: Colors.grey[800]!,
                                        child: Container(
                                          height: 170.0,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                ),
                                const SizedBox(height: 10,),
                                CustomTextWidget(title: movie.title,fontSize: 14,fontWeight: FontWeight.w500,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Center(child: Text(state.popularMessage),),
            );
        }

      },
    );
  }
}
