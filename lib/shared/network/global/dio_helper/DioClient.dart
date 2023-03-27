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
        // headers: {
        //   "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        //   "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
        //   "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        //   "Access-Control-Allow-Methods": "POST, OPTIONS",
        //   "Postman-Token":"<calculated when request is sent>",
        //      "Cache-Control":"no-cache",
        //        "Content-Type":"multipart/form-data; boundary=<calculated when request is sent>",
        //     "Content-Length":"<calculated when request is sent>",
        //     "Host":"<calculated when request is sent>",
        //     "User-Agent":"PostmanRuntime/7.31.3",
        //      "Accept":"*/*",
        //      "Accept-Encoding":"gzip, deflate, br",
        //     "Connection":"keep-alive"
        //
        //
        //
        // }
      )
    );
  }

 static Future<Response>post(
  {
    required String path,
    required Map <String,dynamic>data,
      Map <String,dynamic>?queryParameters,
         }
      )async{
  return  dio!.post(
      path,data: data,
      // options:Options(
      //     followRedirects: false,
      //     validateStatus: (status) {
      //       return status! < 500;
      //     },
      //   // headers: {  "Postman-Token":"<calculated when request is sent>",
      //   //   "Cache-Control":"no-cache",
      //   //   // "Content-Type":"multipart/form-data; boundary=<calculated when request is sent>",
      //   //   "Content-Length":"<calculated when request is sent>",
      //   //   "Host":"<calculated when request is sent>",
      //   //   "User-Agent":"PostmanRuntime/7.31.3",
      //   //   "Accept":"*/*",
      //   //   "Accept-Encoding":"gzip, deflate, br",
      //   //   "Connection":"keep-alive",}
      // )
  )
  ;

}
}