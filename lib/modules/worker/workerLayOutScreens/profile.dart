import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocWorker,ServicesStatesWorker>(
      listener: (context,states){
      },
      builder: (context,states){
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text('Profile',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification,color: Colors.black,)),
                IconButton(onPressed: (){}, icon: Icon(IconBroken.Message,color: Colors.black,)),
              ],
            ),
           body: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
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
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     height: 200,
                     child: Row(
                       children: [
                         Container(
                           clipBehavior: Clip.antiAlias,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),

                           ),
                           height: 200,
                           width: 150,
                           child:Image(
                             fit: BoxFit.cover,
                             image:
                             NetworkImage('https://th.bing.com/th/id/OIP.qyUk3-mfQGIGBUlcjKYJygHaG6?pid=ImgDet&rs=1')
                         )),
                         SizedBox(width: 10,),
                         Container(height: 200,width: 1,color: Colors.grey,),
                         SizedBox(width: 10,),
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('hend shoep',overflow: TextOverflow.ellipsis,style: TextStyle(
                                 fontSize: 18.0,
                                 fontWeight: FontWeight.bold,
                               ),),
                               SizedBox(height: 10,),
                               Expanded(
                                 child: Text('hendshoep@gmail.com',overflow: TextOverflow.ellipsis, style: TextStyle(
                                   fontSize: 14.0,
                                   color: Colors.grey[600],
                                 ),),),
                               Expanded(
                                 child: Text('this is the job desription',overflow: TextOverflow.ellipsis, style: TextStyle(
                                   fontSize: 16.0,
                                   color: Colors.grey[600],
                                 ),),
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                 Expanded(child:
                                 InkWell(
                                   child: Column(
                                     children: [
                                       Icon(IconBroken.Message,color: Colors.blueGrey,),
                                       SizedBox(height: 3,),
                                       Text ('Messege')
                                     ],
                                   ),
                                   onTap: (){},
                                 )),

                                 Expanded(child:
                                 InkWell(
                                   child: Column(
                                     children: [
                                       Icon(IconBroken.Send,color: Colors.blueGrey,),
                                       SizedBox(height: 3,),
                                       Text ('follow')
                                     ],
                                   ),
                                   onTap: (){},
                                 )),
                                   Expanded(child:
                                   InkWell(
                                     child: Column(
                                       children: [
                                         Icon(IconBroken.Location,color: Colors.blueGrey,),
                                         SizedBox(height: 3,),
                                         Text ('track')
                                       ],
                                     ),
                                     onTap: (){},
                                   )),

                               ],)
                             ],
                           ),
                         ),

                       ],
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   Container(
                     height: 100,
                     child: Column
                       (
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('job title',overflow: TextOverflow.ellipsis,style: TextStyle(
                           fontSize: 18.0,
                           fontWeight: FontWeight.bold,
                         ),),
                         SizedBox(height: 10,),
                         Expanded(
                           child: Text('job exprience',overflow: TextOverflow.ellipsis, style: TextStyle(
                             fontSize: 14.0,
                             color: Colors.grey[600],
                           ),),
                         ),
                       ],
                     ),
                   ),
                   Row(
                     children: [
                       OutlinedButton(onPressed: ()async{


                         }, child:Text('01013114929') ),
                      SizedBox(width: 30,),
                       InkWell(
                         onTap: (){
                           launch("tel://01013114929");
                         },
                         child: Text('save contact',style: TextStyle(color: Colors.blueGrey[600]),),
                       )
                     ],
                   ),
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                     Expanded(child: Text('address',style: TextStyle(color: Colors.black),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                     SizedBox(width: 30,),
                     Icon(IconBroken.Location,color: Colors.blueGrey,)
                   ],),
                  SizedBox(height: 15,),
                   Text('available',style: TextStyle(color: Colors.black,fontSize: 20),),

               //     GestureDetector(
               //      behavior: HitTestBehavior.opaque,
               //      onTap: ()=>null,
               //      child: DatePicker(
               //        DateTime.now(),
               //
               //   width: 60,
               //   height: 80,
               //
               //   controller: _controller,
               //   dayTextStyle: TextStyle(fontSize: 14),
               //   dateTextStyle: TextStyle(fontSize: 14),
               //   initialSelectedDate: DateTime.now(),
               //   selectionColor: Colors.blueGrey,
               //   selectedTextColor: Colors.white,
               //   inactiveDates: [
               //       DateTime.now().add(Duration(days: 3)),
               //       DateTime.now().add(Duration(days: 4)),
               //       DateTime.now().add(Duration(days: 7))
               //   ],
               //   onDateChange: (date) {
               //       // New date selected
               //
               //   },
               // ),
               //    ),



                 ],
               ),
             ),
           ),

          ),
        );
      },


    ) ;
  }
}


