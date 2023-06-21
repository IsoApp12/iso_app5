import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/modules/registration/set_up_account_provider.dart';
import 'package:iso_app_5/modules/registration/verify.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';
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
    return BlocConsumer<ServicesBlocRegistration,RegistrationStates>(
      listener:(context,states){
      //   if(states is WorkerRegisterSuccess) {
      //     CacheHelper.setData(key: 'accountType', value: 0).then((value)async {
      //       Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify(type: CacheHelper.getData(key: 'accountType') ,email: emailController.text,))) ;
      //     });
      //     if(states is CustomerRegisterSuccess) {
      //       CacheHelper.setData(key: 'accountType', value: 1).then((value) {
      //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify(type:  CacheHelper.getData(key: 'accountType'),email: emailController.text,))) ;
      //       });
      //
      //   }
      // }
        },

      builder:(context,states){
        var cubit=ServicesBlocWorker.get(context);
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
                      formField(keyboardType: TextInputType.emailAddress, labelText: 'first name',controller:firstnameController,prefixIcon: IconBroken.Bookmark ,),
                      SizedBox(height:25,),
                      formField(keyboardType: TextInputType.emailAddress, labelText: 'last name',controller:lastnameController,prefixIcon:  IconBroken.Bookmark ,),
                      SizedBox(height: 30,),
                      formField(keyboardType: TextInputType.emailAddress, labelText: 'email',controller:emailController,prefixIcon:  IconBroken.Profile,),
                      SizedBox(height: 30,),
                      formField(keyboardType: TextInputType.visiblePassword, labelText: 'password',controller:passwordController,prefixIcon: IconBroken.Password,suffixIcon:IconBroken.Lock ,),
                      SizedBox(height: 30,),
                      formField(keyboardType: TextInputType.number, labelText: 'phone',controller:phoneController,prefixIcon: IconBroken.Call),
                      SizedBox(height: 30,),
                      Align (
                          alignment: Alignment.bottomCenter,
                          child:LoginRegisterButton(formKey:formKey,function: (){
                            if(formKey.currentState!.validate()){
                            ServicesBlocRegistration.get(context)   .workerRegister(first_name: firstnameController.text, last_name: lastnameController.text, email: emailController.text,
                             password: passwordController.text, phone:phoneController.text)   ;



                            }
                          },Text: Text('Register as worker',style: TextStyle(fontSize: 17),) )),
                      SizedBox(height: 20,),
                      Align (
                          alignment: Alignment.bottomCenter,
                          child:LoginRegisterButton(formKey:formKey,function: (){
                            if(formKey.currentState!.validate()){
                            ServicesBlocRegistration.get(context). customerRegister(first_name: firstnameController.text, last_name: lastnameController.text, email: emailController.text,
                             password: passwordController.text, phone:phoneController.text )  ;



                            }
                          },Text: Text('Register as customer',style: TextStyle(fontSize: 17),) )),
                      SizedBox(height: 30,),

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






