import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iso_app_5/modules/worker/set_up_account.dart';
import 'package:iso_app_5/modules/worker/verify.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';
import 'package:iso_app_5/shared/network/local/bloc/bloc_services.dart';
import 'package:iso_app_5/shared/network/local/bloc/states_services.dart';
class SignUp extends StatelessWidget {
  SignUp ({Key? key}) : super(key: key);
   TextEditingController emailController=TextEditingController();
   TextEditingController passwordController=TextEditingController();
   TextEditingController phoneController=TextEditingController();
   TextEditingController firstnameController=TextEditingController();
   TextEditingController lastnameController=TextEditingController();
   var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBloc,ServicesStates>(
      listener:(context,states){
        if(states is WorkerRegisterSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify())) ;
        }
      } ,

      builder:(context,states){
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 80,start: 30,end: 30,bottom: 30),
                child: Form(
                  key:formKey ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Register ',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black,)),
                      SizedBox(height:25,),
                      Text('Register now for free !',style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(height:40,),
                      formField(keyboardType: TextInputType.emailAddress, labelText: 'first name',PasswordContrroller:firstnameController,prefixIcon: Icons.account_circle_outlined ,),
                      SizedBox(height:25,),
                      formField(keyboardType: TextInputType.emailAddress, labelText: 'last name',PasswordContrroller:lastnameController,prefixIcon: Icons.account_circle_outlined ,),
                      SizedBox(height: 30,),
                      formField(keyboardType: TextInputType.emailAddress, labelText: 'email',PasswordContrroller:emailController,prefixIcon: Icons.message ,),
                      SizedBox(height: 30,),
                      formField(keyboardType: TextInputType.visiblePassword, labelText: 'password',PasswordContrroller:passwordController,prefixIcon: Icons.lock,suffixIcon: Icons.remove_red_eye ,),
                      SizedBox(height: 30,),
                      formField(keyboardType: TextInputType.number, labelText: 'phone',PasswordContrroller:phoneController,prefixIcon: Icons.phone_enabled_outlined),
                      SizedBox(height: 30,),
                      Align (
                          alignment: Alignment.bottomCenter,
                          child:LoginRegisterButton(formKey:formKey,function: (){
                            if(formKey.currentState!.validate()){
                            ServicesBloc.get(context)   .workerRegister(first_name: firstnameController.text, last_name: lastnameController.text, email: emailController.text,
                             password: passwordController.text, phone:phoneController.hashCode  , city_id: 1, region_id: 1, category_id:1)  ;



                            }
                          },Text: Text('Register',style: TextStyle(fontSize: 20),) )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } ,
    );
  }
}






