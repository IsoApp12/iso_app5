// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
// import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
//
// class Post extends StatelessWidget {
//   Post({Key? key}) : super(key: key);
//   var textController=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ServicesBlocWorker,ServicesStatesWorker>(
//         listener: (context,state){},
//         builder: (context,state){
//           var cubit =ServicesBlocWorker.get(context);
//           var now =DateTime.now();
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0.0,
//               title: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('Create post',style: TextStyle(color: Colors.black),),
//               ),
//
//               actions: [
//                 TextButton(
//                     onPressed: (){
//
//                       // if(cubit.post != null)
//                       // {
//                       //   cubit.uploadPostImage(text: textController.text, dateTime: now.toString());
//                       // }else{
//                       //   cubit.createPost(text: textController.text, dateTime:now.toString());
//                       // }
//
//                     },
//                     child:Text('post',style: TextStyle(fontSize: 20),))
//               ],
//             ),
//             body:Column(
//               children: [
//                 // if (state is CeatePostLoading )
//                 //   LinearProgressIndicator(),
//                 // if (state is CeatePostLoading )
//                 //   SizedBox(height: 10,),
//                 Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                           radius: 20,
//                           backgroundImage:
//                           NetworkImage('https://th.bing.com/th/id/OIP.qyUk3-mfQGIGBUlcjKYJygHaG6?pid=ImgDet&rs=1'),
//                       SizedBox(width: 15),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text('hend shoep',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
//                               SizedBox(width: 5,),
//                               CircleAvatar(
//                                 radius:7,
//                                 backgroundColor: Colors.blue,
//                                 child: Center(child: Icon(Icons.done,size: 7,)),
//                               )
//                             ],
//                           ),
//                           Text('22-2-2013 6:00 am',style: TextStyle(color: Colors.grey,fontSize: 16),),
//                         ],
//                       ),
//                       Spacer(),
//                       IconButton(onPressed: (){}, icon: Icon(Icons.settings_input_component_outlined,size: 18,)),
//                       SizedBox(width: 15),
//
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsetsDirectional.only(start: 20),
//                     child: TextFormField(
//                       controller: textController,
//                       decoration: InputDecoration(
//                           hintText: 'what is on your mind',
//                           border: InputBorder.none
//                       ),
//                     ),
//                   ),
//                 ),
//                 // if(cubit.post !=null)
//                 Expanded(
//                     child:Stack(
//                       alignment: Alignment.topLeft,
//                       children: [
//                         Container(
//                           clipBehavior: Clip.antiAlias,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15)
//                           ),
//                           height: 250,
//                           width: 300,
//                           child: Image(
//
//                             fit: BoxFit.cover,
//                             image:  NetworkImage(
//                               'https://picsum.photos/id/237/200/300',
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: CircleAvatar(
//                             backgroundColor: Colors.blue,
//                             child: IconButton(icon:Icon( Icons.cancel_outlined)
//                               ,onPressed: (){
//                                 //cubit.removePostImage();
//                               },),
//                           ),
//                         )
//                       ],
//                     )
//                 ),
//                 //if(cubit.post !=null)
//                 SizedBox(height: 20,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: (){
//                         // cubit.postImagePick();
//                       },
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.camera_enhance_outlined,size: 20,color: Colors.blue,),
//                           SizedBox(width: 4,),
//                           Text('upload photo',style: TextStyle(color: Colors.blue,fontSize: 20),),
//
//
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 200,),
//                     Text('#tags',style: TextStyle(color: Colors.blue,fontSize: 20),)
//                   ],
//                 )
//               ],
//             ),
//
//           );
//         }
//     );
//   }
// }