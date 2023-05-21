import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iso_app_5/models/back_end/userlogin.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/home.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/orders.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/profile.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesBlocWorker extends Cubit<ServicesStatesWorker> {
  ServicesBlocWorker() : super(InitialState());

  static ServicesBlocWorker get(context) => BlocProvider.of(context);



  Future<void> makePhoneCall(String phoneNumber) async {
    PermissionStatus permissionStatus = await Permission.phone.request();
    if (permissionStatus == PermissionStatus.granted) {
      // Permission granted, make the phone call
      await launch("tel:$phoneNumber");
    } else {
      // Permission not granted, show an error message
      throw Exception('Permission to make a phone call was not granted');
    }
  }

  List<Widget> screens = [Orders(),HomeWorker(),Profile()];

  int currentIndex = 0;

  changenavBar(int x) {
   currentIndex = x;
   emit(ChangeNavBar());
  }


}
