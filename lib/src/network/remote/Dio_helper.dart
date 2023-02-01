import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        baseUrl: 'https://biflora.bluecode.sa/api/v1/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response> getdata({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio?.options.headers = {
      // 'lang': lang,
      'Authorization': 'Bearer ${token}',
      'Content-Type': 'application/json'
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postdata(
      {required String url,
      Map<String, dynamic>? query,
      required data,

      // String lang = 'ar',
      String? token}) async {
    dio?.options.headers = {
      // 'lang': 'en0',
      'Authorization': 'Bearer ${token}',
      'Content-Type': 'application/json'
    };
    // print(token);
    return dio!.post(url, queryParameters: query ?? null, data: data);
  }
}
