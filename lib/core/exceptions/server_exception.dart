import 'error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class LocalServerDataBaseException implements Exception {
  final String message;

  LocalServerDataBaseException({required this.message});
}
