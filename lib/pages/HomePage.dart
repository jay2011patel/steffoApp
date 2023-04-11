import 'dart:convert';
import 'dart:ffi';
//import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stefomobileapp/pages/DealerPage.dart';
import 'package:stefomobileapp/pages/InventoryPage.dart';
import 'package:stefomobileapp/pages/OrderPage.dart';
import 'package:stefomobileapp/pages/EditableProfilePage.dart';
import 'package:stefomobileapp/ui/common.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:http/http.dart' as http;
import '../Models/order.dart';
import '../ui/cards.dart';
import 'ProfilePage.dart';
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
  bool editPrice = false;

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
        appBar: appbar("Home", () {
          print("Back Pressed");
          Navigator.pop(context);
        }),
        body: HomePageBody(),
        floatingActionButton: LayoutBuilder(builder: (context, constraints) {
          if (user_type != "Manufacturer") {
            //fabLoc = FloatingActionButtonLocation.centerDocked;
            return FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/placeorder');
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
            );
          } else {
            return Container();
          }
        }),
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
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        InventoryPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        DealerPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }
              if (index == 3) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        ProfilePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }
            });
          },
        ));
    throw UnimplementedError();
  }

  String? id = "";
  int currentIndex = 0;
  int sizeList = 3;

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

      for (int i = 0; i < responseData["data"].length; i++) {
        Order req = Order();
        req.reciever_id = responseData["data"][i]["supplier_id"];
        req.user_id = responseData["data"][i]["user_id"];
        req.user_mob_num = responseData["data"][i]["mobileNumber"];
        req.user_name = responseData["data"][i]["firstName"] +
            " " +
            responseData["data"][i]["lastName"];
        req.status = responseData["data"][i]["orderStatus"];
        req.party_name = responseData["data"][i]["partyName"];
        req.party_address = responseData["data"][i]["shippingAddress"];
        req.party_mob_num = responseData["data"][i]["partyMobileNumber"];
        req.loading_type = responseData["data"][i]["loadingType"];
        req.order_date = responseData["data"][i]["createdAt"];
        req.base_price = responseData["data"][i]["basePrice"];
        req.billing_address = responseData["data"][i]["address"];
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

  var price = 999;
  Widget HomePageBody() {
    loadData();

    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: CarouselSlider(
                  items: [
                    //1st Image of Slider

                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/stefo_logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    //2nd Image of Slider

                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/stefo_logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/steefo_banner.jpeg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 150.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: sizeList,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                  activeColor: Colors.black,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(5.0),
                child: LayoutBuilder(builder: (context, constraints) {
                  if (editPrice == false) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          //width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            "Base Price : $price/-",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        LayoutBuilder(builder: (context, constraints) {
                          if (user_type == "Manufacturer") {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    editPrice = true;
                                  });
                                },
                                icon: Icon(Icons.edit),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        })
                      ],
                    );
                  } else {
                    return TextFormField(
                        initialValue: price.toString(),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          print(value);
                          setState(() {
                            editPrice = false;
                            price = int.parse(value);
                          });
                        });
                  }
                }),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),
              ),
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
                      LayoutBuilder(builder: (context, constraints) {
                        if (user_type == "Dealer") {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                itemCount:
                                    orderList.length > 3 ? 3 : orderList.length,
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
                                                            orderList[index])));
                                      },
                                      child:
                                          orderCard(context, orderList[index]));
                                },
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.3,
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
                                                builder: (context) =>
                                                    OrderDetails(
                                                        order:
                                                            orderList[index])));
                                      },
                                      child:
                                          orderCard(context, orderList[index]));
                                },
                              ),
                            ),
                          );
                        }
                      }),
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
                  )
              ),


              LayoutBuilder(builder: (context, constraints) {
                if (user_type != "Dealer") {
                  return Container(
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
                                                          order: requestList[
                                                              index])));
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
                      ));
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ));
  }
}
