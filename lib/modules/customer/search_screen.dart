import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/profile.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/blocs/bloc_services_worker.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_customer.dart';
import 'package:iso_app_5/shared/network/local/bloc/states/states_services_worker.dart';
class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
TextEditingController addressController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Set <Marker>getMarkers(){
      Set <Marker> markers=Set();
      markers.add(Marker(markerId:MarkerId('1'),icon:
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
          ,position: LatLng(38.9071932,-77.0368727)
          ,onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileWorkr()));
          } ));
      markers.add(Marker(markerId:MarkerId('2'),icon:
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
          ,position: LatLng(38.8971932,-77.0368727)
          ,onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileWorkr()));
          } ));
      markers.add(Marker(markerId:MarkerId('3'),icon:
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
          ,position: LatLng(38.1071932,-77.10368727)
          ,onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileWorkr()));
          } ));
      return markers;

    }
    GoogleMapController? _controller ;
    Future<String> loadMapStyle(String mapStyle)async{
      return await DefaultAssetBundle.of(context)
          .loadString(mapStyle);
    }
    setMapStyle()async{
      String mapStyle=await loadMapStyle('assets/light.json');
      _controller!.setMapStyle(mapStyle);
    }
    return BlocConsumer<ServicesBlocCustomer,ServicesStatesCustomer>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ServicesBlocCustomer.get(context);
        return Scaffold(
          body:   ConditionalBuilder(
            builder:(context)=>Stack(
              children: [
                GoogleMap(
                  markers: getMarkers(),
                  initialCameraPosition: CameraPosition(

                      target: cubit.latLng!,zoom: 15),
                  onMapCreated: (GoogleMapController controller) {
                    _controller=controller;
                    setMapStyle();


                  },

                ),
                Positioned(child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none
                  ),
                ))
              ],
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
