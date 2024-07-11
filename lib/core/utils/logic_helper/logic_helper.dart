import '../../network/api_consts.dart';


  String getPosterUrl(String? path) {
    if (path != null) {
      return ApiConstants.basePosterUrl + path;
    } else {
      return ApiConstants.moviePlaceHolder;
    }
  }
