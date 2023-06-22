import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/modules/registration/set_up_account_customer.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
class CustomerLayOut extends StatelessWidget {
   CustomerLayOut({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocCustomer,ServicesStatesCustomer>(
      listener: (context,states){},
      builder: (context,states){
        var cubit=ServicesBlocCustomer.get(context);
        return SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            drawer: Drawer(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 25,start: 10,),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SetUpCustomer()));
                      },
                      child: Row(
                        children: [
                          Expanded(child: Text('Update profile data')),
                          Spacer(),
                          Icon(IconBroken.Setting)
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ),
            appBar: AppBar(
                actions: [
                  IconButton(onPressed: (){}, icon: Icon(IconBroken.Message,color: Colors.blueGrey,)),
                  IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification,color: Colors.blueGrey,)),
                ],
                leading: MaterialButton(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                    FileImage(File(customerProfile!) )as ImageProvider,
                  ),
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text(
                  '${cubit.appBarTitels[cubit.currentIndex]}',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.black54,
              selectedItemColor:  Colors.black54,
              currentIndex: cubit.currentIndex,
              items: [
              BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(IconBroken.Category),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(IconBroken.Chart),label: 'TimeLine'),
              BottomNavigationBarItem(icon: Icon(IconBroken.Profile),label: 'profile'),
            ],
              onTap: (int x){
               cubit.changenavBar(x);
              },

            ),
              ),
        );
      },
    );
  }
}
