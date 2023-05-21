import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GoogleMapController? _controller ;
    Future<String> loadMapStyle(String mapStyle)async{
      return await DefaultAssetBundle.of(context)
          .loadString(mapStyle);
    }
    setMapStyle()async{
      String mapStyle=await loadMapStyle('assets/light.json');
      _controller!.setMapStyle(mapStyle);
    }
    return BlocConsumer<ServicesBlocCustomer,StatesServicesCustomers>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ServicesBlocCustomer.get(context);
        return Scaffold(
          body:   ConditionalBuilder(
            builder:(context)=>GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: cubit.latLng!,zoom: 15),
              onMapCreated: (GoogleMapController controller) {
                _controller=controller;
                setMapStyle();


              },

            ) ,
            fallback:(context)=>Center(child: TextButton(child:Text('open your location'),onPressed: (){
              ServicesBlocCustomer.get(context).enablePermission(context);
            },),) ,
            condition: cubit.latLng !=null,
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsetsDirectional.only(top: 25,start: 25),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                backgroundColor: Colors.blueGrey,
                child: Icon(IconBroken.Arrow___Left_Circle),
              ),
            ),
          ),
        );
      },
    );
  }
}
