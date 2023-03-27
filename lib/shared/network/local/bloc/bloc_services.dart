

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iso_app_5/models/back_end/userlogin.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/states_services.dart';

class ServicesBloc extends Cubit<ServicesStates>{
  ServicesBloc():super(InitialState());
static ServicesBloc get(context)=>BlocProvider.of(context);

void workerRegister({required String first_name,required String last_name,required String email,required String password,
required int phone,required int city_id,required int region_id,required int category_id
})async{
  emit(WorkerRegisterLoading());
  DioClient.post(
      path: 'provider/register',
      data: {
        'first_name':first_name,
        'last_name':last_name,
        'email':email,
        'password':password,
        'phone':phone,
        'city_id':city_id,
        'region_id':region_id,
        'category_id':category_id}
  ).then((value) {
    emit(WorkerRegisterSuccess());


  }).catchError((onError){
    emit(WorkerRegisterError());
    print('!!!!!!!!!!!!1${onError}');
  });

}
  bool isLast=false;
 List getPageView(context)=> [
  Center(
  child:
  Padding(
  padding: const EdgeInsetsDirectional.only(top:40,bottom: 40,start: 30,end:30),
  child: Container(
  decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(15)
  ),
  padding: EdgeInsets.all(20),
  child: SingleChildScrollView(
  child: Column(
  children: [
  Stack(
  alignment: Alignment.bottomLeft,
  children: [
  CircleAvatar(
  radius: 50,
  backgroundImage:NetworkImage('https://th.bing.com/th/id/OIP.v4fJOAuz1Jx4wirUYOrn7AHaE8?pid=ImgDet&w=1024&h=683&rs=1') ,
  ),
  IconButton(icon:Icon(Icons.camera_alt) ,onPressed: (){
  // ServicesBloc.get(context).getImageFromGallry();
  },)
  ],
  ),
  SizedBox(height: 15,),
  Text('NAME ...',style: TextStyle(fontSize: 24,color: Colors.black54)),
  SizedBox(height: 20,),
  Container(
  width: 330,
  decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(10)
  ),
  padding:EdgeInsets.all(13.0) ,
  height: 45,
  child: TextFormField(
  decoration: InputDecoration(
  border: InputBorder.none,
  hintText: 'job title...',

  ),
  ),
  ),
  SizedBox(height: 20,),
  Container(
  width: 330,
  decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(10)
  ),
  padding:EdgeInsetsDirectional.only(start: 20,top: 10,end: 20,bottom: 10) ,
  height: 100,
  child: TextField(
  maxLines: 4,

  decoration: InputDecoration(

  border: InputBorder.none,
  hintText: 'job discrpipton...',

  ),
  ),
  ),
  SizedBox(height: 20,),
  Container(
  width: 330,
  decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(10)
  ),
  padding:EdgeInsetsDirectional.only(start: 20,top: 10,end: 20,bottom: 10) ,
  height: 70,
  child: TextField(
  maxLines: 4,

  decoration: InputDecoration(

  border: InputBorder.none,
  hintText: 'Experiences',

  ),
  ),
  ),

  ],
  ),
  ),
  ),
  )
  ),
  Center(child: Padding(
  padding: const EdgeInsetsDirectional.only(bottom: 40,top: 40,start: 30,end: 30),
  child: Container(

  decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(15),

  ),
  padding: EdgeInsetsDirectional.only(start: 20,top: 30,end: 20,bottom: 10),
  child: SingleChildScrollView(child:Column(
  children: [
  Container(
  width: 330,
  decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(10)
  ),
  padding:EdgeInsetsDirectional.only(top: 10,start: 20,end: 15,bottom: 10) ,
  height: 45,
  child: TextFormField(

  decoration: InputDecoration(
  suffixIcon:  FocusedMenuHolder(
  widthBorder: 80,
  blurSize: 0.0,
  onPressed: (){},
  openWithTap: true,
  child: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
  menuItems: [
  FocusedMenuItem(
  onPressed: (){},
  title: Text('Crafts'),trailingIcon: Icon(Icons.handyman,color: Colors.brown[500],)),
  FocusedMenuItem(
  onPressed: (){},
  title: Text('medical'),trailingIcon: Icon(Icons.local_pharmacy_outlined,color: Colors.cyan,)),
  FocusedMenuItem(
  onPressed: (){},
  title: Text('transportation'),trailingIcon: Icon(Icons.car_rental,color: Colors.limeAccent,)),
  FocusedMenuItem(
  onPressed: (){},
  title: Text('lawyers'),trailingIcon: Icon(Icons.account_balance_outlined,color: Colors.black,)),
  FocusedMenuItem(
  onPressed: (){},
  title: Text('electronics'),trailingIcon: Icon(Icons.electrical_services_outlined,color: Colors.deepPurpleAccent,)),
  FocusedMenuItem(
  onPressed: (){},
  title: Text('clothes'),trailingIcon: Icon(Icons.umbrella,color: Colors.yellow,)),
  FocusedMenuItem(
  onPressed: (){},
  title: Text('pharmacies'),trailingIcon: Icon(Icons.local_pharmacy_outlined,color: Colors.blue,)),
  FocusedMenuItem(
  onPressed: (){},
  title: Text('stationaries'),trailingIcon: Icon(Icons.note_alt_outlined,color: Colors.brown[700],)),

  ],
  ),
  border: InputBorder.none,
  hintText: 'Categories',

  ),
  ),
  ),
  SizedBox(height: 30,),
  Container(
  width: 330,
  decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(10)
  ),
  padding:EdgeInsetsDirectional.only(top: 10,start: 20,end: 15,bottom: 10) ,
  height: 45,
  child: TextFormField(

  decoration: InputDecoration(
  suffixIcon:  FocusedMenuHolder(
  blurSize: 0.0,
  onPressed: (){},
  openWithTap: true,
  child: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
  menuItems: [
  FocusedMenuItem(
  onPressed: (){},
  title: Text('male'),trailingIcon: Icon(Icons.male,color: Colors.brown[500],)),
  FocusedMenuItem(
  onPressed: (){},
  title: Text('female'),trailingIcon: Icon(Icons.female,color: Colors.cyan,)),

  ],
  ),
  border: InputBorder.none,
  hintText: 'Gender',

  ),
  ),
  ),
  SizedBox(height: 30,),
  Container(
  width: 330,
  decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(10)
  ),
  padding:EdgeInsetsDirectional.only(top: 12,start: 20,end: 15,bottom: 13) ,
  height: 45,
  child: TextFormField(

  decoration: InputDecoration(
  suffixIcon: IconButton(icon:Icon(Icons.location_on,color: Colors.greenAccent,),onPressed: (){},),
  border: InputBorder.none,
  hintText: 'location',

  ),
  ),
  ),
  SizedBox(height: 30,),
  Container(
  width: 330,
  decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(10)
  ),
  padding:EdgeInsetsDirectional.only(top: 10,start: 20,end: 15,bottom: 10) ,
  height: 45,
  child: TextFormField(

  decoration: InputDecoration(
  suffixIcon:  FocusedMenuHolder(
  blurSize: 0.0,
  onPressed: (){},
  openWithTap: true,
  child: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
  menuItems: [
  FocusedMenuItem(
  onPressed: (){},
  title: Text('company'),trailingIcon: Icon(Icons.people,color: Colors.brown[500],)),
  FocusedMenuItem(
  onPressed: (){},
  title: Text('self_employed'),trailingIcon: Icon(Icons.person,color: Colors.cyan,)),

  ],
  ),
  border: InputBorder.none,
  hintText: 'account type',

  ),
  ),
  ),
  SizedBox(height: 30,),
  Container(
  width: 330,
  decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(10)
  ),
  padding:EdgeInsetsDirectional.only(top: 10,start: 20,end: 15,bottom: 10) ,
  height: 45,
  child: TextFormField(

  decoration: InputDecoration(
  suffixIcon:
  FocusedMenuHolder(
  openWithTap: true,
  child: Icon(Icons.arrow_drop_down_outlined),
  onPressed:(){} ,
  menuItems: [
  FocusedMenuItem(
  title: Text('less hundred'),

  onPressed: ()=>print('pressed')),
  FocusedMenuItem(
  title: Text('less 1k'),

  onPressed: ()=>print('pressed')
  ),
  FocusedMenuItem(
  title: Text('less 10k'),

  onPressed: ()=>print('pressed')
  ),
  FocusedMenuItem(
  title: Text('less 10k'),

  onPressed: ()=>print('pressed')
  ),
  FocusedMenuItem(
  title: Text('less 50k'),

  onPressed: ()=>print('pressed')
  ),
  FocusedMenuItem(
  title: Text('more'),

  onPressed: ()=>print('pressed')
  ),

  ],




  ),
  border: InputBorder.none,
  hintText: 'Pricing',
  ),),),],),),)) ,)];

  changeIsLast(context,index){
    if(index==ServicesBloc.get(context).getPageView(context).length-1){
      isLast= true;
    }else{
      isLast=false;
    }
    emit(changeLatSuccess());
  }
  UserLogin? userLogin ;
  void workerLogin({required String email,required String password,})
  async
  {
    emit(WorkerLoginLoading());
    DioClient.post(
        path: 'login',
        data: {'email':email, 'password':password,})
        .then((value) {
      emit(WorkerLoginSuccess());
      print(value.toString());
      userLogin=value.data();
      print(userLogin!.provider!.token);


    }).catchError((onError){
      emit(WorkerLoginError());
      print('!!!!!!!!!!!!1${onError}');
    });

  }
  XFile ?  imageFile;
  getImageFromGallry()async{
   emit(cameImageLoading());
   ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
    imageFile=value;
    emit(cameImagSuccess());
   }).catchError((onError){
    print(onError);
   });
  }
  void workerSetUp({
    required String api_token,required int city_id,
    required int region_id,required int category_id,
    required int sub_category_id,required int lat,
    required int lng,
  required String job_title,
  required String job_description,
  required String gender,
  required String image,
    })
  async
  {
    emit(WorkerSetUpLoading());
    DioClient.post(
        path: 'providers/update_profile',
        data: {
          'api_token':api_token, 'city_id':city_id,
          'category_id':category_id,'region_id':region_id,
         'sub_category_id':sub_category_id,
          'lat':lat, 'lng':lng,
          'job_title':job_title, 'job_description':job_description,
          'email':gender
        })
        .then((value) {
      emit(WorkerSetUpSuccess());
    }).catchError((onError){
      emit(WorkerSetUpError());
      print('!!!!!!!!!!!!1${onError}');
    });

  }
}