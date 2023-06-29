import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';

class TimeLine extends StatelessWidget {
  TimeLine({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocCustomer,ServicesStatesCustomer>(
        listener: (context,state){},
        builder: (context,state){
          List <TextEditingController> controllers=
          List.generate(10, (index) => TextEditingController());
          return Scaffold(

            body: ConditionalBuilder(
              fallback: (context)=>Center(child: CircularProgressIndicator()) ,
              condition:10 !=1  ,
              builder: (context)=>ListView.separated(
                  itemBuilder: (context,index)=>postItem(
                      context,
                      controllers[index]
                  )
                  ,
                  separatorBuilder: (context,index)=>Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[200],
                  ),

                  itemCount: 10),
            )



            ,
          );
        }
    );
  }
  Widget postItem(context,TextEditingController commentController)=>
      Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                      NetworkImage('https://media.istockphoto.com/photos/full-body-of-brown-chicken-hen-standing-isolated-white-backgrou-picture-id627031476?k=6&m=627031476&s=612x612&w=0&h=YBpEXJceEEKfgPUeVm5bs0XEm2nEzRubqqsSgYTDbE8='),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('hend shoep',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            CircleAvatar(
                              radius:7,
                              backgroundColor: Colors.blue,
                              child: Center(child: Icon(Icons.done,size: 7,)),
                            )
                          ],
                        ),
                        Text('${DateTime.now()}',style: TextStyle(color: Colors.grey,fontSize: 16),),
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(IconBroken.Setting,size: 22,color: Colors.grey,)),
                    SizedBox(width: 15),

                  ],
                ),
                SizedBox(height: 20,),
                Text('set any text for now cause \'m so busy' ,
                  maxLines: 4,
                  overflow:TextOverflow.ellipsis ,
                ),
                SizedBox(height: 10,),
                //if(postModel.postImage != null)
                Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Image(
                    fit: BoxFit.cover,
                    image:NetworkImage('https://media.istockphoto.com/photos/full-body-of-brown-chicken-hen-standing-isolated-white-backgrou-picture-id627031476?k=6&m=627031476&s=612x612&w=0&h=YBpEXJceEEKfgPUeVm5bs0XEm2nEzRubqqsSgYTDbE8='),

                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      IconButton(icon:Icon(Icons.favorite_border_outlined)
                        ,color: Colors.red,onPressed: (){
                          //  SocialCubit.get(context).postLikes(postId);
                        },),

                      Text('5'),
                      Spacer(),
                      IconButton(
                        icon:Icon(IconBroken.Chat,color: Colors.grey,)
                        ,onPressed: (){
                        // print( SocialCubit.get(context).commentsNumber['${postId}']);
                      },),

                      Text('5'),


                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),

                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[200],
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                      NetworkImage('https://media.istockphoto.com/photos/full-body-of-brown-chicken-hen-standing-isolated-white-backgrou-picture-id627031476?k=6&m=627031476&s=612x612&w=0&h=YBpEXJceEEKfgPUeVm5bs0XEm2nEzRubqqsSgYTDbE8='),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: TextFormField(
                        controller: commentController,
                        decoration: InputDecoration(
                            hintText:'write comment....',
                            border: InputBorder.none

                        ),
                      ),
                    ),
                    IconButton(onPressed: (){
                      //  SocialCubit.get(context).postComments(postId: postId, text: commentController.text);
                    }, icon: Icon(Icons.send,color: Colors.blueGrey,))
                    // ListView.separated(
                    //   itemBuilder:(context,index)=>Expanded(
                    //     child: TextFormField(
                    //       decoration: InputDecoration(
                    //
                    //           labelText:'write comment....',
                    //           border: InputBorder.none
                    //
                    //       ),
                    //     ),
                    //   ),
                    //     separatorBuilder: (context,index)=>Padding(
                    //       padding: EdgeInsetsDirectional.only(start: 20,end: 20),
                    //       child: Container(height: 1,width: double.infinity,color:Colors.grey,), ),
                    //   itemCount:10),
                    // Row(
                    //   children: [
                    //     Icon(Icons.favorite_border_outlined,color: Colors.red,size: 15,),
                    //     SizedBox(
                    //       width:5,
                    //     ),
                    //     Text('Likes'),
                    //     SizedBox(
                    //       width:15,
                    //     ),
                    //     Icon(Icons.share,color: Colors.red,size: 15,),
                    //     SizedBox(
                    //       width:5,
                    //     ),
                    //     Text('share'),
                    //   ],
                    // )
                  ],
                )
              ],),
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
          ));
}