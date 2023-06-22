import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/layouts/customer_layout.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
class SetUpCustomer extends StatelessWidget {
   SetUpCustomer({Key? key}) : super(key: key);
   TextEditingController nameController=TextEditingController();
   var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocCustomer,ServicesStatesCustomer>(
      listener: (context,state){
        if(state is SetUpCustomerSuccess){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerLayOut()));
        }
      },
      builder: (context,state){
        TextEditingController genderController=TextEditingController();

        var cubit=ServicesBlocCustomer.get(context);
    return    Scaffold(
          body: Form(
            key: formKey,
            child: Center(
              child: Container(
                height:500,
                width: 400,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),

                ),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 40, bottom: 40, start: 30, end: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: cubit.profile!=null?FileImage(cubit!.profile!)as ImageProvider:NetworkImage(
                                        'https://th.bing.com/th/id/OIP.v4fJOAuz1Jx4wirUYOrn7AHaE8?pid=ImgDet&w=1024&h=683&rs=1'),
                                  ),
                                  IconButton(
                                    icon: Icon(IconBroken.Camera),
                                    onPressed: () {
                                      cubit.profilePickerCustomer();
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(

                                width: 120,
                                child: TextFormField(

                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'this value can\'t be empty';
                                    }
                                  },
                                  controller:nameController ,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:'type your name ..',
                                      labelStyle: TextStyle(fontSize: 18, color: Colors.black54)

                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                width: 330,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),

                                height: 45,
                                child: TextFormField(
                                  controller:cubit.addressController,
                                  validator: (value){
                                    if(value!.isEmpty) {
                                             return 'this value can\'t be empty';
                                      }},
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: (){
                                          cubit.enablePermission(context);
                                        },
                                      icon: Icon(IconBroken.Location),
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'address',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 330,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                height: 45,
                                child: TextFormField(
                                  validator: (value){
                                    if(value!.isEmpty) {
                                      return 'this value can\'t be empty';
                                    }},
                                  controller:genderController,
                                  decoration: InputDecoration(
                                    suffixIcon: FocusedMenuHolder(
                                      blurSize: 0.0,
                                      onPressed: () {},
                                      openWithTap: true,
                                      child: Icon(
                                        IconBroken.Arrow___Down_2,
                                        color: Colors.black,
                                      ),
                                      menuItems: [
                                        focusedMenuItem(controller:genderController, text: 'male', icon: Icons.male, context: context,id: 1),
                                        focusedMenuItem(controller:genderController, text: 'female', icon: Icons.female_outlined, context: context,id: 2),
                                      ],
                                    ),
                                    border: InputBorder.none,
                                    labelText: 'Gender',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(onPressed: (){
                              if(formKey.currentState!.validate()){
                                cubit.upDateProfile(
                                  token: token!,
                                  lat: cubit.position!.latitude ,
                                  lng: cubit.position!.longitude ,
                                  gender: genderController.text ,
                                );
                              }
                              },
                                child: Container(
                          height: 40,
                          width: 200,
                          child: Center(
                            child: Text('set up',style: TextStyle(color: Colors.white,fontSize: 18),),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      )


                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
