
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController addressController=TextEditingController();

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
        getAddress(position!);
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
        googleMapApiKey: "AIzaSyCbXXQLWMo8mIdDAd_gh9daaeYKx0G-mCc")
        .then((value) {
      address=value.address;
      addressController.text=value.address;

      emit(GetAddressSuccess());
    }).catchError((onError)
    {
      print(onError);
      emit(GetAddressError());

    });


}
  List<String>appBarTitels=['home','categories','timline','profile'];

  var ProfilePicker = ImagePicker();
  File? profile;
  var pickedImage;
  Future<void> profilePickerCustomer() async {
    emit(gerImageFromGalleryLoading());
    pickedImage = await ProfilePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profile =  File(pickedImage!.path);
      CacheHelper.setData(key: 'profile',value: '${pickedImage!.path}').then((value) {

        print('cached image suucessfully');
        emit(gerImageFromGallerySuccess());
      });



    } else {
      emit(gerImageFromGalleryError());
      print('no image selected');
    }
  }
  // FormData? formData;
  // Future<void> uploadImage(File image, double? lat, double? lng, String? gender) async {
  // try  {
  //
  //     String filename = image.path.split('/').last;
  //       formData = FormData.fromMap({
  //         'api_token':token,
  //         'lat':lat,
  //         'lng':lng,
  //         'gender':gender,
  //        'photo': await MultipartFile.fromFile(image!.path,
  //            filename: image!.path.split('/').last),
  //      });
  //
  //   }catch (onError){
  //  print(onError);
  // }
  // }
  
  void upDateProfile({required String token,required double lat, required double lng, required String gender})async{
    emit(SetUpCustomerLoading());
    customerProfile=await CacheHelper.getData(key: 'profile');
    DioClient.post(path: 'customers/update_profile', data: {
      'api_token':token,
      'lat':lat,
      'lng':lng,
      'gender':gender,

    })
   .then((value) {
     print(value.data);
     getCustomer();
      emit(SetUpCustomerSuccess());

    })
   .catchError((onError){
     print(onError);
      emit(SetUpCustomerError());
    });
  }

  CustomerView? customerView;
 void getCustomer(){
    emit(getCustomerLoading());
    DioClient.post(path: 'customers/profile', data: {'api_token':token})
        .then((value) {
          customerView=CustomerView.fromJson(json:value.data);
          print(value.data);
          print('${customerView!.customer!.email}7777777777777');
          emit(getCustomerSuccess());
    })
        .catchError((onError){
          print(onError);
          emit(getCustomerError());
    });
  }


}
