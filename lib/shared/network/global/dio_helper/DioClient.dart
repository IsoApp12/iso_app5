import 'dart:io';

import 'package:dio/dio.dart';

class DioClient{
  static Dio? dio;
  static initDio(){
    dio=Dio(
      BaseOptions(

        baseUrl: 'https://isocenter.co/api/',
        receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Credentials': 'true',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
          }

      )
    );
  }

  static Future<Response> post({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio!.post(
      path,
      data: data,
      queryParameters: queryParameters
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String,dynamic>?queryParameters,
    String?token,
  })async{
    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':'en',
      'Authorization':'${token}'??'',
    };
    return await dio!.get(url,queryParameters: queryParameters);
  }
}