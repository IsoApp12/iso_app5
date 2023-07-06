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
import 'package:iso_app_5/models/back_end/worker/getProfile.dart';
import 'package:iso_app_5/models/back_end/worker/register.dart';
import 'package:iso_app_5/models/back_end/worker/userlogin.dart';
import 'package:iso_app_5/models/back_end/worker/customer_register.dart';
import 'package:iso_app_5/models/customer/CustomerView.dart';
import 'package:iso_app_5/models/customer/user_login_customer.dart';
import 'package:iso_app_5/models/usrLogin.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';

import '../../../../../models/back_end/worker/userlogin.dart';

class ServicesBlocRegistration extends Cubit<RegistrationStates> {
  ServicesBlocRegistration() : super(InitRegistration());

  static ServicesBlocRegistration get(context) => BlocProvider.of(context);
  TextEditingController jobitle = TextEditingController();
  TextEditingController jobDiscription = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
 TextEditingController pricingController = TextEditingController();
  TextEditingController jobExperience = TextEditingController();
  PageController pageController = PageController();
  bool isLast = false;
  Register? register;







  changeIsLast(int index) {
    if (index >= 1)
    isLast = true;
    else if(index <1)
      isLast = false;
    emit(ChangeIsLast());
  }

  verification({
    required String email,
    required int code,
    required int type,
  }) {
    emit(VerificationLoading());
    DioClient.post(path: 'verify', data: {
      'email': email,
      'code': code,
      'type': type,
    }).then((value) {
      emit(VerificationSuccess());
    }).catchError((onError) {
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

      userLoginn = UserLogin.fromJson(json: value.data);

      if (userLoginn!.type == 0) {

        userLoginCustomer = UserLoginCustomer.fromJson(value.data);

        emit(UserLoginSuccess(userLogin: userLoginn!));
        getCustomer(token:userLoginCustomer!.user!.apiToken!);
      } else if (userLoginn!.type == 1) {
        userLoginModel = UserLoginModelWorker.fromJson(value.data);
        print(userLoginModel!.user!.apiToken!.runtimeType);
        print(userLoginModel!.user!.apiToken!);
        emit(UserLoginSuccess(userLogin: userLoginn!));
        getProfileInfo(token:userLoginModel!.user!.apiToken!);

      }


    }).catchError((onError) {
      emit(UserLoginError());
      print('user login ${onError}');
    });
  }




  //worker ----------------------------------------------------------




  workerRegister({
    required String first_name,
    required String last_name,
    required String email,
    required String password,
    required String phone,
  }) {
    DioClient.post(path: 'provider/register', data: {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'phone': phone
    }).then((value) {
      print(value.data);
      register = Register.fromJson(Json: value.data);
      emit(WorkerRegisterSuccess(0));
    }).catchError((onError) {
      print(onError);
      emit(WorkerRegisterError());
    });
  }
  Position? position;

  void workerSetUp({
    required String api_token,
    int? city_id,
    int? region_id,
    int? category_id,
    int? sub_category_id,
    double? lat,
    double? lng,
    String? job_title,
    String? job_description,
    String? gender,
    String? filePath,
  }) async {
    emit(WorkerSetUpLoading());
    var formData=await FormData.fromMap(
        {
          'api_token': api_token,
          'city_id': city_id,
          'category_id': category_id,
          'region_id': region_id,
          'sub_category_id': sub_category_id,
          'lat': lat,
          'lng': lng,
          'job_title': job_title,
          'job_description': job_description,
          'email': gender,
          'image':filePath != null ? await MultipartFile.fromFile(filePath!):null
        });
    DioClient.post(path: 'providers/update_profile', data: formData
    ).then((value) {
      print(value);
      emit(WorkerSetUpSuccess());
      getProfileInfo(token: api_token);
    }).catchError((onError) {
      emit(WorkerSetUpError());
      print('!!!!!!!!!!!!${onError}');
    });
  }
  Future<void> getPosition(context) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.always) {
          emit(SetUpenabledPermissionSuccess());
          position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          getAddress(position!);
          emit(GetsetupLocationSuccess());
        }
      } else if (permission == LocationPermission.always) {
        emit(SetUpenabledPermissionSuccess());
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        getAddress(position!);
        emit(GetsetupLocationSuccess());
      }
    } catch (onError) {
      print(onError);
      emit(SetUpenabledPermissionError());
    }
    ;
  }
  ProfileInfo? profileInfo;

  void getProfileInfo({required String token}) {
    emit(WorkerGetProfileInfoLoadingReg());
    DioClient.post(
      path: 'providers/profile',
      data: {'api_token': token},
    ).then((value) {
      profileInfo = ProfileInfo.fromJson(json: value.data);
      emit(WorkerGetProfileInfoSuccessReg());
    }).catchError((onError) {
      print('يارب${onError}');
      emit(WorkerGetProfileInfoErrorReg());
    });
  }

  changeControllerText(
    TextEditingController controller,
    String text,
  ) {
    controller.text = text;
    emit(ChangeControllerText());
  }

  String? address;

  getAddress(Position position) async {
    Geocoder2.getDataFromCoordinates(
            latitude: position.latitude,
            longitude: position.longitude,
            googleMapApiKey: "AIzaSyCbXXQLWMo8mIdDAd_gh9daaeYKx0G-mCc")
        .then((value) {
      address = value.address;
      addressController.text = value.address;
      emit(getAdressSuccess());
    }).catchError((onError) {
      print(onError);
      emit(getAdressError());
    });
  }


  var ProfilePicker = ImagePicker();
  File? profile;
  var pickedImage;
  Future<void> profilePicker() async {
    emit(pickProfileLoading());
    pickedImage = await ProfilePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profile = File(pickedImage!.path);

      emit(pickProfileSuccess());
    } else {
      emit(pickProfileeError());
      print('no image selected');
    }
  }


  void upDataOrderState({required int order_id,required int status}){
    emit(updatStateWorkerLoading());
    DioClient.post(path: 'path', data: {'api_token':token,'order_id':order_id,'status':status})
        .then((value) {
      emit(updatStateWorkerSuccess());
      getProfileInfo(token: token);
    })
        .catchError((onError){
      print(onError);
      emit(updatStateWorkerError());
    });
  }





