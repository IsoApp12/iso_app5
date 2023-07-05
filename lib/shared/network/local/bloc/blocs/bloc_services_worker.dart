import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iso_app_5/models/back_end/worker/getProfile.dart';
import 'package:iso_app_5/models/back_end/worker/userlogin.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/home.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/orders.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/profile.dart';
import 'package:iso_app_5/shared/component/constants.dart';
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
    }}
  List<Widget> screens = [Orders(),HomeWorker(),ProfileWorkr()];
  int currentIndex = 0;
  changenavBar(int x) {
   currentIndex = x;
   emit(ChangeNavBar());
  }
  Future<void> enablePermission(context) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if(permission ==LocationPermission.always){
          emit(WorkerEnabledLoacationSuccess());
          position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          WorkerCurrentCameraPosition( position!);
          getAddress(position!);
          emit(GetWorkerLocationSuccess());
        }
      } else if (permission == LocationPermission.always) {
        emit(WorkerEnabledLoacationSuccess());
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        WorkerCurrentCameraPosition( position!);
        emit(GetWorkerLocationSuccess());
      }
    } catch (onError) {
      print(onError);
      emit(WorkerEnabledLoacationError());
    }
    ;
  }
  Position? position;
  LatLng? latLng;
  WorkerCurrentCameraPosition(Position position){

    latLng= LatLng(position.latitude, position.longitude);
    emit(ChangeLatLngWorkerSuccess());


  }
  String? address;
  ProfileInfo? profileInfo;
  getAddress(Position position)async{
    Geocoder2.getDataFromCoordinates(
        latitude: position.latitude,
        longitude:position.longitude,
        googleMapApiKey: "AIzaSyCbXXQLWMo8mIdDAd_gh9daaeYKx0G-mCc").then((value) {
      address=value.address;

      emit(GetAddressWorkerSuccess());
    }).catchError((onError)
    {
      print(onError);
      emit(GetAddressWorkerError());

    });


  }
  List<String>appBarTitels=['profile','orders','profile'];
  void getProfileInfo(){
    emit(WorkerGetProfileInfoLoading());
    DioClient.post(path: 'providers/profile', data: {'api_token':token},)
        .then((value) {

      profileInfo=ProfileInfo.fromJson(json: value.data);
      print(profileInfo!.provider!.imageurl!);
      emit(WorkerGetProfileInfoSuccess());

    }).catchError((onError){
       print(onError);
      emit(WorkerGetProfileInfoError());
    });
  }
}
