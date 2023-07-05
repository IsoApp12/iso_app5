
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
import 'package:iso_app_5/models/back_end/worker/getProfile.dart';
import 'package:iso_app_5/models/customer/CustomerView.dart';
import 'package:iso_app_5/models/customer/providersBelong.dart';
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
  TextEditingController nameController=TextEditingController();
  TextEditingController genderController=TextEditingController();
  List<String>iamges=[
    'https://th.bing.com/th/id/OIP.jXe8w-wKUkZv75-vcu2qVwHaGw?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/R.ec2e39225e1c1a6c70c7276ab8d81315?rik=lhZT%2flcruC7dpA&pid=ImgRaw&r=0' ,
    'https://uploads-ssl.webflow.com/5e15f0280711e6d86ada6d72/5f5932661d2098a4460ac910_bigstock-Plumber-Using-A-Wrench-To-Repa-354004223.jpg',
    'https://th.bing.com/th/id/R.6b689197accce541a664d75f2228243b?rik=nqtAialxlD3DZw&riu=http%3a%2f%2fmatanh.com%2fContent%2fImages%2felctrical.jpg&ehk=WTmuEUlHoHI72mCqEw%2b1Nb9BCZ8eieZUKPbMuumoz0s%3d&risl=&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.b037c395be0e1b56719d07ec7f95c72c?rik=O5uOHwyQNpIeGg&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.f361a65999d222915ae750fb6740e1dd?rik=M0%2fuRASdDbG60g&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.RgYGNYuAN2Odst9mID76KQHaE8?pid=ImgDet&rs=1',
    'https://www.pointloma.edu/sites/default/files/styles/16_9_900w/public/images/41578050550_7418857f6f_o.jpg?h=f2fcf546&itok=JLYU7_k9'

  ];
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




  CustomerView? customerView;
  void getCustomer(){
    emit(GetCustomerLoading());
    DioClient.post(path: 'customers/profile', data: {'api_token':token})
        .then((value) {
      customerView=CustomerView.fromJson(json:value.data);
      print(value.data);
      print('${customerView!.customer!.email}7777777777777');
      emit(GetCustomerSuccess());
    })
        .catchError((onError){
      print(onError);
      emit(GetCustomerError());
    });
  }
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
  Widget homeCatItem({
    required context
    , required Categoriess categoryModel
    ,required int index,
    required List <String>images
    ,required int Id})
  =>GestureDetector(
    onTap: (){
      Id=index;
      print(Id);
      emit(changeIdSuccess());
    },
    child: Container(
      height: 150,
      width: 200,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(

              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),

              ),
              child:Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image(

                    fit: BoxFit.cover,
                    image: NetworkImage(
                      images[index],
                    )),
              )
          ),

          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:10.0),
                Text(
                  '${categoryModel.categories![index].name}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height:5.0),

              ],
            ),
          ),
        ],
      ),
    ),
  );

  int Id=1;

  ProvidersBelong? providersBelong;
 void getProvidersbelongToCategory({required int categoryId}){
   categoryId=this.Id;
   emit(getProvidersbelongToCategoryLoading());
   DioClient.post(path: 'customers/category-providers', data:
           {
             'api_token':token,
             'category':categoryId
           })
    .then((value){

      providersBelong=ProvidersBelong.fromJson(json: value.data);
 // getMarkers(providerInfo: providersBelong!);
      print('iam the provider belong ${}');
      print(providersBelong!.data[2]!.lat);

     emit(getProvidersbelongToCategorySuccess());
   })
    .catchError((onError){
      print(onError);
      emit(getProvidersbelongToCategoryError());
});
}
 void getProvidersbelongToSubCategory({required int subCategoryId}){
   emit(getProvidersbelongToCategoryLoading());
   DioClient.post(path: 'customers/sub-category-providers', data:
           {
             'api_token':token,
             'category':categoryId
           })
    .then((value){
      print(value.data);
     emit(getProvidersbelongToCategorySuccess());
   })
    .catchError((onError){
      print(onError);
      emit(getProvidersbelongToCategoryError());
});
}
  Set <Marker>getMarkers({required ProvidersBelong providerInfo}){
    Set <Marker> markers=Set();
    providerInfo.data.forEach((element) {
      markers.add(
          Marker(
            markerId:MarkerId('${element.id}')
            ,icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
            ,position: LatLng(element.lat ??38.9071929,element.lng??-77.0368721)
            ,onTap: (){}
            ,infoWindow: InfoWindow(
            title: '${element.first_name} ${element.last_name}',
            snippet: '${element.job_title}',



          ),


          ));
    });
print('this is marker ${markers}');
    return markers;

  }




}
