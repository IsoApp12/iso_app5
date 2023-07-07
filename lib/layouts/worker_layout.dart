import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/models/back_end/worker/getProfile.dart';
import 'package:iso_app_5/modules/registration/login.dart';
import 'package:iso_app_5/modules/registration/set_up_account_provider.dart';
import 'package:iso_app_5/shared/component/widgets/blocks.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:iso_app_5/shared/network/local/cache_helper/cache_helper.dart';
class WorkerLatOut extends StatelessWidget {
  ProfileInfo? profileInfo;
  WorkerLatOut({Key? key,required this .profileInfo}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
      return BlocConsumer<ServicesBlocWorker,ServicesStatesWorker>(
      listener: (context,states){},
      builder: (context,states){
        var cubit=ServicesBlocWorker.get(context);
        cubit.profileInfo=this.profileInfo;
        return SafeArea(
          child: Scaffold(

            key: scaffoldKey,

            drawer: Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                height: 600,
                child: Drawer(
                  clipBehavior: Clip.antiAlias,
                  backgroundColor: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(top: 60,start: 20,end: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SetUpWorker()));
                          },
                          child: Row(
                            children: [
                              Expanded(child: Text('Update profile data',style: TextStyle(color: Colors.white),)),
                              Spacer(),
                              Icon(IconBroken.Setting,color: Colors.white,)
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        itemSeparator(),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            CacheHelper.removeData(key: 'token').then((value) {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(child: Text('Log Out',style: TextStyle(color: Colors.white),)),
                              Spacer(),
                              Icon(IconBroken.Logout,color: Colors.white,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ),
            appBar: AppBar(
                actions: [
                  IconButton(onPressed: (){}, icon: Icon(IconBroken.Message,color: Colors.blueGrey,)),
                  IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification,color: Colors.blueGrey,)),
                ],
                leading: MaterialButton(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:cubit.profileInfo != null ?
                    NetworkImage(cubit.profileInfo!.provider!.imageurl!):
                    NetworkImage(
                        'https://th.bing.com/th/id/OIP.v4fJOAuz1Jx4wirUYOrn7AHaE8?pid=ImgDet&w=1024&h=683&rs=1') as ImageProvider,
                  ),
                  onPressed: () {
                     scaffoldKey.currentState!.openDrawer();
                  },
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text(
                  '${cubit.appBarTitels[cubit.currentIndex]}',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            body:cubit. screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.black54,
              selectedItemColor:  Colors.black54,
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(IconBroken.Chart),label: 'Orders'),
                BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: 'chats'),
                BottomNavigationBarItem(icon: Icon(IconBroken.Profile),label: 'profile'),
                      ],
              onTap: (int x){
                cubit.changenavBar(x);
              },

            ),
          ),
        );
      },
    );
  }
}
