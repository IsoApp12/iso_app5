import 'package:flutter/material.dart';

class WorkerChats extends StatelessWidget {
  const WorkerChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(15),
        child: InkWell(
          onTap: () {
            //   Navigator.push(context,MaterialPageRoute(builder: (context)=> ChatDetails(userChatModel: model,)));
          },
          child: Row(
            children: [
              CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.qyUk3-mfQGIGBUlcjKYJygHaG6?pid=ImgDet&rs=1')),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'hend shoep',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.blue,
                        child: Center(
                            child: Icon(
                          Icons.done,
                          size: 7,
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
