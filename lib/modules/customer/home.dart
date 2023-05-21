import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
class HomeCustomer extends StatefulWidget {
  const HomeCustomer({Key? key}) : super(key: key);

  @override
  State<HomeCustomer> createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer> {
   GoogleMapController? _controller ;
  Future<String> loadMapStyle(String mapStyle)async{
     return await DefaultAssetBundle.of(context)
         .loadString(mapStyle);
   }
   setMapStyle()async{
    String mapStyle=await loadMapStyle('assets/light.json');
     _controller!.setMapStyle(mapStyle);
   }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ServicesBlocCustomer,StatesServicesCustomers>(
      listener: (context,states){
        if(states is ChangeLatLngSuccess){
          print(ServicesBlocCustomer.get(context).latLng);
        }
      },
      builder: (context,states){
        var cubit=ServicesBlocCustomer.get(context);

        return SafeArea(
          child: Scaffold(
            body:ConditionalBuilder(
              builder: (context)=>Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: cubit.latLng!,zoom: 15),
                    onMapCreated: (GoogleMapController controller) {
                      _controller=controller;
                      setMapStyle();


                    },

                  ),
                  CarouselSlider.builder(
                    itemBuilder: (context,index,x)=> Container(
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
                    itemCount: 10,
                    disableGesture: false,
                    options: CarouselOptions(
                        viewportFraction: .5,
                        autoPlay: false,
                        scrollDirection: Axis.horizontal,
                        initialPage: 1,
                        reverse: true
                    ),
                  ),
                  Positioned(
                      top:80 ,
                      left: 80,
                      right: 80,
                      child: Container(

                        height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),)],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),

                    ),
                    child: Center(child: Text('your availabe stuff',style: TextStyle(color: Colors.black,fontSize: 20),)),
                  ))
                ],
              ),
              condition: cubit.latLng!=null,
              fallback: (context)=>
                  Center(child: OutlinedButton(
                    child: Center(child: Text('Turn on your location'),),
                    onPressed: (){
                      ServicesBlocCustomer.get(context).enablePermission(context);
                    },
                  ),),
            )

              ));

      },
    );
  }
}
