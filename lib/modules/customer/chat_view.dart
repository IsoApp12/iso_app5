import 'package:flutter/material.dart';
import 'package:iso_app_5/shared/component/widgets/blocks.dart';

class ChatScreen extends StatelessWidget {
  TextEditingController chatController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          padding: EdgeInsets.all(8.0),
          onPressed: (){},
          child: CircleAvatar(
           radius: 30,
            backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.ZObbg3cJw2Jxf1VN7iu3kwHaE6?pid=ImgDet&rs=1'),
          ),
        ),
        title: Text('alaa ali',style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(

            children: <Widget>[
            Spacer(),
             Column(
               children: [
                 buildMessges(),
                 buildMyMessges(),
                 SizedBox(height: 20,)
               ],
             ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller:chatController ,
                        decoration: InputDecoration(
                          hintText: 'Type your message here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton(
                      backgroundColor: Colors.blueGrey,
                      onPressed: () {},
                      child: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}