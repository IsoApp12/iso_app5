import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iso_app_5/shared/component/widgets/blocks.dart';
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

    return BlocConsumer<ServicesBlocCustomer,ServicesStatesCustomer>(
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
                        target: cubit.latLng!,zoom: 8),
                    onMapCreated: (GoogleMapController controller) {
                      _controller=controller;
                      setMapStyle();


                    },

                  ),
                  CarouselSlider.builder(
                    itemBuilder: (context,index,x)=> homeCatItem(index:index,context:context,categoryModel:cubit.catItem!),
                    itemCount: cubit.catItem!.categories!.length,
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
