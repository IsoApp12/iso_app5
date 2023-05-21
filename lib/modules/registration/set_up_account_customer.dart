import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
class SetUpCustomer extends StatelessWidget {
   SetUpCustomer({Key? key}) : super(key: key);
TextEditingController nameController=TextEditingController();
TextEditingController addressController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocRegistration,RegistrationStates>(
      listener: (context,state){},
      builder: (context,state){
    return    Scaffold(
          body: Center(
            child: Container(
              height:500,
              width: 400,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),)],
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),

              ),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 40, bottom: 40, start: 30, end: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://th.bing.com/th/id/OIP.v4fJOAuz1Jx4wirUYOrn7AHaE8?pid=ImgDet&w=1024&h=683&rs=1'),
                                ),
                                IconButton(
                                  icon: Icon(IconBroken.Camera),
                                  onPressed: () {
                                    // ServicesBloc.get(context).getImageFromGallry();
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(

                              width: 120,
                              child: TextFormField(
                                controller:nameController ,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:'type your name ..',
                                    labelStyle: TextStyle(fontSize: 18, color: Colors.black54)

                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                              width: 330,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10)),

                              height: 45,
                              child: TextFormField(
                                controller: addressController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: (){},
                                    icon: Icon(IconBroken.Location),
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'address',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MaterialButton(onPressed: (){

                            },
                              child: Container(
                                height: 40,
                                width: 200,
                                child: Center(
                                  child: Text('set up',style: TextStyle(color: Colors.white,fontSize: 18),),
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
                  )),
            ),
          ),
        );
      },
    );
  }
}
