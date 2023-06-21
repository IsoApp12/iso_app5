import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iso_app_5/modules/registration/set_up_account_provider.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';

import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';

import 'shared/network/local/bloc/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = new MyHttpOverrides();
  DioClient.initDio();
  await CacheHelper.initShared();
  token=await CacheHelper.getData(key: 'token');
  print('${token}');
  setTrue=await CacheHelper.getData(key: 'setupDone')== true? true : false;
  print(setTrue);
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
        BlocProvider(create: (BuildContext context)=>ServicesBlocWorker()..getProfileInfo()),
      ],
      child: BlocConsumer<ServicesBlocWorker,ServicesStatesWorker>(
        listener: (context,state){},
        builder: (context,state){
          return BlocConsumer<ServicesBlocCustomer,ServicesStatesCustomer>(
            listener: (context,state){},
            builder: (context,state){
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(

                ),
                home:  SetUpWorker(),

              );
            },
          );
        },
      )


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
