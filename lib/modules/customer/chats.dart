import 'package:flutter/material.dart';
import 'package:iso_app_5/shared/component/widgets/blocks.dart';
class chats extends StatelessWidget {
  const chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chats',style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(

                  decoration: InputDecoration(

                    contentPadding: EdgeInsetsDirectional.only(start: 10),
                    hintText: 'Search',
                    border: InputBorder.none,

                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,

            ),
            // ListView.separated(
            //
            //   physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemBuilder: (context,index)=>chatItem(context), separatorBuilder:  (context,index)=>Container(
            //   height: 1,
            //   width: double.infinity,
            //   color: Colors.grey,
            //   padding: EdgeInsets.all(8),
            // ), itemCount: 10)
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
      ),
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
                      'https://thumbs.dreamstime.com/x/child-autumn-park-having-fun-playing-walks-fresh-air-landscape-beautiful-scenic-place-leaves-101110352.jpg'
                  )),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('aya eladl',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
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
      ),
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
                      'https://th.bing.com/th/id/OIP.ZObbg3cJw2Jxf1VN7iu3kwHaE6?pid=ImgDet&rs=1')),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('alaa ali',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
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
      ),

          ],
        ),
      )
    );
  }
}
