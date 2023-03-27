import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iso_app_5/modules/worker/login_provider.dart';
import 'package:iso_app_5/modules/worker/set_up_account.dart';
import 'package:iso_app_5/modules/worker/sign_up.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/bloc_services.dart';
import 'package:iso_app_5/shared/network/local/bloc/states_services.dart';

import 'shared/network/local/bloc/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  HttpOverrides.global = new MyHttpOverrides();
 DioClient. initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>ServicesBloc())
      ],
      child: BlocConsumer<ServicesBloc,ServicesStates>(
        listener:(context,states)=>{} ,
        builder: (context,states)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

          ),
          home:  LoginScreen(),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
