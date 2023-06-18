import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:iconly/iconly.dart';
import 'package:iso_app_5/layouts/customer_layout.dart';
import 'package:iso_app_5/layouts/worker_layout.dart';
import 'package:iso_app_5/modules/registration/set_up_account_provider.dart';
import 'package:iso_app_5/modules/registration/sign_up.dart';
import 'package:iso_app_5/modules/registration/verify.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';
class LoginScreen extends StatelessWidget {

  LoginScreen({Key? key}) : super(key: key);
 final TextEditingController emailController=TextEditingController();
 final TextEditingController passwordController=TextEditingController();
 var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocRegistration,RegistrationStates>(
      listener: (context,states){
        if(states is  UserLoginSuccess){

       if( states.userLogin.type==0){

        CacheHelper.setData(key: 'token', value: '${states.userLogin.api_token}').then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerLayOut()));
        });
       }else  if( states.userLogin.type==1){
         CacheHelper.setData(key: 'token', value: '${states.userLogin.api_token}')
             .then((value) async{
               token=await CacheHelper.getData(key: 'token');
            if(setTrue==false){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>SetUpWorker()));
            }else{
               Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkerLatOut()));}});

       }

        }else if(states is UserLoginError){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                      child: Text('this email dones\'t relate to an account or your account isn\'t verofied yet')),
                ),
                backgroundColor: Colors.redAccent,

              )
          );
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
                              ServicesBlocRegistration.get(context)   .userLogin( email: emailController.text,
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
