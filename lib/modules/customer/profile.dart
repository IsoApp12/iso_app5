import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';


class ProfileCustomr extends StatelessWidget {
  ProfileCustomr({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController genderController=TextEditingController();
    TextEditingController phoneNumber=TextEditingController();

    return BlocConsumer<ServicesBlocCustomer, ServicesStatesCustomer>(
      listener: (context, states) {

      },
      builder: (context, states) {
        var cubit = ServicesBlocCustomer.get(context);
        phoneNumber.text=cubit.customerView!.customer!.phone!;
        genderController.text=cubit.customerView!.customer!.gender!;
        return SafeArea(
          child: Scaffold(

            body: Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                padding: EdgeInsetsDirectional.only(top: 20),
                width: double.infinity,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 78,
                            backgroundColor: Colors.blue,
                          ),
                          CircleAvatar(
                              radius: 75,
                              backgroundImage:  cubit.customerView != null ?
                              NetworkImage(cubit.customerView!.customer!.imageurl!):
                              NetworkImage(
                                  'https://th.bing.com/th/id/OIP.v4fJOAuz1Jx4wirUYOrn7AHaE8?pid=ImgDet&w=1024&h=683&rs=1') as ImageProvider
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Column(
                        children: [
                          Text('${cubit.customerView!.customer!.firstName} ${cubit.customerView!.customer!.lastName}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            '${cubit.customerView!.customer!.email}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
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
                              enabled: false,
                              controller:cubit.addressController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: (){},
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
                              enabled: false,
                              controller:genderController,
                              decoration: InputDecoration(

                                border: InputBorder.none,
                                hintText: '${cubit.customerView!.customer!.gender!}',
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
                              enabled: false,
                              controller:phoneNumber,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (){},
                                  icon: Icon(IconBroken.Call),
                                ),
                                border: InputBorder.none,
                                hintText: 'phone number',
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
