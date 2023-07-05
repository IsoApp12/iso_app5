import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iso_app_5/layouts/customer_layout.dart';
import 'package:iso_app_5/layouts/worker_layout.dart';
import 'package:iso_app_5/modules/customer/chats.dart';
import 'package:iso_app_5/modules/customer/home.dart';
import 'package:iso_app_5/modules/customer/search_screen.dart';
import 'package:iso_app_5/modules/registration/login.dart';
import 'package:iso_app_5/modules/registration/set_up_account_customer.dart';
import 'package:iso_app_5/modules/registration/set_up_account_provider.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/worker_chats.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';

import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';

import 'shared/network/local/bloc/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = new MyHttpOverrides();
  DioClient.initDio();
  await CacheHelper.initShared();
  token = await CacheHelper.getData(key: 'token');
  print('${token}');
  setTrue = await CacheHelper.getData(key: 'setupDone') == true ? true : false;
  print(setTrue);
  accountType=await CacheHelper.getData(key: 'type');
  print(accountType);
  List<LatLng>latlngs=[
    LatLng(27.59427246595025, 30.787260725697625),
    LatLng(27.594110822528393, 30.78729827662092),
    LatLng(27.594144102075894, 30.78708369991638),
    LatLng(27.59435328757179, 30.787223174774333),
    LatLng(27.59444837175615, 30.78729291220331),
  ];
  Set <Marker>getMarkers(){
    Set <Marker> markers=Set();
  latlngs.forEach((element) {
    markers.add(
        Marker(markerId:MarkerId('1'),position: element )
    );
  });
    return markers;
  }

  Widget startWidget;
  if (token != null){
    if(accountType==0){
      startWidget=SetUpCustomer();
    }else if(accountType ==1){
      startWidget=SetUpWorker();
    }else{
      startWidget=LoginScreen();
    }
  }
  else{
    startWidget=LoginScreen();
  }
  runApp( MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  Widget startWidget;
   MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => ServicesBlocCustomer()
                ..getCategories()..getProvidersbelongToCategory(categoryId: 3)

                ..getProvidersbelongToCategory(categoryId: 3)),
          BlocProvider(
              create: (BuildContext context) => ServicesBlocRegistration() ..getCustomer()..getProfileInfo()),
          BlocProvider(
              create: (BuildContext context) =>
                  ServicesBlocWorker()),
        ],
        child: BlocConsumer<ServicesBlocWorker, ServicesStatesWorker>(
          listener: (context, state) {},
          builder: (context, state) {
            return BlocConsumer<ServicesBlocCustomer, ServicesStatesCustomer>(
              listener: (context, state) {},
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(),
                  home: startWidget,
                );
              },
            );
          },
        ));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
