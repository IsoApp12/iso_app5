import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/models/back_end/worker/getProfile.dart';
import 'package:iso_app_5/shared/component/constants.dart';
import 'package:iso_app_5/shared/component/widgets/blocks.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/registration_bloc.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/registration_states.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class Orders extends StatelessWidget {
  Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocRegistration,RegistrationStates>(
      listener: (context,states){

      },
      builder: (context,states){
        var cubit=ServicesBlocRegistration.get(context);

        return SafeArea(
          child: Scaffold(
            body:Column(
              children: [
               Expanded(
                 child: ListView.separated(
                     scrollDirection: Axis.vertical,
                     itemBuilder: (context,index)=>cubit.orderItem(cubit.profileInfo!,index,context)
                     , separatorBuilder: (context,index)=>itemSeparator()
                     , itemCount:cubit.profileInfo!.provider!.orders.length ),
               )

              ],
            )

          ),
        );
      },


    ) ;
  }
  // ListView.separated(
  // itemBuilder: (context,index)=> orderItem()
  // , separatorBuilder: (context,index)=>SizedBox(height: 10,)
  // , itemCount: 10),
}


