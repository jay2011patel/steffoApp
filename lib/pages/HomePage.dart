import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stefomobileapp/pages/OrderPage.dart';
import 'package:stefomobileapp/ui/common.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:http/http.dart' as http;
import '../Models/order.dart';
import '../ui/cards.dart';
import 'RequestPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const HomeContent();
    throw UnimplementedError();
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  final selected = 0;
  @override
  State<HomeContent> createState() => _HomePageState(selected);
}

class _HomePageState extends State<HomeContent> {
  var _selected = 0;
  String? _id;
  var fabLoc;

  _HomePageState(int val) {
    _selected = val;
  }
  var user_type;
  void loadusertype() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    user_type = await prefs.getString('userType');
  }

  @override
  Widget build(BuildContext context) {
    loadusertype();
    return Scaffold(
        appBar: appbar("Home",(){
          print("Back Pressed");
          Navigator.pop(context);
        }),
        body: HomePageBody(),
        floatingActionButton: LayoutBuilder(
          builder: (context,constraints) {
            if(user_type != "Manufacturer"){
              //fabLoc = FloatingActionButtonLocation.centerDocked;
              return FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/placeorder');
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.red,
              );
            }else{
              return Container();
            }
        }
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
              icon: const Icon(
                Icons.home_filled,
              ),
              title: const Text('Abc'),
              backgroundColor: Colors.red,
              selectedIcon:
                  const Icon(Icons.home_filled, color: Colors.blueAccent),
            ),
            BottomBarItem(
                icon: const Icon(
                  Icons.inventory_2_rounded,
                ),
                title: const Text('Safety'),
                backgroundColor: Colors.orange,
                selectedIcon: const Icon(Icons.inventory_2_rounded,
                    color: Colors.blueAccent)),
            BottomBarItem(
                icon: const Icon(
                  Icons.warehouse_rounded,
                ),
                title: const Text('Safety'),
                backgroundColor: Colors.orange,
                selectedIcon: const Icon(Icons.warehouse_rounded,
                    color: Colors.blueAccent)),
            BottomBarItem(
                icon: const Icon(
                  Icons.person_pin,
                ),
                title: const Text('Cabin'),
                backgroundColor: Colors.purple,
                selectedIcon:
                    const Icon(Icons.person_pin, color: Colors.blueAccent)),
          ],
          //fabLocation: StylishBarFabLocation.center,
          hasNotch: false,
          currentIndex: _selected,
          onTap: (index) {
            setState(() {
              if (index == 1) {
                Navigator.of(context).pushReplacementNamed('/inventory');
              }

              if (index == 2) {
                Navigator.of(context).pushReplacementNamed('/dealer');
              }
            });
          },
        ));
    throw UnimplementedError();
  }

  String? id = "";

  List<Order> requestList = [];
  List<Order> orderList = [];

  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var m = id;
    id = await prefs.getString('id');

    if (m != id) {
      requestList = [];
      orderList = [];
      final res = await http.post(
        Uri.parse("http://urbanwebmobile.in/steffo/vieworder.php"),
        body: {"id": id!},
      );
      var responseData = jsonDecode(res.body);
      print(responseData);

      for (int i = 0; i < responseData["data"].length; i++) {
        Order req = Order();
        req.reciever_id = responseData["data"][i]["supplier_id"];
        req.user_id = responseData["data"][i]["user_id"];
        req.user_mob_num = responseData["data"][i]["mobileNumber"];
        req.user_name = responseData["data"][i]["firstName"]+" " +responseData["data"][i]["lastName"];
        req.status = responseData["data"][i]["orderStatus"];
        req.party_name = responseData["data"][i]["partyName"];
        req.party_address = responseData["data"][i]["shippingAddress"];
        req.party_mob_num = responseData["data"][i]["partyMobileNumber"];
        req.loading_type = responseData["data"][i]["loadingType"];
        req.order_date = responseData["data"][i]["createdAt"];
        req.base_price = responseData["data"][i]["basePrice"];
        req.order_id = responseData["data"][i]["order_id"].toString();
        //print(req);
        if (req.status != "Denied" && req.status != "Pending") {
          orderList.add(req);
        }
        if (req.status?.trim() == "Pending" && id == req.reciever_id) {
          requestList.add(req);
          print("Added to req list");
        }
      }
      setState(() {});
    }
  }

  Widget HomePageBody() {
    loadData();
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  //height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.5),
                      borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Column(
                    children: [
                      const Center(
                          child: Text(
                        "Orders",
                        style: TextStyle(fontFamily: "Poppins_Bold"),
                      )),
                      Container(
                        height: 220,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            itemCount: orderList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OrderDetails(
                                                order: orderList[index])));
                                  },
                                  child: orderCard(context, orderList[index]));
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextButton(
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text("View All")),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/orders');
                            },
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                  //height: MediaQuery.of(context).size.height*0.36,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.5),
                      borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Column(
                    children: [
                      const Center(
                          child: Text(
                        "Request",
                        style: TextStyle(fontFamily: "Poppins_Bold"),
                      )),
                      Container(
                        height: 240,
                        child: SingleChildScrollView(
                          child: Container(
                            child: ListView.builder(
                              itemCount: requestList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderDetails(
                                                      order:
                                                          requestList[index])));
                                    },
                                    child: orderRequestCard(
                                        context, requestList[index], () {
                                      // orderList.add(requestList[index]);
                                      // requestList.removeAt(index);
                                      id = "none";
                                      loadData();
                                      setState(() {});
                                    }));
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextButton(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("View All")),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/orderreq');
                            },
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
