import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iso_app_5/modules/customer/categories.dart';
import 'package:iso_app_5/modules/customer/home.dart';
import 'package:iso_app_5/modules/customer/profile.dart';
import 'package:iso_app_5/modules/customer/time_line.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/home.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';


class ServicesBlocCustomer extends Cubit<StatesServicesCustomers> {
  ServicesBlocCustomer() : super(InitialStateCustomer());

  static ServicesBlocCustomer get(context) => BlocProvider.of(context);

  List<Widget> screens = [HomeCustomer(),Categories(),TimeLine(),Profile()];

  int currentIndex = 0;

  changenavBar(int x) {
    currentIndex = x;
    emit(ChangeNavBarCustomer());
  }

 Future<void> enablePermission(context) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
       if(permission ==LocationPermission.always){
         emit(CustomerEnabledLoacationSuccess());
         position = await Geolocator.getCurrentPosition(
             desiredAccuracy: LocationAccuracy.high);
         print(position!.latitude);
         CustomerCurrentCameraPosition( position!);
         emit(GetCustomerLocationSuccess());
       }
      } else if (permission == LocationPermission.always) {
        emit(CustomerEnabledLoacationSuccess());
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        print(position!.latitude);
        CustomerCurrentCameraPosition( position!);
        emit(GetCustomerLocationSuccess());
      }
    } catch (onError) {
      print(onError);
      emit(CustomerEnabledLoacationError());
    }
    ;
  }

  CustomerCurrentCameraPosition(Position position){

     latLng= LatLng(position.latitude, position.longitude);
     print('أنا جايلك من البوزيشن');
     emit(ChangeLatLngSuccess());


 }
 Position? position;

  LatLng? latLng;



}
