import 'dart:io';

import 'package:dio/dio.dart';

import '../../constant/url/app_api_url.dart';
import 'base_model.dart';

class TheHttpExecuter {
  String baseUrl() => AppApiUrl.BASE_URL;
  final dio = Dio();

  Future<dynamic> get<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Map<String, String>? queryParameters = const {},
    required BaseModel model,
  }) async {
    final response = await dio.get(
      "${baseUrl()}$path",
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      default:
        throw response.data;
    }
  }

  Future<dynamic> post<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Object? body = const {},
    Map<String, dynamic>? queryParameters = const {},
    required model,
  }) async {
    final response = await dio.post("${baseUrl()}$path",
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: body);
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      case HttpStatus.forbidden:
        return response.data;
      case HttpStatus.unprocessableEntity:
        return 'Check request key';
      case HttpStatus.unauthorized:
        return "403";
      case HttpStatus.notFound:
        return "404";
      default:
        throw response.data;
    }
  }

  Future<dynamic> put<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Object? body = const {},
    Map<String, dynamic>? queryParameters = const {},
    required model,
  }) async {
    final response = await dio.put(
      "${baseUrl()}$path",
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      case HttpStatus.forbidden:
        return response.data;
      case HttpStatus.unprocessableEntity:
        return 'Check request key';
      case HttpStatus.unauthorized:
        return "403";
      case HttpStatus.notFound:
        return "404";
      default:
        throw response.data;
    }
  }

  Future<dynamic> delete<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Object? body = const {},
    Map<String, dynamic>? queryParameters = const {},
    required model,
  }) async {
    final response = await dio.delete(
      "${baseUrl()}$path",
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      case HttpStatus.forbidden:
        return response.data;
      case HttpStatus.unprocessableEntity:
        return 'Check request key';
      case HttpStatus.unauthorized:
        return "403";
      case HttpStatus.notFound:
        return "404";
      default:
        throw response.data;
    }
  }

  dynamic _jsonBodyParser<T>(model, body) {
    if (body is List) {
      final res = body.map((e) => model.fromJson(e)).toList().cast<T>();
      return res;
    } else if (body is! List) {
      return model.fromJson(body);
    } else {
      return body;
    }
  }
}
