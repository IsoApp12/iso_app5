import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:flash/flash.dart';
import 'package:iso_app_5/modules/customer/customer_tracking.dart';

import 'package:iso_app_5/modules/registration/login.dart';
import 'package:iso_app_5/modules/worker/workerLayOutScreens/profile.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';
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
          //
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
          ,position: LatLng(38.9071932,-77.0368727)
          ,onTap: (){

          }
          ,infoWindow: InfoWindow(
            title: 'cairo ,nasr city 6th street ',
            snippet: 'click here for more details',
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                 elevation: 5.0,

                   backgroundColor: Colors.white.withOpacity(.0000000000000001),
                    duration: Duration(seconds: 10),
                    content:Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                     
                        borderRadius: BorderRadius.circular(10)
                      ),
                      height: 80,
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                CircleAvatar(radius: 30,backgroundColor: Colors.blue,),
                                CircleAvatar(backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.qyUk3-mfQGIGBUlcjKYJygHaG6?pid=ImgDet&rs=1'),radius: 29,),

                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(height: 70,width: 1,color: Colors.grey[300],),
                          SizedBox(width: 10,),
                          Expanded(child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text('hend shoep',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,)),
                              SizedBox(height: 10,),
                              Text('flutter developer with firebase backend,handling apis abilites and 2years experience',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),

                            ],
                          )),
                          SizedBox(width: 10,),
                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomrTracking()));
                          }, icon: Icon(Icons.location_on,size: 40,color: Colors.white,))


                        ],
                      ),
                    )
                  ));
                   }


          ),


      ));
      markers.add(Marker(markerId:MarkerId('2'),icon:
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
          ,position: LatLng(38.8971932,-77.0368727)
          ,onTap: (){
          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileWorkr()));

          } ));
      markers.add(Marker(
          markerId:MarkerId('3')
          ,icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
          ,position: LatLng(38.1071932,-77.10368727)
          ,onTap: (){
          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileWorkr()));
          } ,


      ));
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
                  zoomControlsEnabled: false,
                  markers: getMarkers(),
                  initialCameraPosition: CameraPosition(

                      target: cubit.latLng!,zoom: 10),
                  onMapCreated: (GoogleMapController controller) {
                    _controller=controller;
                    setMapStyle();


                  },

                ),
                Positioned(
                  top: 80,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: TextFormField(
                  decoration: InputDecoration(

                            filled: true,
                            contentPadding: EdgeInsetsDirectional.only(start: 10),
                            fillColor: Colors.white,
                            border: InputBorder.none,
                        suffixIcon: Icon(IconBroken.Search),
                    label: Text('search')
                  ),
                ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ) ,
                                      child: Center(child: Text('mechanic')),


                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ) ,
                                      child: Center(child: Text('carpenter')),


                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ) ,
                                      child: Center(child: Text('plumber')),


                              ),
                            ),
                          ],
                        )
                      ],
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