//Customer-------------------------------------------------------------------------------------------------------------------














  TextEditingController addressCustomerController = TextEditingController();
  TextEditingController nameCustomerController = TextEditingController();
  TextEditingController genderCustomerController = TextEditingController();
  String? addressCustomer;
  var ProfilePickerCustomer = ImagePicker();
  File? profileCustomer;
  var pickedImageCustomer;
  CustomerView? customerView;
  Position? positionCustomer;

  customerRegister({
    required String first_name,
    required String last_name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(CustomerRegisterLoading());
    DioClient.post(path: 'customer/register', data: {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'phone': phone
    }).then((value) {
      print(value.data);
      register = Register.fromJson(Json: value.data);
      emit(CustomerRegisterSuccess(1));

    }).catchError((onError) {
      print(onError);
      emit(CustomerRegisterError());
    });
  }
  Future<void> profilePickerCustomer() async {
    emit(gerImageFromCustomerGalleryLoading());
    pickedImageCustomer = await ProfilePickerCustomer.pickImage(source: ImageSource.gallery);
    if (pickedImageCustomer != null) {
      profileCustomer =  File(pickedImageCustomer!.path);
      CacheHelper.setData(key: 'profile',value: '${pickedImageCustomer!.path}').then((value) {

        print('cached image suucessfully');
        emit(gerImageFromCustomerGallerySuccess());
      });



    } else {
      emit(gerImageFromCustomerGalleryError());
      print('no image selected');
    }
  }

  Future<void> getPositionCustomer(context) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.always) {
          emit(CustomerSetUpenabledPermissionSuccess());
          positionCustomer = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          getAddress(positionCustomer!);
          emit(GetsetupLocationSuccess());
        }
      } else if (permission == LocationPermission.always) {
        emit(CustomerSetUpenabledPermissionSuccess());
        positionCustomer = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        getAddressCustomer(positionCustomer!);
        emit(GetsetupCustomerLocationSuccess());
      }
    } catch (onError) {
      print(onError);
      emit(CustomerSetUpenabledPermissionError());
    }
    ;
  }

  getAddressCustomer(Position positionCustomer) async {
    Geocoder2.getDataFromCoordinates(
        latitude: positionCustomer.latitude,
        longitude: positionCustomer.longitude,
        googleMapApiKey: "AIzaSyCbXXQLWMo8mIdDAd_gh9daaeYKx0G-mCc")
        .then((value) {
      addressCustomer = value.address;
      addressCustomerController.text = value.address;

      emit(CustomerAdressSuccess());
    }).catchError((onError) {
      print(onError);
      emit(CustomerAdressError());
    });
  }

  void getCustomer({required String  token}){
    emit(getCustomerLoading());
    DioClient.post(path: 'customers/profile', data: {'api_token':token})
        .then((value) {
      customerView=CustomerView.fromJson(json:value.data);

      emit(getCustomerSuccess());
    })
        .catchError((onError){
      print(onError);
      emit(getCustomerError());
    });
  }
  void upDateProfile({required String token,required double lat, required double lng, required String gender,required String filePath})async{
    emit(SetUpCustomerLoading());
    customerProfile=await CacheHelper.getData(key: 'profile');
    var formData=await FormData.fromMap(
        {
          'api_token': token,
          'lat': lat,
          'lng': lng,
          'gender': gender,
          'image': await MultipartFile.fromFile(filePath)
        });
    DioClient.post(path: 'customers/update_profile', data: formData)
        .then((value) {
      print(value.data);
      getCustomer(token: token);
      emit(SetUpCustomerSuccess());

    })
        .catchError((onError){
      print(onError);
      emit(SetUpCustomerError());
    });
  }


}
