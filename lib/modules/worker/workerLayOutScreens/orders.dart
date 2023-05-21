import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class Orders extends StatelessWidget {
  Orders({Key? key}) : super(key: key);

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
              title: Text('Home',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification,color: Colors.black,)),
                IconButton(onPressed: (){}, icon: Icon(IconBroken.Message,color: Colors.black,)),
              ],
            ),
             body:ListView.separated(
                 itemBuilder: (context,index)=> orderItem()
                 , separatorBuilder: (context,index)=>SizedBox(height: 10,)
                 , itemCount: 10),

          ),
        );
      },


    ) ;
  }
  orderItem()=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: EdgeInsetsDirectional.only(start: 20,end: 20),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),)],
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),

      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius:60,
                  backgroundImage:
                  NetworkImage('https://th.bing.com/th/id/OIP.qyUk3-mfQGIGBUlcjKYJygHaG6?pid=ImgDet&rs=1')
                ),
                SizedBox(height: 15,),
                Text('hend shoep', style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
          ),

          Center(child: Container(height: 180,width: 1,color: Colors.grey,)),
          SizedBox(width: 15,),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order title',overflow: TextOverflow.ellipsis,style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Text('this is the order desription',overflow: TextOverflow.ellipsis, style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),),
                  ),
                  SizedBox(height: 3,),
                  Container(
                    height: 15,
                    child: Row(
                      textBaseline:TextBaseline.alphabetic ,
                      children: [
                        Expanded(
                          child: Text('egypt cairo ,140 seventh ditrict ',overflow: TextOverflow.ellipsis, style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[600],
                          ),),
                        ),
                        SizedBox(width: 10,),
                        IconButton(
                            padding: EdgeInsets.all(0.0),
                            splashRadius: .1,
                            onPressed: (){}, icon: Icon(IconBroken.Location,color: Colors.red[300],size: 20,))
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 15,
                    child: Row(
                      textBaseline:TextBaseline.alphabetic ,
                      children: [
                        Text('16 - 05 -2023 16:00', style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),),
                        SizedBox(width: 5,),
                        IconButton(
                            splashRadius: .1,
                            padding: EdgeInsets.all(0.0),
                            onPressed: (){}, icon: Icon(

                          IconBroken.Time_Square,color: Colors.green[300],size: 20,))
                      ],
                    ),
                  ),
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      OutlinedButton(onPressed: (){}, child: Text('accept')),
                      Spacer(),
                      OutlinedButton(onPressed: (){}, child: Text('cancel')),
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
}


