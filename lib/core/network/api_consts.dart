class ApiConstants {
  /// movies
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'f8d767965d5422d9757a67d5608e75ab';
  static const String popularMoviePath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static String movieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

  static String getSearchPath(String title) {
    return '$baseUrl/search/movie?api_key=$apiKey&query=$title';
  }
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';
  static const String moviePlaceHolder =
      'https://davidkoepp.com/wp-content/themes/blankslate/images/Movie%20Placeholder.jpg';
}
