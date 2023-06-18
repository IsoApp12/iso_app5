
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/modules/registration/set_up_account_provider.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class WorkerLatOut extends StatelessWidget {
  WorkerLatOut({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
      return BlocConsumer<ServicesBlocWorker,ServicesStatesWorker>(
      listener: (context,states){},
      builder: (context,states){
        var cubit=ServicesBlocWorker.get(context);

        return SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            drawer: Drawer(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 25,start: 10,),
                child: Column(
                  children: [
                    InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SetUpWorker()));
                    },
                      child: Row(
                        children: [
                          Expanded(child: Text('Update profile data')),
                          Spacer(),
                          Icon(IconBroken.Setting)
                        ],
                      ),
                    )
                  ],
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
                    backgroundImage:
                    NetworkImage('https://th.bing.com/th/id/OIP.qyUk3-mfQGIGBUlcjKYJygHaG6?pid=ImgDet&rs=1'),
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
                BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: 'Home'),

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
