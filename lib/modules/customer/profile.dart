import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocCustomer,StatesServicesCustomers>(
      listener: (context,states){},
      builder: (context,states){
        var cubit=ServicesBlocCustomer.get(context);
        return SafeArea(
          child: Scaffold(
              body:Padding(
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
                         CircleAvatar(radius: 78,backgroundColor: Colors.blue,),
                         CircleAvatar(
                           radius: 75,
                           backgroundImage:NetworkImage('https://th.bing.com/th/id/OIP.qyUk3-mfQGIGBUlcjKYJygHaG6?pid=ImgDet&rs=1')
                           ,
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height:5.0),
                   Align(
                     alignment: AlignmentDirectional.topCenter,
                     child: Column(
                       children: [
                         Text(
                           'hend shoep',
                           style: TextStyle(
                             fontSize: 18.0,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         SizedBox(height:5.0),
                         Text(
                           'hendshoep @gmail.com',
                           overflow: TextOverflow.ellipsis,
                           maxLines: 3,
                           style: TextStyle(
                             fontSize: 14.0,
                             color: Colors.grey[600],
                           ),
                         ),
                         SizedBox(height: 30,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             height: 100,
                             width: 400,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.grey[200]
                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Expanded(child: Text('address',style: TextStyle(color: Colors.black45,fontSize: 16),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                                   SizedBox(width: 30,),
                                   Icon(IconBroken.Location,color: Colors.black45,)
                                 ],),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),

                    ],
                  ),

                ),
              ) ,
          ),
        );
      },
    );
  }
}
