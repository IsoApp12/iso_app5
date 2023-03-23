import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:iso_app_5/modules/worker/login_provider.dart';
class Verify extends StatelessWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
      padding: EdgeInsetsDirectional.only(top: 40,start: 40,end: 40,bottom: 40),
        child: Center(
          child: Container(
            decoration: BoxDecoration(

                color: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),

            padding: EdgeInsetsDirectional.only(top: 30,start: 20,end: 20,bottom: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                     CircleAvatar(
                       radius: 50,
                       backgroundImage: AssetImage('assets/images/logover.jpg'),
                     ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Verication',style: Theme.of(context).textTheme.headlineSmall,),

                  SizedBox(
                    height: 30,
                  ),
                  Text('please enter the verfication code had sent to your email',style: TextStyle(fontSize: 18,color: Colors.grey),),
                  SizedBox(
                    height: 30,
                  ),
                  PinCodeFields(length: 6,onComplete: (output){},
                  
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                    child: Container(
                      height: 40,
                      width: 200,
                      child: Center(
                        child: Text('Verify',style: TextStyle(color: Colors.white),),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  )

                ],
              ),
            ),

          ),
        ),
      )
      ,

    );
  }
}
