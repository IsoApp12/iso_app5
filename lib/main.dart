import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iso_app_5/layouts/customer_layout.dart';
import 'package:iso_app_5/layouts/worker_layout.dart';
import 'package:iso_app_5/modules/customer/home.dart';
import 'package:iso_app_5/modules/customer/profile.dart';
import 'package:iso_app_5/modules/registration/login.dart';
import 'package:iso_app_5/modules/registration/set_up_account_customer.dart';
import 'package:iso_app_5/modules/registration/set_up_account_provider.dart';
import 'package:iso_app_5/modules/registration/sign_up.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/home.dart';


import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';

import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';

import 'shared/network/local/bloc/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = new MyHttpOverrides();
  DioClient.initDio();
  CacheHelper.initShared();
  String x='0012056';
  int? X=int.tryParse(x);
  print(X);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>ServicesBlocCustomer()..getCategories()
        ),
        BlocProvider(create: (BuildContext context)=>ServicesBlocRegistration()),
        BlocProvider(create: (BuildContext context)=>ServicesBlocWorker()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

          ),
          home:  SetUpCustomer(),

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
