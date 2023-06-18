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
import 'package:iso_app_5/models/back_end/worker/userlogin.dart';
import 'package:iso_app_5/models/back_end/worker/customer_register.dart';
import 'package:iso_app_5/models/customer/CustomerView.dart';
import 'package:iso_app_5/models/customer/user_login_customer.dart';
import 'package:iso_app_5/models/usrLogin.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';

import '../../../../../models/back_end/worker/userlogin.dart';

class ServicesBlocRegistration extends Cubit<RegistrationStates> {
  ServicesBlocRegistration() : super(InitRegistration());

  static ServicesBlocRegistration get(context) => BlocProvider.of(context);
  TextEditingController jobitle=TextEditingController();
  TextEditingController jobDiscription=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController categoryController=TextEditingController();
  TextEditingController accountTypeController=TextEditingController();
  TextEditingController genderController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController pricingController=TextEditingController();
  TextEditingController jobExperience=TextEditingController();
  PageController pageController=PageController();

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
    required String phone,

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
    required String phone,

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

  UserLoginModelWorker? userLoginModel;
  UserLogin? userLoginn;
  UserLoginCustomer? userLoginCustomer;
  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(UserLoginLoading());
    DioClient.post(path: 'login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      userLoginn= UserLogin.fromJson( json: value.data);
      print(userLoginn!.api_token);
      emit(UserLoginSuccess(userLogin: userLoginn!));
      if(userLoginn!.type==0){
        userLoginCustomer=UserLoginCustomer.fromJson(value.data);
        print(userLoginCustomer!.user!.firstName);
        emit(UserLoginAssigningCustomer());
      }else if(userLoginn!.type==1){
        userLoginModel=UserLoginModelWorker.fromJson(value.data);
        emit(UserLoginAssigningWorker());
      }
    emit(UserLoginAssigning());


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
    })
        .catchError((onError) {
      print(onError);
             });
  }

  void workerSetUp({
    required String api_token,
     int? city_id,
     int? region_id,
     int? category_id,
     int? sub_category_id,
     int? lat,
     int? lng,
     String? job_title,
     String? job_description,
     String? gender,
     String? image,
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

  CustomerView? customerView;
  getCustomerProfile(String tokens){
    emit(GetProfileCustomerLoading());
    DioClient.post(path: 'customers/profile',data: {'api_token':tokens} ).then((value)
    {
      customerView=CustomerView.fromJson(value.data);
      print('حيت من البلوك${customerView!.firstName}');
      emit(GetProfileCustomerSuccess());
    }).catchError((onError){
      print(onError);
      emit(GetProfileCustomerError());
    });
  }
  upDateCustomerProfile(String tokens){
    emit(UpdateProfileCustomerLoading());
    DioClient.post(path: 'update_profile', data: {})
        .then((value) {
      getCustomerProfile(tokens);
      emit(UpdateProfileCustomerSuccess());
    })
        .catchError((onError){
      emit(UpdateProfileCustomerError());
    });
  }

  var ProfilePicker = ImagePicker();
  File? profile;
  Future<void> profilePicker() async {
    emit(pickProfileLoading());
    var pickedImage = await ProfilePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profile = File(pickedImage!.path);
      emit(pickProfileSuccess());

    } else {
      emit(pickProfileeError());
      print('no image selected');
    }
  }

}
