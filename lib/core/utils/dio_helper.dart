import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../di.dart';

//Dio Helper That's Connect and Talk to API.
class DioHelper {
  static final Dio _dio = Dio(BaseOptions(baseUrl: 'http://amrrouterrr.ddns.net:2222/', headers: {'Content-Type': 'application/json'}))
    ..interceptors.add(PrettyDioLogger(error: true, requestBody: true, requestHeader: true, responseBody: true, responseHeader: true));

  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token,
  }) async {
    try {
      _dio.options.headers = {
        // 'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    Map<String, dynamic>? headers,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    //bool files = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      _dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await _dio.put(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    required String token,
    bool files = false,
  }) async {
    _dio.options.headers = {
      'Authorization': 'Bearer $token',
      // 'Authorization': token ,
      'Content-Type': 'application/json',
    };
    return await _dio.patch(
      url,
      data: data,
    );
  }

  //This Function that's Used To Delete Data to API based on URL(End Points) and Headers.
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    //String lang = 'en',
  }) async {
    try {
      _dio.options.headers = {
        'Authorization': 'Bearer $token',
        // 'Authorization': token ,
        //'Content-Type': 'application/json',
      };
      final Response response = await _dio.delete(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
