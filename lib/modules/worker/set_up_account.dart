import 'package:flutter/material.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:iso_app_5/modules/worker/worker_layout.dart';
import 'package:iso_app_5/shared/component/widgets/widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class SetUp extends StatefulWidget {
  SetUp({Key? key}) : super(key: key);

  @override
  State<SetUp> createState() => _SetUpState();
}

class _SetUpState extends State<SetUp> {
TextEditingController jobitle=TextEditingController();

TextEditingController jobDiscription=TextEditingController();

  FocusedMenuHolderController categoriesHolderController=FocusedMenuHolderController();

  PageController pageController=PageController();

  List <Widget> pageView=[
    Center(
        child:
        Padding(
          padding: const EdgeInsetsDirectional.only(top:40,bottom: 40,start: 30,end:30),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:NetworkImage('https://th.bing.com/th/id/OIP.v4fJOAuz1Jx4wirUYOrn7AHaE8?pid=ImgDet&w=1024&h=683&rs=1') ,
                      ),
                      IconButton(icon:Icon(Icons.camera_alt) ,onPressed: (){},)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text('NAME ...',style: TextStyle(fontSize: 24,color: Colors.black54)),
                  SizedBox(height: 20,),
                  Container(
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding:EdgeInsets.all(13.0) ,
                    height: 45,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'job title...',

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding:EdgeInsetsDirectional.only(start: 20,top: 10,end: 20,bottom: 10) ,
                    height: 100,
                    child: TextField(
                      maxLines: 4,

                      decoration: InputDecoration(

                        border: InputBorder.none,
                        hintText: 'job discrpipton...',

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding:EdgeInsetsDirectional.only(start: 20,top: 10,end: 20,bottom: 10) ,
                    height: 70,
                    child: TextField(
                      maxLines: 4,

                      decoration: InputDecoration(

                        border: InputBorder.none,
                        hintText: 'Experiences',

                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    ),
    Center(child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 40,top: 40,start: 30,end: 30),
      child: Container(

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),

        ),
        padding: EdgeInsetsDirectional.only(start: 20,top: 30,end: 20,bottom: 10),
        child: SingleChildScrollView(child:Column(
          children: [
            Container(
              width: 330,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)
              ),
              padding:EdgeInsetsDirectional.only(top: 10,start: 20,end: 15,bottom: 10) ,
              height: 45,
              child: TextFormField(

                decoration: InputDecoration(
                  suffixIcon:  FocusedMenuHolder(
                    widthBorder: 80,
                    blurSize: 0.0,
                    onPressed: (){},
                    openWithTap: true,
                    child: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
                    menuItems: [
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('Crafts'),trailingIcon: Icon(Icons.handyman,color: Colors.brown[500],)),
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('medical'),trailingIcon: Icon(Icons.local_pharmacy_outlined,color: Colors.cyan,)),
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('transportation'),trailingIcon: Icon(Icons.car_rental,color: Colors.limeAccent,)),
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('lawyers'),trailingIcon: Icon(Icons.account_balance_outlined,color: Colors.black,)),
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('electronics'),trailingIcon: Icon(Icons.electrical_services_outlined,color: Colors.deepPurpleAccent,)),
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('clothes'),trailingIcon: Icon(Icons.umbrella,color: Colors.yellow,)),
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('pharmacies'),trailingIcon: Icon(Icons.local_pharmacy_outlined,color: Colors.blue,)),
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('stationaries'),trailingIcon: Icon(Icons.note_alt_outlined,color: Colors.brown[700],)),


                    ],
                  ),
                  border: InputBorder.none,
                  hintText: 'Categories',

                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 330,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)
              ),
              padding:EdgeInsetsDirectional.only(top: 10,start: 20,end: 15,bottom: 10) ,
              height: 45,
              child: TextFormField(

                decoration: InputDecoration(
                  suffixIcon:  FocusedMenuHolder(
                    blurSize: 0.0,
                    onPressed: (){},
                    openWithTap: true,
                    child: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
                    menuItems: [
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('male'),trailingIcon: Icon(Icons.male,color: Colors.brown[500],)),
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('female'),trailingIcon: Icon(Icons.female,color: Colors.cyan,)),



                    ],
                  ),
                  border: InputBorder.none,
                  hintText: 'Gender',

                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 330,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)
              ),
              padding:EdgeInsetsDirectional.only(top: 12,start: 20,end: 15,bottom: 13) ,
              height: 45,
              child: TextFormField(

                decoration: InputDecoration(
                  suffixIcon: IconButton(icon:Icon(Icons.location_on,color: Colors.greenAccent,),onPressed: (){},),
                  border: InputBorder.none,
                  hintText: 'location',

                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 330,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)
              ),
              padding:EdgeInsetsDirectional.only(top: 10,start: 20,end: 15,bottom: 10) ,
              height: 45,
              child: TextFormField(

                decoration: InputDecoration(
                  suffixIcon:  FocusedMenuHolder(
                    blurSize: 0.0,
                    onPressed: (){},
                    openWithTap: true,
                    child: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
                    menuItems: [
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('company'),trailingIcon: Icon(Icons.people,color: Colors.brown[500],)),
                      FocusedMenuItem(
                          onPressed: (){},
                          title: Text('self_employed'),trailingIcon: Icon(Icons.person,color: Colors.cyan,)),



                    ],
                  ),
                  border: InputBorder.none,
                  hintText: 'account type',

                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 330,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)
              ),
              padding:EdgeInsetsDirectional.only(top: 10,start: 20,end: 15,bottom: 10) ,
              height: 45,
              child: TextFormField(

                decoration: InputDecoration(
                  suffixIcon:
                  FocusedMenuHolder(
                    openWithTap: true,
                    child: Icon(Icons.arrow_drop_down_outlined),
                    onPressed:(){} ,
                    menuItems: [
                      FocusedMenuItem(
                          title: Text('less hundred'),

                          onPressed: ()=>print('pressed')),
                      FocusedMenuItem(
                          title: Text('less 1k'),

                          onPressed: ()=>print('pressed')
                      ),
                      FocusedMenuItem(
                          title: Text('less 10k'),

                          onPressed: ()=>print('pressed')
                      ),
                      FocusedMenuItem(
                          title: Text('less 10k'),

                          onPressed: ()=>print('pressed')
                      ),
                      FocusedMenuItem(
                          title: Text('less 50k'),

                          onPressed: ()=>print('pressed')
                      ),
                      FocusedMenuItem(
                          title: Text('more'),

                          onPressed: ()=>print('pressed')
                      ),

                    ],




                  ),
                  border: InputBorder.none,
                  hintText: 'Pricing',

                ),
              ),
            ),
          ],
        ),
      ),
    )) ,
    )];

  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller:pageController ,
             itemBuilder: (context,index)=>pageView[index],
              itemCount: pageView.length,
              onPageChanged: (int index){
                if(index==pageView.length-1){
                  setState((){
                  isLast= true;
                  });
                }else{
                   isLast=false;
                }

              },

            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 30,end: 30,bottom: 20),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.all( 20),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: pageView.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor:Colors.grey[800]!,
                    expansionFactor: 3,
                    dotColor: Colors.grey,
                    dotHeight: 6,

                  ),
                ),
              ),
              Spacer(),
              FloatingActionButton(
                  backgroundColor: Colors.grey,

                  onPressed: (){
                    if(isLast){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkerLaout()));

                    }else{
                      pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                    }
                  },
                  child:Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
              ),
            ],),
          )
        ],
      ),


    );
  }
}
