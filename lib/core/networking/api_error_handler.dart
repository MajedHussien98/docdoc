// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:doctor/core/networking/api_error_model';

import 'api_constants.dart';

// TODO: wallahy I will refactor this .. Omar Ahmed
enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  // API_LOGIC_ERROR,
  DEFAULT
}

class ResponseCode {
  // ignore: constant_identifier_names
  static const int SUCCESS = 200; // success with data
  // ignore: constant_identifier_names
  static const int NO_CONTENT = 201; // success with no data (no content)
  // ignore: constant_identifier_names
  static const int BAD_REQUEST = 400; // failure, API rejected request
  // ignore: constant_identifier_names
  static const int UNAUTORISED = 401; // failure, user is not authorised
  // ignore: constant_identifier_names
  static const int FORBIDDEN = 403; //  failure, API rejected request
  // ignore: constant_identifier_names
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  // ignore: constant_identifier_names
  static const int NOT_FOUND = 404; // failure, not found
  // ignore: constant_identifier_names
  static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR

  // local status code
  // ignore: constant_identifier_names
  static const int CONNECT_TIMEOUT = -1;
  // ignore: constant_identifier_names
  static const int CANCEL = -2;
  // ignore: constant_identifier_names
  static const int RECIEVE_TIMEOUT = -3;
  // ignore: constant_identifier_names
  static const int SEND_TIMEOUT = -4;
  // ignore: constant_identifier_names
  static const int CACHE_ERROR = -5;
  // ignore: constant_identifier_names
  static const int NO_INTERNET_CONNECTION = -6;
  // ignore: constant_identifier_names
  static const int DEFAULT = -7;
}

class ResponseMessage {
  // ignore: constant_identifier_names
  static const String NO_CONTENT =
      ApiErrors.noContent; // success with no data (no content)
  // ignore: constant_identifier_names
  static const String BAD_REQUEST =
      ApiErrors.badRequestError; // failure, API rejected request
  // ignore: constant_identifier_names
  static const String UNAUTORISED =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  // ignore: constant_identifier_names
  static const String FORBIDDEN =
      ApiErrors.forbiddenError; //  failure, API rejected request
  // ignore: constant_identifier_names
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.internalServerError; // failure, crash in server side
  // ignore: constant_identifier_names
  static const String NOT_FOUND =
      ApiErrors.notFoundError; // failure, crash in server side
  ResponseMessage({
    required this.ApiErrors.noContent,
    required this.ApiErrors.badRequestError,
    required this.ApiErrors.unauthorizedError,
    required this.ApiErrors.forbiddenError,
    required this.ApiErrors.internalServerError,
    required this.ApiErrors.notFoundError,
  });

  // local status code
  // ignore: non_constant_identifier_names
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  // ignore: non_constant_identifier_names
  static String CANCEL = ApiErrors.defaultError;
  // ignore: non_constant_identifier_names
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  // ignore: non_constant_identifier_names
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  // ignore: non_constant_identifier_names
  static String CACHE_ERROR = ApiErrors.cacheError;
  // ignore: non_constant_identifier_names
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  // ignore: non_constant_identifier_names
  static String DEFAULT = ApiErrors.defaultError;

  ResponseMessage copyWith({
    //? ApiErrors.noContent,
    //? ApiErrors.badRequestError,
    //? ApiErrors.unauthorizedError,
    //? ApiErrors.forbiddenError,
    //? ApiErrors.internalServerError,
    //? ApiErrors.notFoundError,
  }) {
    return ResponseMessage(
      ApiErrors.noContent: ApiErrors.noContent ?? this.ApiErrors.noContent,
      ApiErrors.badRequestError: ApiErrors.badRequestError ?? this.ApiErrors.badRequestError,
      ApiErrors.unauthorizedError: ApiErrors.unauthorizedError ?? this.ApiErrors.unauthorizedError,
      ApiErrors.forbiddenError: ApiErrors.forbiddenError ?? this.ApiErrors.forbiddenError,
      ApiErrors.internalServerError: ApiErrors.internalServerError ?? this.ApiErrors.internalServerError,
      ApiErrors.notFoundError: ApiErrors.notFoundError ?? this.ApiErrors.notFoundError,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ApiErrors.noContent': ApiErrors.noContent.toMap(),
      'ApiErrors.badRequestError': ApiErrors.badRequestError.toMap(),
      'ApiErrors.unauthorizedError': ApiErrors.unauthorizedError.toMap(),
      'ApiErrors.forbiddenError': ApiErrors.forbiddenError.toMap(),
      'ApiErrors.internalServerError': ApiErrors.internalServerError.toMap(),
      'ApiErrors.notFoundError': ApiErrors.notFoundError.toMap(),
    };
  }

