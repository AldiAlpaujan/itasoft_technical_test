import 'package:dio/dio.dart';
import 'package:itasoft_technical_test/services/api/api_helper.dart';

class ApiService {
  static final _dio = Dio(getOptionTimeOut(10));

  static get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    ResponseType? responseType,
  }) async {
    try {
      var response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: getHeader(header: header),
          responseType: responseType,
        ),
      );
      return response;
    } on DioException catch (e) {
      return e;
    }
  }

  static post(
    String url, {
    Object? data,
    Map<String, dynamic>? header,
  }) async {
    try {
      var response = await _dio.post(
        url,
        data: data,
        options: Options(headers: getHeader(header: header)),
      );
      return response;
    } on DioException catch (e) {
      return e;
    }
  }

  static put(
    String url, {
    Object? data,
    Map<String, dynamic>? header,
  }) async {
    try {
      var response = await _dio.put(
        url,
        data: data,
        options: Options(headers: getHeader(header: header)),
      );
      return response;
    } on DioException catch (e) {
      return e;
    }
  }

  static delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    try {
      var response = await _dio.delete(
        url,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      return e;
    }
  }
}
