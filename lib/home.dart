import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioHelper.dart';
class Home extends StatefulWidget {
    Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: ()async{
                // DioHelper.get(path: 'https://meaningcloud-summarization-v1.p.rapidapi.com/summarization-1.0', data: {
                //   'text': controller.text,
                //   'num_sentences': '3',
                // }).then((value) {
                //   print(value.data);
                // });
             await  summarizeText(controller.text).catchError((onError){ print(onError);});
              },
              icon: Icon(Icons.add,color: Colors.red,),
            )
          ),
          controller:controller ,
        ),
      ),
    );
  }
  // Text Summarization API Generate by Summa NLP ∙ 215 ∙ share Reduces the size of a document by only keeping the most relevant sentences from it. This model aims to reduce the size to 20% of the original. API Docs From our Partners Create the perfect headshots with AI
}
