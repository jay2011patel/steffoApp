import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../UI/common.dart';
import '../ui/cards.dart';
import '../ui/custom_tabbar.dart';


class OrdersPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return OrdersContent();
    throw UnimplementedError();
  }

}

class OrdersContent extends StatefulWidget{
  const OrdersContent({super.key});
  final selected = 0;
  @override
  State<OrdersContent> createState()=> _OrdersPageState();
}


class _OrdersPageState extends State<OrdersContent>{

  var _selected=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Orders"),
        body: OrdersPageBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

            Navigator.of(context).popAndPushNamed('/challanlist');

          },
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
                icon: const Icon(Icons.inventory_2_rounded,),
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
                Navigator.of(context).popAndPushNamed('/inventory');
              }


              if(index==2){
                Navigator.of(context).popAndPushNamed('/dealer');              }

            });
          },
        )
    );
    throw UnimplementedError();
  }

  Widget OrdersPageBody(){
    return Container(
      height: MediaQuery.of(context).size.height,

      decoration: BoxDecoration(
          gradient: LinearGradient(
              transform: GradientRotation(1.07),
              colors: [
                Color.fromRGBO(75, 100, 160, 1.0),
                Color.fromRGBO(19, 59, 78, 1.0),
              ]
          )
      ),
      child: SingleChildScrollView(
        child: Container(
          //margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(vertical: 20),

          width: MediaQuery.of(context).size.width,
          child: CustomTabBar(
            selectedCardColor: Colors.white,
            selectedTitleColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            tabBarItemExtend: ((MediaQuery.of(context).size.width)/2),
            tabBarItems: ["Sales","Purchase"],
            tabViewItems: [
              Container(child: OrderList()),
              Container(child: RegistrationList())
            ],
            tabViewItemHeight: MediaQuery.of(context).size.height*0.7,

          ),
        ),
      ),
    );

  }

  //----------------------------------OrderList---------------------------------

  Widget OrderList(){
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            borderRadius: BorderRadius.circular(8)
        ),
        height: 50,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                  itemCount: 8,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return orderCard(context,index);
                  },
                ),
              ),

            ],
          ),
        )
    );
  }


//------------------------------RegistrationList--------------------------------


  Widget RegistrationList(){
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            borderRadius: BorderRadius.circular(5)
        ),
        height: 50,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return orderCard(context, index);
                  },
                ),
              ),

            ],
          ),
        )
    );
  }





}


//---------------------------------SingleOrderRequestWidget---------------------

Widget orderRequestCard(context,index){

  String org_name=" Bhuyangdev Steel Corporation";


  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
    ),
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(child: Text("Order Details",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Poppins_Bold"),)),
            Container(
                width: MediaQuery.of(context).size.width-200,
                child: IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt_rounded,color: Colors.green,))),
            IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down_alt_rounded,color: Colors.red,))
          ],
        ),
        Container(
          child: Row(
            children: [

              Container(
                child: Text("Org Name:",style: TextStyle(fontFamily: "Roboto"),),
                padding: EdgeInsets.symmetric(vertical: 5),
              ),

              Expanded(child: Text(org_name,overflow: TextOverflow.ellipsis,maxLines: 3,))
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Text("Order Date:"),
              Text(" 22-02-2023")
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Text("Credit Due:"),
              Text(" 1234567890")
            ],
          ),
        )

      ],
    ),
  );
}


//-------------------------------SingleRegistrationRequest----------------------

Widget RegistrationRequestCard(context,index){

  String org_name=" Bhuyangdev Steel Corporation";
  var region = ['Ahmedabad','Mehsana','Anand'];

  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
    ),
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(child: Text("Entity Details",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Poppins_Bold"),)),
            Container(
                width: MediaQuery.of(context).size.width-200,
                child: IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt_rounded,color: Colors.green,))),
            IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down_alt_rounded,color: Colors.red,))
          ],
        ),
        Container(
          child: Row(
            children: [

              Container(
                child: Text("Org Name:",style: TextStyle(fontFamily: "Roboto"),),
                padding: EdgeInsets.symmetric(vertical: 5),
              ),

              Expanded(child: Text(org_name,overflow: TextOverflow.ellipsis,maxLines: 3,))
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Text("Region:"),
              Text(region[index])
            ],
          ),
        ),

      ],
    ),
  );
}



