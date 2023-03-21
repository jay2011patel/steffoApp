import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../ui/common.dart';


class InventoryPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return InventoryContent();
    throw UnimplementedError();
  }

}

class InventoryContent extends StatefulWidget{
  InventoryContent({super.key});
  final selected = 0;
  @override
  State<InventoryContent> createState()=> _InventoryPageState();
}


class _InventoryPageState extends State<InventoryContent>{

  var _selected=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Inventory",(){
          Navigator.pop(context);
        }),
        body: InventoryPageBody(),
        bottomNavigationBar: StylishBottomBar(
          option: AnimatedBarOptions(
            iconSize: 30,
            barAnimation: BarAnimation.fade,
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
                icon: const Icon(Icons.inventory_2_rounded,),
                title: const Text('Safety'),
                backgroundColor: Colors.orange,
                selectedIcon: const Icon(Icons.inventory_2_rounded,color:Colors.blueAccent)
            ),
            BottomBarItem(
                icon: const Icon(Icons.warehouse_rounded,),
                title: const Text('Safety'),
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
                Navigator.of(context).pushReplacementNamed('/home');
              }

              if(index==2){
                Navigator.of(context).pushReplacementNamed('/dealer');
              }

            });
          },
        )
    );
    throw UnimplementedError();
  }

  Widget InventoryPageBody(){
    return Scaffold();
  }

}