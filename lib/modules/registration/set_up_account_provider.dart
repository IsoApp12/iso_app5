import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/layouts/worker_layout.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';

//import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SetUpWorker extends StatefulWidget {
  SetUpWorker({Key? key}) : super(key: key);

  @override
  State<SetUpWorker> createState() => _SetUpWorkerState();
}

class _SetUpWorkerState extends State<SetUpWorker> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocRegistration, RegistrationStates>(
      listener: (context, state) {
        if (state is WorkerSetUpSuccess) {
         Navigator.pushAndRemoveUntil(

             context,
             MaterialPageRoute(
                 builder: (context) => WorkerLatOut(
                   profileInfo:
                   ServicesBlocRegistration.get(context).profileInfo,
                 )),
           (route) => false,
         );
        }
      },
      builder: (context, state) {
        var cubit = ServicesBlocRegistration.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.grey[300],
            actions: [
              TextButton(
                  onPressed: () {
                    CacheHelper.setData(key: 'setupDone', value: true)
                        .then((value) {
                      cubit.getProfileInfo(token: token!);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkerLatOut(
                                    profileInfo: cubit.profileInfo,
                                  )));
                    });
                  },
                  child: Text(
                    'skip',
                    style: TextStyle(color: Colors.blueGrey),
                  ))
            ],
          ),
          backgroundColor: Colors.grey[300],
          body: ConditionalBuilder(
              condition: ServicesBlocRegistration.get(context).profileInfo !=null
              , builder: (context)=>Column(
            children: [
              Expanded(
                child: PageView(
                  controller: cubit.pageController,
                  children: [
                    Center(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 40, bottom: 40, start: 30, end: 30),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                          cubit.profile != null
                                              ? FileImage(
                                              File(cubit.profile!.path!)):
                                          cubit.profileInfo !=
                                              null
                                              ? NetworkImage(cubit
                                              .profileInfo!.provider!.imageurl!)

                                              : NetworkImage(
                                              'https://th.bing.com/th/id/OIP.v4fJOAuz1Jx4wirUYOrn7AHaE8?pid=ImgDet&w=1024&h=683&rs=1')
                                          as ImageProvider),
                                      IconButton(
                                        icon: Icon(IconBroken.Camera),
                                        onPressed: () {
                                          ServicesBlocRegistration.get(context)
                                              .profilePicker();
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
                                      controller: cubit.nameController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'type your name ..',
                                          labelStyle: TextStyle(
                                              fontSize: 18, color: Colors.black54)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsetsDirectional.symmetric(
                                        horizontal: 10),
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    height: 45,
                                    child: TextFormField(
                                      controller: cubit.jobitle,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'job title...',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 330,
                                    padding: const EdgeInsetsDirectional.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    height: 100,
                                    child: TextField(
                                      maxLines: 4,
                                      controller: cubit.jobDiscription,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'job discrpipton...',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsetsDirectional.symmetric(
                                        horizontal: 10),
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    height: 70,
                                    child: TextField(
                                      controller: cubit.jobExperience,
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Experiences',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Center(
                      child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              bottom: 40, top: 40, start: 30, end: 30),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsetsDirectional.only(
                                start: 20, top: 30, end: 20, bottom: 10),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    padding:
                                    const EdgeInsetsDirectional.symmetric(
                                        horizontal: 10),
                                    height: 45,
                                    child: TextFormField(
                                      controller: cubit.categoryController,
                                      decoration: InputDecoration(
                                        suffixIcon: FocusedMenuHolder(
                                          widthBorder: 80,
                                          blurSize: 0.0,
                                          onPressed: () {},
                                          openWithTap: true,
                                          child: Icon(
                                            IconBroken.Arrow___Down_2,
                                            color: Colors.black,
                                          ),
                                          menuItems: [
                                            focusedMenuItem(
                                                context: context,
                                                controller:
                                                cubit.categoryController,
                                                icon: IconBroken.Work,
                                                text: 'crafts',
                                                id: 4),
                                            focusedMenuItem(
                                                context: context,
                                                controller:
                                                cubit.categoryController,
                                                icon: Icons
                                                    .local_pharmacy_rounded,
                                                text: 'medical',
                                                id: 3),
                                            focusedMenuItem(
                                                context: context,
                                                controller:
                                                cubit.categoryController,
                                                icon: IconBroken.Danger,
                                                text: 'electrical',
                                                id: 8),
                                            focusedMenuItem(
                                                context: context,
                                                controller:
                                                cubit.categoryController,
                                                icon:
                                                Icons.account_balance_sharp,
                                                text: 'Lawyers',
                                                id: 10),
                                            focusedMenuItem(
                                                context: context,
                                                controller:
                                                cubit.categoryController,
                                                icon: Icons.laptop,
                                                text: 'programmer',
                                                id: 7),
                                          ],
                                        ),
                                        border: InputBorder.none,
                                        hintText: 'Categories',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    padding:
                                    const EdgeInsetsDirectional.symmetric(
                                        horizontal: 10),
                                    height: 45,
                                    child: TextFormField(
                                      controller: cubit.genderController,
                                      decoration: InputDecoration(
                                        suffixIcon: FocusedMenuHolder(
                                          blurSize: 0.0,
                                          onPressed: () {},
                                          openWithTap: true,
                                          child: Icon(
                                            IconBroken.Arrow___Down_2,
                                            color: Colors.black,
                                          ),
                                          menuItems: [
                                            focusedMenuItem(
                                                controller:
                                                cubit.genderController,
                                                text: 'male',
                                                icon: Icons.male,
                                                context: context,
                                                id: 1),
                                            focusedMenuItem(
                                                controller:
                                                cubit.genderController,
                                                text: 'female',
                                                icon: Icons.female_outlined,
                                                context: context,
                                                id: 2),
                                          ],
                                        ),
                                        border: InputBorder.none,
                                        hintText: 'Gender',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    padding:
                                    const EdgeInsetsDirectional.symmetric(
                                        horizontal: 10),
                                    height: 45,
                                    child: TextFormField(
                                      controller: cubit.addressController,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            IconBroken.Location,
                                            color: Colors.greenAccent,
                                          ),
                                          onPressed: () async {
                                            cubit
                                                .getPosition(context)
                                                .then((value) {});
                                          },
                                        ),
                                        border: InputBorder.none,
                                        hintText: 'location',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    padding:
                                    const EdgeInsetsDirectional.symmetric(
                                        horizontal: 10),
                                    height: 45,
                                    child: TextFormField(
                                      controller: cubit.accountTypeController,
                                      decoration: InputDecoration(
                                        suffixIcon: FocusedMenuHolder(
                                          blurSize: 0.0,
                                          onPressed: () {},
                                          openWithTap: true,
                                          child: Icon(
                                            IconBroken.Arrow___Down_2,
                                            color: Colors.black,
                                          ),
                                          menuItems: [
                                            focusedMenuItem(
                                                controller:
                                                cubit.accountTypeController,
                                                text: 'company',
                                                icon: IconBroken.User1,
                                                context: context,
                                                id: 1),
                                            focusedMenuItem(
                                                controller:
                                                cubit.accountTypeController,
                                                text: 'self_employed',
                                                icon: Icons.person_2_outlined,
                                                context: context,
                                                id: 2),
                                          ],
                                        ),
                                        border: InputBorder.none,
                                        hintText: 'account type',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: 330,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    padding: EdgeInsetsDirectional.only(
                                        top: 10,
                                        start: 20,
                                        end: 15,
                                        bottom: 10),
                                    height: 45,
                                    child: TextFormField(
                                      controller: cubit.pricingController,
                                      decoration: InputDecoration(
                                        suffixIcon: FocusedMenuHolder(
                                          openWithTap: true,
                                          child: Icon(
                                            IconBroken.Arrow___Down_2,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {},
                                          menuItems: [
                                            focusedMenuItem(
                                                controller:
                                                cubit.pricingController,
                                                text: 'less 1k',
                                                icon: Icons
                                                    .monetization_on_outlined,
                                                context: context,
                                                id: 1),
                                            focusedMenuItem(
                                                controller:
                                                cubit.pricingController,
                                                text: 'less 5k',
                                                icon: Icons
                                                    .monetization_on_outlined,
                                                context: context,
                                                id: 2),
                                            focusedMenuItem(
                                                controller:
                                                cubit.pricingController,
                                                text: 'less 10k',
                                                icon: Icons
                                                    .monetization_on_outlined,
                                                context: context,
                                                id: 3),
                                            focusedMenuItem(
                                                controller:
                                                cubit.pricingController,
                                                text: 'less 50k',
                                                icon: Icons
                                                    .monetization_on_outlined,
                                                context: context,
                                                id: 4),
                                            focusedMenuItem(
                                                controller:
                                                cubit.pricingController,
                                                text: 'more',
                                                icon: Icons
                                                    .monetization_on_outlined,
                                                context: context,
                                                id: 5),
                                          ],
                                        ),
                                        border: InputBorder.none,
                                        hintText: 'Pricing',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    )
                  ],
                  onPageChanged: (int index) {
                    cubit.changeIsLast(index);
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 30, end: 30, bottom: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: SmoothPageIndicator(
                        controller: cubit.pageController,
                        count: 2,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.grey[800]!,
                          expansionFactor: 3,
                          dotColor: Colors.grey,
                          dotHeight: 6,
                        ),
                      ),
                    ),
                    Spacer(),
                    FloatingActionButton(
                        backgroundColor: Colors.grey,
                        onPressed: () async {
                          if (cubit.isLast) {
                            CacheHelper.setData(key: 'setupDone', value: true)
                                .then((value) async {
                              cubit.workerSetUp(
                                  api_token: token!,
                                  category_id:
                                  categoryId != null ? categoryId : null,
                                  lat: cubit.position != null
                                      ? cubit.position!.latitude
                                      : null,
                                  lng: cubit.position != null
                                      ? cubit.position!.longitude
                                      : null,
                                  address: cubit.addressController.text??'no address',
                                  job_title: cubit.jobitle.text != null
                                      ? cubit.jobitle.text
                                      : null,
                                  job_description:
                                  cubit.jobDiscription.text != null
                                      ? cubit.jobDiscription.text
                                      : null,
                                  gender: cubit.genderController.text != null
                                      ? cubit.genderController.text
                                      : null,
                                  filePath: cubit.profile != null
                                      ? cubit.profile!.path:null
                              );
                              print(await CacheHelper.getData(key: 'token'));
                            });
                          } else {
                            cubit.pageController.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )),
                  ],
                ),
              )
            ],
          )
              , fallback: (context)=>Center(child: CircularProgressIndicator(),)),
        );
      },
    );
  }
}
// Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkerLatOut()));
