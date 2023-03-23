import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
Widget formField({
  required String labelText,
  required TextEditingController PasswordContrroller,
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
          controller: PasswordContrroller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'this field an\'t be null';
            }
          },
          decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
              fontSize: 15
          ),
              border: InputBorder.none,
              prefixIcon: Icon(
                prefixIcon,
                size: 12,
                color: Colors.black54,
              ),
              suffixIcon: Icon(
                suffixIcon,
                color: Colors.black54,
                size: 12,
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
