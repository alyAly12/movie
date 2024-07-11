import 'package:get_it/get_it.dart';
import 'package:moviez/features/search_feature/data/repo/search_repo_impl.dart';
import 'package:moviez/features/search_feature/domain/repo/base_search_repo.dart';
import 'package:moviez/features/search_feature/domain/usecase/search_usecase.dart';
import 'package:moviez/features/search_feature/presentation/bloc/search_bloc.dart';


import '../../features/home_feature/data/data_source/movie_data_source.dart';
import '../../features/home_feature/data/repos/movie_repo.dart';
import '../../features/home_feature/domain/repository/base_movie_repo.dart';
import '../../features/home_feature/domain/usecase/movie_detail_usecase.dart';
import '../../features/home_feature/domain/usecase/movie_popular_usecase.dart';
import '../../features/home_feature/presentation/bloc/detail_bloc/movie_details_bloc.dart';
import '../../features/home_feature/presentation/bloc/movies_bloc.dart';
import '../../features/search_feature/data/data_source/search_data_source.dart';

final GetIt sl = GetIt.instance;
class ServicesLocator{

  void init(){

    ///  bloc
    sl.registerFactory(() => MoviesBloc(sl<GetPopularMoviesUseCase>()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    sl.registerFactory(() => SearchBloc(sl()));
    /// Use Cases
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => SearchUseCase(sl()));
    /// Repository for movie
    sl.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(sl<BaseMovieRemoteDataSource>()));
    sl.registerLazySingleton<SearchRepository>(()=>SearchRepoImpl(sl()));
    ///  DAta Source  movie
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    sl.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl());


  }
}