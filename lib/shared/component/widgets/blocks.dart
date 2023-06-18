import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/models/back_end/categories.dart';
import 'package:iso_app_5/modules/customer/search_screen.dart';

Widget categoryItem({required context, required Categoriess categoryModel,required int index})=>GestureDetector(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
  },
  child: Container(
    height: 200,
    width: 200,
    margin: EdgeInsets.symmetric(vertical: 10.0),
    padding: EdgeInsets.all(10.0),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(

            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35.0),

            ),
            child:Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Image(

                fit: BoxFit.cover,
                image:categoryModel.categories![index].image==null? NetworkImage(
                  'https://picsum.photos/id/237/200/300',
                ):NetworkImage(
                  '${categoryModel.categories![index].image}',
                ),),
            )
        ),

        SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${categoryModel.categories![index].name}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height:5.0),
              Text(
                'Description of the category',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
Widget homeCatItem({required context, required Categoriess categoryModel,required int index})=>GestureDetector(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
  },
  child: Container(
    height: 200,
    width: 200,
    margin: EdgeInsets.symmetric(vertical: 10.0),
    padding: EdgeInsets.all(10.0),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(

            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35.0),

            ),
            child:Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Image(

                fit: BoxFit.cover,
                image:categoryModel.categories![index].image==null? NetworkImage(
                  'https://picsum.photos/id/237/200/300',
                ):NetworkImage(
                  '${categoryModel.categories![index].image}',
                ),),
            )
        ),

        SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${categoryModel.categories![index].name}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height:5.0),
              Text(
                'Description of the category',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
Widget chatItem(context)=>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.6nbWUawnDTIcJ5c8ZrPEPwHaFj?pid=ImgDet&rs=1'),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Text('hend shoep',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),),
              ),
                SizedBox(height: 7,),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10,end: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text('this is the last messege',style: Theme.of(context).textTheme.bodyMedium,)),
                      Text('12:00 am')
                    ],
                  ),
                ),
            ],),
          )
        ],
      ),
    );
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

                    Text('5 '),


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
Widget buildChatItem({context})=>
    Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: (){

        },
        child: Row(
          children: [
            CircleAvatar(
                radius: 20,
                backgroundImage:
                NetworkImage(
                    'https://th.bing.com/th/id/OIP.v4fJOAuz1Jx4wirUYOrn7AHaE8?pid=ImgDet&w=1024&h=683&rs=1')),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text('hend shoep',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                    SizedBox(width: 5,),
                    CircleAvatar(
                      radius:7,
                      backgroundColor: Colors.blue,
                      child: Center(child: Icon(Icons.done,size: 7,)),
                    )
                  ],
                ),

              ],
            ),

          ],
        ),
      ),
    );
