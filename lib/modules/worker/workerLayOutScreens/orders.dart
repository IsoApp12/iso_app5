import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/models/back_end/worker/getProfile.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/component/widgets/blocks.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class Orders extends StatelessWidget {
  Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocRegistration,RegistrationStates>(
      listener: (context,states){

      },
      builder: (context,states){
        var cubit=ServicesBlocRegistration.get(context);

        return SafeArea(
          child: Scaffold(
            body:Column(
              children: [
               Expanded(
                 child: ListView.separated(
                     scrollDirection: Axis.vertical,
                     itemBuilder: (context,index)=>orderItem(cubit.profileInfo!,index,context)
                     , separatorBuilder: (context,index)=>itemSeparator()
                     , itemCount:cubit.profileInfo!.provider!.orders.length ),
               )

              ],
            )

          ),
        );
      },


    ) ;
  }
  orderItem(ProfileInfo profileInfo,index,context)=> Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: EdgeInsetsDirectional.only(start: 20,end: 20),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),)],
        color: Colors.grey[100]!,
        borderRadius: BorderRadius.circular(13),

      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                    radius:45,
                    backgroundImage:
                    profileInfo.provider!.orders[index].customer!.imageurl !=null?
                    NetworkImage('${profileInfo.provider!.orders[index].customer!.imageurl!}') :
                    NetworkImage(
                        'https://th.bing.com/th/id/OIP.v4fJOAuz1Jx4wirUYOrn7AHaE8?pid=ImgDet&w=1024&h=683&rs=1') as ImageProvider
            )


              ],
            ),
          ),

          Center(child: Container(height: 140,width: 1,color: Colors.grey,)),
          SizedBox(width: 15,),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${profileInfo.provider!.orders[index].customer!.first_name} ${profileInfo.provider!.orders[index].customer!.last_name}'
                      ),
                      SizedBox(width: 60,),
                      TextButton(onPressed: (){
                        ServicesBlocRegistration
                            .get(context)
                            .upDataOrderState(
                            order_id: profileInfo.provider!.orders[index].id
                            , status: 1);
                      }, child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text('accept',style:TextStyle(color: Colors.white)),decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.redAccent),)),
                      TextButton(onPressed: (){
                        ServicesBlocRegistration
                            .get(context)
                            .upDataOrderState(
                            order_id: profileInfo.provider!.orders[index].id
                            , status: 3);
                      }, child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text('cancel',style:TextStyle(color: Colors.white)),decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blueGrey),)),
                    ],
                  ),
                  SizedBox(height: 3,),
                   profileInfo.provider!.orders[index]!.customer!.address !=null?
                  Text('${profileInfo.provider!.orders[index]!.customer!.address!}',overflow: TextOverflow.ellipsis,):
                  Text('no address')
                  ,
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 15,
                          child: Row(
                            textBaseline:TextBaseline.alphabetic ,
                            children: [
                              Expanded(
                                child: Text('${profileInfo.provider!.orders[index]!.date}', style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(

                                  splashRadius: .1,
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: (){}, icon: Icon(

                                IconBroken.Calendar,color: Colors.green[300],size: 20,)),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
  // ListView.separated(
  // itemBuilder: (context,index)=> orderItem()
  // , separatorBuilder: (context,index)=>SizedBox(height: 10,)
  // , itemCount: 10),
}


