import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iso_app_5/modules/customer/search_screen.dart';
import 'package:iso_app_5/shared/component/widgets/blocks.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<ServicesBlocCustomer,ServicesStatesCustomer>(
          listener: (context,state){},
          builder: (context,state){
            var cubit=ServicesBlocCustomer.get(context);
            return SafeArea(
              child: Scaffold(
                   body: GridView.builder(

                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2
                         ,mainAxisSpacing: 10
                         ,crossAxisSpacing: 10),
                     itemBuilder:(BuildContext context,int index)=>categoryItem(context:context,index:index,categoryModel:cubit.catItem!,images: cubit.iamges),
                     itemCount: cubit.catItem!.categories!.length,

                   ),
              ),
            );
          },
        );

  }


}