  factory ResponseMessage.fromMap(Map<String, dynamic> map) {
    return ResponseMessage(
      ApiErrors.noContent: //.fromMap(map['ApiErrors.noContent'] as Map<String,dynamic>),
      ApiErrors.badRequestError: //.fromMap(map['ApiErrors.badRequestError'] as Map<String,dynamic>),
      ApiErrors.unauthorizedError: //.fromMap(map['ApiErrors.unauthorizedError'] as Map<String,dynamic>),
      ApiErrors.forbiddenError: //.fromMap(map['ApiErrors.forbiddenError'] as Map<String,dynamic>),
      ApiErrors.internalServerError: //.fromMap(map['ApiErrors.internalServerError'] as Map<String,dynamic>),
      ApiErrors.notFoundError: //.fromMap(map['ApiErrors.notFoundError'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseMessage.fromJson(String source) => ResponseMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseMessage(ApiErrors.noContent: $ApiErrors.noContent, ApiErrors.badRequestError: $ApiErrors.badRequestError, ApiErrors.unauthorizedError: $ApiErrors.unauthorizedError, ApiErrors.forbiddenError: $ApiErrors.forbiddenError, ApiErrors.internalServerError: $ApiErrors.internalServerError, ApiErrors.notFoundError: $ApiErrors.notFoundError)';
  }

  @override
  bool operator ==(covariant ResponseMessage other) {
    if (identical(this, other)) return true;
  
    return 
      other.ApiErrors.noContent == ApiErrors.noContent &&
      other.ApiErrors.badRequestError == ApiErrors.badRequestError &&
      other.ApiErrors.unauthorizedError == ApiErrors.unauthorizedError &&
      other.ApiErrors.forbiddenError == ApiErrors.forbiddenError &&
      other.ApiErrors.internalServerError == ApiErrors.internalServerError &&
      other.ApiErrors.notFoundError == ApiErrors.notFoundError;
  }

  @override
  int get hashCode {
    return ApiErrors.noContent.hashCode ^
      ApiErrors.badRequestError.hashCode ^
      ApiErrors.unauthorizedError.hashCode ^
      ApiErrors.forbiddenError.hashCode ^
      ApiErrors.internalServerError.hashCode ^
      ApiErrors.notFoundError.hashCode;
  }
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ApiErrorModel(
            code: ResponseCode.NO_CONTENT, message: ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(
            code: ResponseCode.BAD_REQUEST,
            message: ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return ApiErrorModel(
            code: ResponseCode.FORBIDDEN, message: ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return ApiErrorModel(
            code: ResponseCode.UNAUTORISED,
            message: ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return ApiErrorModel(
            code: ResponseCode.NOT_FOUND, message: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(
            code: ResponseCode.CONNECT_TIMEOUT,
            message: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return ApiErrorModel(
            code: ResponseCode.CANCEL, message: ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return ApiErrorModel(
            code: ResponseCode.RECIEVE_TIMEOUT,
            message: ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(
            code: ResponseCode.SEND_TIMEOUT,
            message: ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(
            code: ResponseCode.CACHE_ERROR,
            message: ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            message: ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return ApiErrorModel(
            code: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badResponse:
      return DataSource.DEFAULT.getFailure();
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}