import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/layouts/worker_layout.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';

import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SetUpWorker extends StatefulWidget {
  SetUpWorker ({Key? key}) : super(key: key);

  @override
  State<SetUpWorker> createState() => _SetUpWorkerState();
}

class _SetUpWorkerState extends State<SetUpWorker> {
  @override
  Widget build(BuildContext context) {
    TextEditingController jobitle=TextEditingController();
    TextEditingController jobDiscription=TextEditingController();
    TextEditingController nameController=TextEditingController();
    TextEditingController categoryController=TextEditingController();
    TextEditingController accountTypeController=TextEditingController();
    TextEditingController genderController=TextEditingController();
    TextEditingController addressController=TextEditingController();
    TextEditingController pricingController=TextEditingController();
    TextEditingController jobExperience=TextEditingController();
    PageController pageController=PageController();
    List <Widget>pageView=[
      Center(
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
                        controller: jobitle,
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
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),

                      height: 100,
                      child: TextField(
                        maxLines: 4,
                        controller: jobDiscription,
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
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      width: 330,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),

                      height: 70,
                      child: TextField(
                        controller: jobExperience,
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
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      height: 45,
                      child: TextFormField(
                        controller: categoryController,
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
                              focusedMenuItem(context:context,controller:categoryController,icon:IconBroken.Work,text:'crafts'),
                              focusedMenuItem(context:context,controller:categoryController,icon:Icons.local_pharmacy_rounded,text:'medical'),
                              focusedMenuItem(context:context,controller:categoryController,icon:IconBroken.Danger,text:'electrical'),
                              focusedMenuItem(context:context,controller:categoryController,icon:Icons.account_balance_sharp,text:'Lawyers'),
                              focusedMenuItem(context:context,controller:categoryController,icon:Icons.laptop,text:'programmer'),
                              focusedMenuItem(context:context,controller:categoryController,icon:Icons.handyman,text:'crafts'),
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
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      height: 45,
                      child: TextFormField(
                        controller: genderController,
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
                             focusedMenuItem(controller: genderController, text: 'male', icon: Icons.male, context: context),
                             focusedMenuItem(controller: genderController, text: 'female', icon: Icons.female_outlined, context: context),
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
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      height: 45,
                      child: TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              IconBroken.Location,
                              color: Colors.greenAccent,
                            ),
                            onPressed: () {},
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
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      height: 45,
                      child: TextFormField(
                        controller: accountTypeController,
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
                              focusedMenuItem(controller: accountTypeController, text: 'company', icon: IconBroken.User1, context: context),
                              focusedMenuItem(controller: accountTypeController, text: 'self_employed', icon: Icons.person_2_outlined, context: context),

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
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsetsDirectional.only(
                          top: 10, start: 20, end: 15, bottom: 10),
                      height: 45,
                      child: TextFormField(
                        controller:pricingController ,
                        decoration: InputDecoration(
                          suffixIcon: FocusedMenuHolder(
                            openWithTap: true,
                            child: Icon(IconBroken.Arrow___Down_2,color: Colors.black,),
                            onPressed: () {},
                            menuItems: [
                              focusedMenuItem(controller: pricingController, text: 'less 1k', icon: Icons.monetization_on_outlined, context: context),
                              focusedMenuItem(controller: pricingController, text: 'less 5k', icon: Icons.monetization_on_outlined, context: context),
                              focusedMenuItem(controller: pricingController, text: 'less 10k', icon: Icons.monetization_on_outlined, context: context),
                              focusedMenuItem(controller: pricingController, text: 'less 50k', icon: Icons.monetization_on_outlined, context: context),
                              focusedMenuItem(controller: pricingController, text: 'more', icon: Icons.monetization_on_outlined, context: context),

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
    ];
    return BlocConsumer<ServicesBlocRegistration,RegistrationStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ServicesBlocRegistration.get(context);
        return Scaffold(

          backgroundColor: Colors.grey[300],
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller:pageController ,
                  children: pageView,
                  onPageChanged: (int index){
                    if(index==pageView.length-1){
                    cubit.changeIsLast();
                    }
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 30,end: 30,bottom: 20),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.all( 20),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: pageView.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor:Colors.grey[800]!,
                        expansionFactor: 3,
                        dotColor: Colors.grey,
                        dotHeight: 6,

                      ),
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                      backgroundColor: Colors.grey,

                      onPressed: (){
                        if(cubit.isLast){
                         CacheHelper.setData(key: 'setupDone', value: true)
                             .then((value) {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkerLatOut()));
                         });

                        }else{
                          pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                        }
                      },
                      child:Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                  ),
                ],),
              )
            ],
          ),


        );
      }
      ,

    );
  }
}
