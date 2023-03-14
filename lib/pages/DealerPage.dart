import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../ui/common.dart';


class DealerPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return DealerContent();
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
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          fabLocation: StylishBarFabLocation.center,
          hasNotch: false,
          currentIndex: _selected,
          onTap: (index) {
            setState(() {

              if(index==0){
                Navigator.of(context).popAndPushNamed('/home');
              }

              if(index==1){
                Navigator.of(context).popAndPushNamed('/inventory');              }

            });
          },
        )
    );
    throw UnimplementedError();
  }

  Widget DealerPageBody(){
    return Container(

    );
  }

}