import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stefomobileapp/pages/HomePage.dart';
import 'package:stefomobileapp/pages/InventoryPage.dart';
import 'package:stefomobileapp/pages/ProfilePage.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:http/http.dart' as http;
import '../ui/common.dart';

void main(){
  runApp(DealerPage());
}

class DealerPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:DealerContent());
    throw UnimplementedError();
  }

}

class DealerContent extends StatefulWidget{
  const DealerContent({super.key});
  @override
  State<DealerContent> createState()=> _DealerPageState();
}


class _DealerPageState extends State<DealerContent>{

  var _selected=2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Dealer",(){
          Navigator.pop(context);
        }),
        body: DealerPageBody(),
        bottomNavigationBar: StylishBottomBar(
          option: AnimatedBarOptions(
            iconSize: 30,
            //barAnimation: BarAnimation.liquid,
            iconStyle: IconStyle.simple,
            opacity: 0.3,
          ),

          items: [
            BottomBarItem(
              icon: const Icon(Icons.home_filled,),
              title: const Text('Abc'),
              backgroundColor: Colors.red,
              selectedIcon: const Icon(Icons.home_filled,color:Colors.blueAccent),
            ),
            BottomBarItem(
                icon: const Icon(Icons.inventory_2_rounded),
                title: const Text('Safety'),
                backgroundColor: Colors.orange,
                selectedIcon: const Icon(Icons.inventory_2_rounded,color:Colors.blueAccent)
            ),
            BottomBarItem(
                icon: const Icon(Icons.warehouse_rounded,),
                title: const Text('Safety'),
                backgroundColor: Colors.orange,
                selectedIcon: const Icon(Icons.warehouse_rounded,color:Colors.blueAccent)
            ),
            BottomBarItem(
                icon: const Icon(Icons.person_pin,),
                title: const Text('Cabin'),
                backgroundColor: Colors.purple,
                selectedIcon: const Icon(Icons.person_pin,color:Colors.blueAccent)
            ),
          ],
          //fabLocation: StylishBarFabLocation.center,
          hasNotch: false,
          currentIndex: _selected,
          onTap: (index) {
            setState(() {

              if(index==0){
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => HomePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              if(index==1){
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => InventoryPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              if(index==3){
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => ProfilePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

            });
          },
        )
    );
    throw UnimplementedError();
  }
  loadChildData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = await prefs.getString('id');
    var userType = await prefs.getString('userType');
    String uri;
    uri = "http://urbanwebmobile.in/steffo/getchildren.php";

    var res = await http.post(
      Uri.parse(uri),
      body: {
        "id":id,
      }
    );

    var responseData = json.decode(res.body);
    print(responseData);

  }
  Widget DealerPageBody(){
    loadChildData();
    return Container(
      height: 160,
      margin: EdgeInsets.only(top: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        elevation: 15,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width,
                child: Text("Distributor",style: GoogleFonts.lato(),textAlign: TextAlign.left,))
          ],
        )
      ),
    );
  }

}