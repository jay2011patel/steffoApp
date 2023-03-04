import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stefomobileapp/ui/common.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:http/http.dart' as http;
import '../Models/order.dart';
import '../ui/cards.dart';
import 'RequestPage.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return HomeContent();
    throw UnimplementedError();
  }

}

class HomeContent extends StatefulWidget{
  const HomeContent({super.key});
  final selected = 0;
  @override
  State<HomeContent> createState()=> _HomePageState(selected);
}


class _HomePageState extends State<HomeContent>{

  var _selected=0;
  String? _id;

  _HomePageState(int val){
    _selected = val;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Home"),
      body:  HomePageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('/placeorder');
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

            if(index==1){
              Navigator.of(context).popAndPushNamed('/inventory');
            }

            if(index==2){
              Navigator.of(context).popAndPushNamed('/dealer');           }

          });
        },
      )
      );
    throw UnimplementedError();
  }

  String? id ="";

  List<Order> requestList= [];
  List<Order> orderList=[];

  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var m = id;
    id = await prefs.getString('user_id');

    if(m!=id){

      final res = await http.post(
        Uri.parse("http://10.0.2.2:3000/orders/getpndgorders"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "id": id!
        }),
      );
      var responseData = jsonDecode(res.body);
      print(responseData);

      for(int i = 0;i<responseData["data"].length;i++){
        Order req = Order();
        req.reciever_id = responseData["data"][i]["reciever_id"];
        req.user_id = responseData["data"][i]["user_id"];
        req.status = responseData["data"][i]["status"];
        req.party_name = responseData["data"][i]["party_name"];
        req.order_date = responseData["data"][i]["createdAt"];
        req.base_price = responseData["data"][i]["base_price"];
        req.order_id = responseData["data"][i]["id"].toString();
        //print(req);
        if(req.status != "Rejected" )  {
          orderList.add(req);
        }
        if(req.status=="Pending" && id == req.reciever_id) {
          requestList.add(req);
        }

      }
      setState(() {});

    }
  }
  Widget HomePageBody(){
    loadData();
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
          child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height*0.36,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(child: Text("Id: $id" ,style: TextStyle(fontFamily: "Poppins_Bold"),)),
                        Container(
                          child: ListView.builder(
                            itemCount: orderList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                              return InkWell(
                                  onTap: (){
                                    Navigator.of(context).pushNamed("/order");
                                  },
                                  child:orderCard(context,orderList[index]));
                            },
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            child: buttonStyle("View More +", () {
                              Navigator.of(context).pushNamed('/orders');
                            }))


                      ],
                    ),
                  )
              ),
              Container(
                  height: MediaQuery.of(context).size.height*0.36,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(child: Text("Request",style: TextStyle(fontFamily: "Poppins_Bold"),)),
                        Container(
                          child: ListView.builder(
                            itemCount: requestList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                              return orderRequestCard(context,requestList[index],(){
                                requestList.removeAt(index);
                                setState(() {

                                });
                              });
                            },
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            child: buttonStyle("View More +", () {
                              Navigator.of(context).popAndPushNamed('/orderreq');
                            }))


                      ],
                    ),
                  )
              ),
              ],
          ),
        )
    );
  }



}