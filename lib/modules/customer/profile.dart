import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/network/global/dio_helper/DioClient.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';

class ProfileCustomr extends StatelessWidget {
  ProfileCustomr({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ServicesBlocRegistration, RegistrationStates>(
      listener: (context, states) {

      },
      builder: (context, states) {

        var cubit = ServicesBlocRegistration.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: (){}, icon: Icon(IconBroken.Message,color: Colors.blueGrey,)),
                IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification,color: Colors.blueGrey,)),
                MaterialButton(onPressed: (){}, child: Text('Update',style: TextStyle(color: Colors.blueGrey),)),
              ],
                leading: MaterialButton(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:

                    NetworkImage(
                        'https://th.bing.com/th/id/OIP.qyUk3-mfQGIGBUlcjKYJygHaG6?pid=ImgDet&rs=1'),
                  ),
                  onPressed: () {

                  },
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text(
                  'Profile',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
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
                            backgroundImage:
                            cubit.customerView!.imageurl!=null?
                            NetworkImage(
                                '${cubit.customerView!.imageurl}')
                                :
                            NetworkImage(
                                'https://th.bing.com/th/id/OIP.qyUk3-mfQGIGBUlcjKYJygHaG6?pid=ImgDet&rs=1'),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Column(
                        children: [
                          Text(
                            '${cubit.customerView!.firstName}${cubit.customerView!.lastName}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '${cubit.customerView!.email}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              child: Row(
                                children: [
                                  Center(
                                      child: Text(
                                    'Messeege',
                                    style: TextStyle(color: Colors.blueGrey),
                                  )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    IconBroken.Message,
                                    color: Colors.blueGrey,
                                  )
                                ],
                              ),
                              height: 45,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200]),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'address',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      )),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Icon(
                                        IconBroken.Location,
                                        color: Colors.black45,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              child: Row(
                                children: [
                                  Center(
                                      child: Text(
                                    'request location tracking',
                                    style: TextStyle(color: Colors.blueGrey),
                                  )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    IconBroken.Location,
                                    color: Colors.blueGrey,
                                  )
                                ],
                              ),
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
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
