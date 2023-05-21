import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iso_app_5/modules/customer/search_screen.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocCustomer,StatesServicesCustomers>(
      listener: (context,states){},
      builder: (context,states){
        var cubit=ServicesBlocCustomer.get(context);
     return   BlocConsumer<ServicesBlocCustomer,StatesServicesCustomers>(
          listener: (context,state){},
          builder: (context,state){
            return SafeArea(
              child: Scaffold(
                   body: GridView.builder(

                       gridDelegate:
                       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
                       itemBuilder: (context,index)=>GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                         },
                         child: Container(
                           height: 200,
                           width: 200,
                           margin: EdgeInsets.symmetric(vertical: 10.0),
                           padding: EdgeInsets.all(10.0),
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(10.0),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.grey.withOpacity(0.5),
                                 spreadRadius: 2,
                                 blurRadius: 5,
                                 offset: Offset(0, 3),
                               ),
                             ],
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Container(

                                   width: double.infinity,
                                   height: 120,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(35.0),

                                   ),
                                   child:Container(
                                     clipBehavior: Clip.antiAlias,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10)
                                     ),
                                     child: Image(

                                       fit: BoxFit.cover,
                                       image: NetworkImage(
                                         'https://picsum.photos/id/237/200/300',
                                       ),),
                                   )
                               ),

                               SizedBox(width: 10.0),
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       'Category Name',
                                       style: TextStyle(
                                         fontSize: 18.0,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                     SizedBox(height:5.0),
                                     Text(
                                       'Description of the category',
                                       overflow: TextOverflow.ellipsis,
                                       maxLines: 3,
                                       style: TextStyle(
                                         fontSize: 14.0,
                                         color: Colors.grey[600],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       )),
              ),
            );
          },
        );
      },
    );
  }
}
