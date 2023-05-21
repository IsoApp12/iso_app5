import 'dart:io';
import 'package:geocoder2/geocoder2.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iso_app_5/models/back_end/userlogin.dart';
import 'package:iso_app_5/models/back_end/worker/customer_register.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';

import '../../../../../models/back_end/userlogin.dart';

class ServicesBlocRegistration extends Cubit<RegistrationStates> {
  ServicesBlocRegistration() : super(InitRegistration());

  static ServicesBlocRegistration get(context) => BlocProvider.of(context);
  bool isLast = false;
  changeIsLast(){
    isLast=true;
    emit(ChangeIsLast());
  }
  workerRegister({
    required String first_name,
    required String last_name,
    required String email,
    required String password,
    required int phone,

  }){
    DioClient.post(path: 'provider/register',
        data: {
          'first_name':first_name,
          'last_name'  :last_name,
          'email'   :email,
          'password':password,
          'phone':phone
        })
        .then((value) {
          print(value.data);
      emit(WorkerRegisterSuccess());
    }).catchError((onError){
      print(onError);
      emit(WorkerRegisterError());
    });
  }

  CustomerRegister? customerRegisterModel;
  customerRegister({
    required String first_name,
    required String last_name,
    required String email,
    required String password,
    required int phone,

  }){
    emit(CustomerRegisterLoading());
    DioClient.post(path: 'customer/register',
        data: {
          'first_name':first_name,
          'last_name'  :last_name,
          'email'   :email,
          'password':password,
          'phone':phone
        })
        .then((value) {
          print(value.data);
          //customerRegisterModel=CustomerRegister.fromJson(json: value.data.);
      emit(CustomerRegisterSuccess());
    }).catchError((onError){
      print(onError);
      emit(CustomerRegisterError());
    });
  }

  verification(
  {
    required String email,
    required int code,
    required int type,
  }){
    emit(VerificationLoading());
    DioClient.post(path: 'verify'
        , data: {
      'email':email,
      'code':code,
      'type':type,
        }).then((value) {
          emit(VerificationSuccess());
    })
        .catchError((onError){
          print(onError);
          emit(VerificationError());
    });
  }

  UserLogin? userLoginModel;
  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(UserLoginLoading());
    DioClient.post(path: 'login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      emit(UserLoginSuccess());
      print(value.toString());
      userLoginModel= UserLogin.fromJson( value.data());
      print(userLoginModel!.provider!.token);
    }).catchError((onError) {
      emit(UserLoginError());
      print('user login model${onError}');
    });
  }

  File? imageFile;

  getImageFromGallry() async {
    emit(CameImageLoading());
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      imageFile = value as File?;
      emit(CameImagSuccess());
    }).catchError((onError) {
      print(onError);
    });
  }

  void workerSetUp({
    required String api_token,
    required int city_id,
    required int region_id,
    required int category_id,
    required int sub_category_id,
    required int lat,
    required int lng,
    required String job_title,
    required String job_description,
    required String gender,
    required String image,
  }) async {
    emit(WorkerSetUpLoading());
    DioClient.post(path: 'providers/update_profile', data: {
      'api_token': api_token,
      'city_id': city_id,
      'category_id': category_id,
      'region_id': region_id,
      'sub_category_id': sub_category_id,
      'lat': lat,
      'lng': lng,
      'job_title': job_title,
      'job_description': job_description,
      'email': gender
    }).then((value) {
      emit(WorkerSetUpSuccess());
    }).catchError((onError) {
      emit(WorkerSetUpError());
      print('!!!!!!!!!!!!1${onError}');
    });
  }
 changeControllerText(TextEditingController controller ,String text,){
    controller.text=text;
    emit(ChangeControllerText());
 }
 String? address;
 getAddress(Position position)async{
   Geocoder2.getDataFromCoordinates(
       latitude: position.latitude,
       longitude:position.longitude,
       googleMapApiKey: "AIzaSyCbXXQLWMo8mIdDAd_gh9daaeYKx0G-mCc").then((value) {
         address=value.address;
   });

 }


}
