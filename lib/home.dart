import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioHelper.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
class Home extends StatefulWidget {
    Home({Key? key}) : super(key: key);
TextEditingController controller=TextEditingController();
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocCustomer,ServicesStatesCustomer>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Center(
            child: TextFormField(
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: ()async{
                      Position position=Position( latitude: 40.714224,
                        longitude: -73.961452, timestamp: null, accuracy: 10,altitude: 2.5,heading: 2.3,speed: 50,speedAccuracy: 100,floor: 3,isMocked: true);
                   ServicesBlocCustomer.get(context).   getAddress( position);

                    },
                    icon: Icon(Icons.add,color: Colors.red,),
                  )
              ),
              controller:controller ,
            ),
          ),
        );
      },
    );
  }
  // Text Summarization API Generate by Summa NLP ∙ 215 ∙ share Reduces the size of a document by only keeping the most relevant sentences from it. This model aims to reduce the size to 20% of the original. API Docs From our Partners Create the perfect headshots with AI
}
