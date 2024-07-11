
import 'package:dio/dio.dart';
import 'package:moviez/features/search_feature/data/model/search_entity_model.dart';

import '../../../../core/exceptions/error_message_model.dart';
import '../../../../core/exceptions/server_exception.dart';
import '../../../../core/network/api_consts.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchEntityModel>> search(String title);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  @override
  Future<List<SearchEntityModel>> search(String title) async {
    final response = await Dio().get(ApiConstants.getSearchPath(title));
    if (response.statusCode == 200) {
      return List<SearchEntityModel>.from((response.data['results'] as List)
          .where((e) => e['media_type'] != 'person')
          .map((e) => SearchEntityModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}