import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/modules/worker/create_post.dart';
import 'package:iso_app_5/shared/component/widgets/blocks.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';

class HomeWorker extends StatelessWidget {
  HomeWorker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBlocWorker,ServicesStatesWorker>(
        listener: (context,state){},
        builder: (context,state){

          List <TextEditingController> controllers=
          List.generate(10, (index) => TextEditingController());
          return Scaffold(

            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius:5
                            )
                          ]
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Post()));

                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(height: 120,decoration: BoxDecoration(color: Colors.white,boxShadow:[BoxShadow(color: Colors.grey)]),),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 80,
                                       decoration: BoxDecoration(
                                         color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20)
                                       ),
                                       child: Center(
                                         child: GestureDetector(
                                           onTap: (){
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Post()));

                                           },
                                           child: TextField(
                                             enabled: false,
                                             decoration: InputDecoration(
                                               hintText: 'create post',
                                               border: InputBorder.none,
                                               contentPadding: EdgeInsetsDirectional.only(start: 20)
                                             ),
                                           ),
                                         ),
                                       ),
                                      ),
                                    ),
                                    MaterialButton(
                                      padding: EdgeInsets.all(0.0),
                                        onPressed: (){}, child: Icon(IconBroken.Send,color: Colors.blueGrey,))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                    fallback: (context)=>Center(child: CircularProgressIndicator()) ,
                    condition:10 !=1  ,
                    builder: (context)=>ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index)=>postItem(
                            context,
                            controllers[index]
                        )
                        ,
                        separatorBuilder: (context,index)=>Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey[200],
                        ),

                        itemCount: 10),
                  )
                ],
              ),
            )



            ,
          );
        }
    );
  }

}