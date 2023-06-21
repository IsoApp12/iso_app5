import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iso_app_5/models/back_end/categories.dart';
import 'package:iso_app_5/models/customer/CustomerView.dart';
import 'package:iso_app_5/modules/customer/categories.dart';
import 'package:iso_app_5/modules/customer/home.dart';
import 'package:iso_app_5/modules/customer/profile.dart';
import 'package:iso_app_5/modules/customer/time_line.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/home.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';
class ServicesBlocCustomer extends Cubit<ServicesStatesCustomer> {
  ServicesBlocCustomer() : super(InitialStateCustomer());
  static ServicesBlocCustomer get(context) => BlocProvider.of(context);
  List<Widget> screens = [HomeCustomer(),Categories(),TimeLine(),ProfileCustomr()];
  int currentIndex = 0;
  changenavBar(int x)async {
    currentIndex = x;
    if(x==3){
      token=await CacheHelper.getData(key: 'token');


    }
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
         getAddress(position!);
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
     print('${latLng!.longitude}');
     print('${latLng!.latitude}');
     emit(ChangeLatLngSuccess());


 }
  Position? position;
  LatLng? latLng;
  String? address;
  Categoriess? catItem;
  getCategories(){
  emit(GetCategoriesCustomerLoading());
  DioClient.getData(url: 'categories')
      .then((value) {
     catItem= Categoriess.fromJson(value.data);
     print(catItem!.categories![1].name);
    emit(GetCategoriesCustomerSuccess());
  })
      .catchError((onError){
        print(onError);
        emit(GetCategoriesCustomerError());
  });
}
  getAddress(Position position)async{
    Geocoder2.getDataFromCoordinates(
        latitude: position.latitude,
        longitude:position.longitude,
        googleMapApiKey: "AIzaSyCbXXQLWMo8mIdDAd_gh9daaeYKx0G-mCc").then((value) {
      address=value.address;
      print(address);
      emit(GetAddressSuccess());
    }).catchError((onError)
    {
      print(onError);
      emit(GetAddressError());

    });


}
  List<String>appBarTitels=['home','categories','timline','profile'];
  customerRegister({
    required String api_token,
  }){
    emit(LogOutLoading());
    DioClient.post(path: 'logout',
        data: {
          'api_token':token,},

     )
        .then((value) {
      print(value.data);
      //customerRegisterModel=CustomerRegister.fromJson(json: value.data.);
      emit(LogOutSuccess());
    }).catchError((onError){
      print(onError);
      emit(LogOutError());
    });
  }



}
