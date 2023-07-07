import 'dart:developer';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileWorker extends StatelessWidget {
  ProfileWorker({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> key2 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocRegistration,RegistrationStates>(
      listener: (context,states){
      },
      builder: (context,states){
        var cubit=ServicesBlocRegistration.get(context);
        return SafeArea(
          child: Scaffold(
            
           body: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               width: double.infinity,
               padding: EdgeInsets.all(12),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                         color: Colors.grey,
                         spreadRadius: 1,
                         blurRadius:5
                     )
                   ]
               ),
               child: Container(
                 height: double.infinity,
                 child: SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       CircleAvatar(
                         backgroundImage:  NetworkImage('${cubit.profileInfo!.provider!.imageurl}'),
                         radius: 90,
                       ),
                       SizedBox(height: 10,),
                        Text(
                          '${cubit.profileInfo!.provider!.first_name}${cubit.profileInfo!.provider!.last_name}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${cubit.profileInfo!.provider!.email}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                          ],
                        ),
                       RatingBarIndicator(
                         rating: cubit.profileInfo!.provider!.rateSum!,
                         itemBuilder: (context, index) => Icon(
                           Icons.star,
                           color: Colors.amber,
                         ),
                         itemCount: 5,
                         itemSize: 25.0,
                         direction: Axis.horizontal,
                       ),
                       SizedBox(height: 10,),
                       SizedBox(height: 20,),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('${cubit.profileInfo!.provider!.job_title??null}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                           SizedBox(height: 20,),
                           Text('${cubit.profileInfo!.provider!.job_description??null}',style: TextStyle(fontSize: 18),),
                           SizedBox(height: 20,),
                           Row(
                             children: [
                               Text('${cubit.profileInfo!.provider!.phone??null}'),
                               SizedBox(width: 20,),
                               Icon(IconBroken.Call)
                             ],
                           ),
                           SizedBox(height: 20,),
                           Row(
                             children: [
                               Expanded(child: Text('${cubit.profileInfo!.provider!.address}',overflow: TextOverflow.ellipsis,)),
                               SizedBox(width: 20,),
                               Icon(IconBroken.Location)
                             ],
                           ),
                         ],
                       )

                     ],
                   ),
                 ),
               ),
             ),
           ),

          ),
        );
      },


    ) ;
  }
}


