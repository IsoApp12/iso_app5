
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class WorkerLatOut extends StatelessWidget {
  const WorkerLatOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<ServicesBlocWorker,ServicesStatesWorker>(
      listener: (context,states){},
      builder: (context,states){
        var cubit=ServicesBlocWorker.get(context);
        return SafeArea(
          child: Scaffold(
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
