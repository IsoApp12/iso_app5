import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:iso_app_5/modules/worker/worker_layout.dart';
import 'package:iso_app_5/shared/network/local/bloc/bloc_services.dart';
import 'package:iso_app_5/shared/network/local/bloc/states_services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SetUp extends StatelessWidget {
TextEditingController jobitle=TextEditingController();

TextEditingController jobDiscription=TextEditingController();

  FocusedMenuHolderController categoriesHolderController=FocusedMenuHolderController();

  PageController pageController=PageController();





  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBloc,ServicesStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(

          backgroundColor: Colors.grey[300],
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller:pageController ,
                  itemBuilder: (context,index)=>ServicesBloc.get(context).getPageView(context)[index],
                  itemCount: ServicesBloc.get(context).getPageView(context).length,
                  onPageChanged: (int index){
                  ServicesBloc.get(context).  changeIsLast(context,index);
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
                      count: ServicesBloc.get(context).getPageView(context).length,
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
                        if(ServicesBloc.get(context).isLast){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkerLaout()));

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
