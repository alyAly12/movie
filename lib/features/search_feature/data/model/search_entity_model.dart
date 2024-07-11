import 'package:moviez/features/search_feature/domain/entity/search_entity.dart';

import '../../../../core/utils/logic_helper/logic_helper.dart';

class SearchEntityModel extends SearchEntity{
  const SearchEntityModel({required super.movieID, required super.posterUrl, required super.title});
  factory SearchEntityModel.fromJson(Map<String,dynamic>json)=>SearchEntityModel(
      movieID: json['id'],
      posterUrl:  getPosterUrl(json['poster_path']),
      title: json['title'] ?? json['name'],
  );
}