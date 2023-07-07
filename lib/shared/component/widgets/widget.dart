import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';
Widget formField({
  required String labelText,
  required TextEditingController controller,
  required TextInputType keyboardType,
   IconData? prefixIcon,
  IconData? suffixIcon,
  double hieght=40,
  double width=330
}) =>
   Container(
        height: hieght,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 7),
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.black54,
                inset: true),
            BoxShadow(
              offset: Offset(-2, -7),
              blurRadius: 5,
              spreadRadius: 1,
              color: Colors.white,
              inset: true,
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'this field an\'t be null';
            }
          },
          decoration: InputDecoration(
              hintText: labelText,
              hintStyle: TextStyle(
              fontSize: 15
          ),
              border: InputBorder.none,
              prefixIcon: Icon(
                prefixIcon,
                size: 18,
                color: Colors.black54,
              ),
              suffixIcon: Icon(
                suffixIcon,
                color: Colors.black54,
                size: 18,
              )),
        ));
Widget LoginRegisterButton(
    {required var formKey,
      required Widget Text,
      required dynamic function}) =>
    GestureDetector(
      onTap: function,
      child: Container(
        height: 40,
        width: 330,
        child: Text,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  inset: false,
                  offset: Offset(3, 10),
                  color: Colors.black12,
                  blurRadius: 20),
              BoxShadow(
                  inset: false,
                  offset: Offset(-5, -10),
                  color: Colors.white,
                  spreadRadius: 5,
                  blurRadius: 20),
              BoxShadow(
                  inset: true,
                  offset: Offset(-5, -5),
                  color: Colors.white,
                  blurRadius: 15),
              BoxShadow(
                  inset: true,
                  offset: Offset(5, 10),
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 1)
            ]),
      ),
    );

   FocusedMenuItem focusedMenuItem({required TextEditingController controller  ,required String text,required IconData icon,required context,required int id})=>
       FocusedMenuItem(
       onPressed: ()async{
         controller.text=text;
         CacheHelper.setData(key: 'categoryId', value: id).then((value) async{
           categoryId=await CacheHelper.getData(key: 'categoryId');
         });

       },
       title: Text('${text}'),
       trailingIcon: Icon(
         icon,
         color: Colors.brown[500],
       ));
ShowSnackBar(context,String text,VoidCallback? okAction)=>
    SnackBar(

      margin: EdgeInsetsDirectional.all(10),
      content: Column(
        children: [
          Text('${text}',style:TextStyle(color: Colors.black54)),
          SizedBox(height: 15,),
          Row(
            children: [
              MaterialButton(onPressed: okAction,child: Container(
                child: Center(child: Text('ok'),),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),),
              SizedBox(width: 80,),
              MaterialButton(onPressed: (){
               Navigator .pop(context);
              },child: Container(
                child: Center(child: Text('cancel'),),
                decoration: BoxDecoration(
                  color: Colors.redAccent[100],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),)
            ],
          )
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 5.0,
      clipBehavior: Clip.antiAlias,
      duration: Duration(
        seconds: 15,

      ),
      shape: RoundedRectangleBorder(),
    );
ShowDefaultSnackBar(context,String text,int duration,{VoidCallback? okAction})=>
    SnackBar(
      margin: EdgeInsetsDirectional.all(10),
      content: Column(
        children: [
          Text('${text}',style:TextStyle(color: Colors.black54)),

        ],
      ),
      action:SnackBarAction(
        onPressed: (){
          Navigator.pop(context);
        },
        label: 'dismiss',
      ),
      backgroundColor: Colors.white,
      elevation: 5.0,
      clipBehavior: Clip.antiAlias,
      duration: Duration(
        seconds: duration,
      ),
      shape: RoundedRectangleBorder(),
    );



