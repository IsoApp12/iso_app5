// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// class DioHelper{
//   static Dio? dio;
//   static initDioHelper(){
//     dio=Dio(
//         BaseOptions(
//
//             baseUrl: 'https://meaningcloud-summarization-v1.p.rapidapi.com/summarization-1.0',
//             receiveDataWhenStatusError: true,
//             headers: {
//               'Accept': 'application/json',
//               'X-RapidAPI-Key': '5faad7406cmshac4b933d94597d4p1501a9jsn35f87046ef88',
//               'content-type': 'application/json',
//               'X-RapidAPI-Host': 'rapidapi.com'
//             }
//
//         )
//     );
//   }
//
//   static Future<Response>get(
//       {
//         required String path,
//         required Map <String,dynamic>data,
//         Map <String,dynamic>?queryParameters,
//       }
//       )async{
//     return await dio!.get(
//       path,data: data,
//
//     )
//     ;
//
//   }
// }
import 'dart:convert';

import 'package:dio/dio.dart';

Future<String> summarizeText(String inputText) async {
  final String apiKey = '3102b63396mshe17cbef397e5c6fp1d7328jsnabcd8f9a800a';
  final String apiUrl = 'https://meaningcloud-summarization-v1.p.rapidapi.com/summarization-1.0';

  final dio = Dio();
  dio.options.headers['x-rapidapi-host'] = 'rapidapi.com';
  dio.options.headers['x-rapidapi-key'] = apiKey;
  dio.options.headers['content-type'] = 'application/json';
  dio.options.headers['accept'] = 'application/json';

  final response = await dio.post(apiUrl, data: {
    'text': inputText,
    'num_sentences': '3', // number of sentences in the summary
  });

  if (response.statusCode == 200) {
    final responseBody = json.decode(response.data);
    final String summary = responseBody['summary'];
    return summary;
  } else {
    throw Exception('Failed to summarize text: ${response.statusCode}');
  }
}