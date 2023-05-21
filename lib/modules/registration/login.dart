import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:iconly/iconly.dart';
import 'package:iso_app_5/modules/registration/set_up_account_provider.dart';
import 'package:iso_app_5/modules/registration/sign_up.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
 final TextEditingController emailController=TextEditingController();
 final TextEditingController passwordController=TextEditingController();
 var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocRegistration,RegistrationStates>(
      listener: (context,states){
        if(states is  WorkerLoginSuccess){
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>SetUp()));
        }

      },
      builder: (context,states){
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[100],
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 80,start: 30,end: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login ',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black,)),
                      SizedBox(height:25,),
                      Text('Login now to get your services done !',style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(height:25,),
                      formField(keyboardType: TextInputType.emailAddress, labelText: 'email',controller:emailController,prefixIcon: Icons.message ,),
                      SizedBox(height: 30,),
                      formField(
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'password',controller:passwordController
                        ,prefixIcon: Icons.lock,suffixIcon: Icons.remove_red_eye ,),
                      SizedBox(height: 30,),
                      Align (
                          alignment: Alignment.bottomCenter,
                          child:LoginRegisterButton(formKey:formKey,function: (){
                            if(formKey.currentState!.validate()){
                              ServicesBlocRegistration.get(context)   .workerLogin( email: emailController.text,
                                  password: passwordController.text)  ;



                            }
                          },Text: Text('login',style: TextStyle(fontSize: 20),) )),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('don\'t have an account '),
                          SizedBox(width: 10,),
                          TextButton(onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
                          }, child: Text('SignUp ',style: TextStyle(color: Colors.cyan[800]),))

                        ],
                      )

                    ],
                  ),
                ),
              )
              ,
            ),

          ),
        );
      },


    ) ;
  }
}

 //-----------
