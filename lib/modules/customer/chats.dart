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
            ListView.separated(

              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index)=>chatItem(context), separatorBuilder:  (context,index)=>Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
              padding: EdgeInsets.all(8),
            ), itemCount: 10)

          ],
        ),
      )
    );
  }
}
