import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stefomobileapp/pages/ChangePP.dart';
import 'package:stefomobileapp/pages/DealerPage.dart';
import 'package:stefomobileapp/pages/InventoryPage.dart';
import 'package:stefomobileapp/pages/OrderPage.dart';
import 'package:stefomobileapp/pages/ProfilePage.dart';
import 'package:stefomobileapp/ui/common.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:http/http.dart' as http;
import '../Models/order.dart';
import '../ui/cards.dart';
import 'RequestPage.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

import 'addItem.dart';

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
  TextEditingController newBasePrice = TextEditingController();

  var homeTab;

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
          if (user_type != "Manufacturer" && isSalesEnabled == "true" ) {
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

  final List<String> imageList = [
    'assets/images/stefo_logo.png',
    'assets/images/stefo_logo.png',
    'assets/images/stefo_logo.png',
    'assets/images/stefo_logo.png'
  ];

  List<Order> requestList = [];
  List<Order> orderList = [];
  String? isSalesEnabled = "false",basePrice = "0";
  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var m = id;
    id = await prefs.getString('id');

    if (m != id) {
      requestList = [];
      orderList = [];
      final res1 = await http.post(
        Uri.parse("http://urbanwebmobile.in/steffo/getsystemdata.php")
      );

      var responseData1 = jsonDecode(res1.body);

      isSalesEnabled = responseData1['data'][0]['value'];
      basePrice = responseData1['data'][1]['value'];
      print(" $isSalesEnabled and $basePrice");

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
        req.orderType = responseData["data"][i]["orderType"];
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
  bool light = true;
  Widget HomePageBody() {
    loadData();

    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  options: CarouselOptions(
                    height: 100.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(milliseconds: 300),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  itemBuilder: (context, i, id) {
                    //for onTap to redirect to another screen
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        //ClipRRect for image border radius
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            imageList[i],
                            width: 500,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              DotsIndicator(
                dotsCount: imageList.length,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                  activeColor: Colors.black,
                  color: Colors.grey,
                ),
              ),
              LayoutBuilder(builder: (context, constraints) {
                if (user_type == "Manufacturer") {
                  return Column(
                    children: [
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              child: Row(
                            children: [
                              Text("Enable Sales"),
                              Switch(
                                  // This bool value toggles the switch.
                                  value: light,
                                  activeColor: Colors.green,
                                  onChanged: (bool value) async {
                                    // This is called when the user toggles the switch.
                                    //print(value);
                                    light = value;
                                    setState(() {

                                    });
                                    var res = await http.post(

                                      Uri.parse("http://urbanwebmobile.in/steffo/setsale.php"),
                                      body: {
                                        "status":value.toString()
                                      }
                                    );

                                  })
                            ],
                          )),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddItemPage()));
                              },
                              child: Text("Admin Controls"))
                        ],
                      )),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
              LayoutBuilder(builder: (context, constraint) {
                if (light == true) {
                  return Container(
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
                                "Base Price : $basePrice/-",
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: TextFormField(
                                // initialValue: price.toString(),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                controller: newBasePrice,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                cursorColor: Colors.white,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                ),
                                // onFieldSubmitted: (value) {
                                //   print(value);
                                //   setState(() {
                                //     editPrice = false;
                                //     price = int.parse(value);
                                //   });
                                // }),
                              ),
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                            ElevatedButton(
                                // icon: Icon(Icons.done_outlined),

                                onPressed: () {
                                  // print(newBasePrice.text);
                                  setState(() {
                                    editPrice = false;
                                    final numericRegex = RegExp(r'^[0-9]*$');
                                    if(numericRegex.hasMatch(newBasePrice.text) && newBasePrice.text.trim() != "" ){
                                      price = int.parse(newBasePrice.text);
                                      http.post(
                                        Uri.parse("http://urbanwebmobile.in/steffo/setbaseprice.php"),
                                        body:{
                                          "basePrice" : newBasePrice.text.toString()
                                        }
                                      );
                                      basePrice = newBasePrice.text;
                                    }
                                  });
                                },
                                child: Text("Submit"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black))
                          ],
                        );
                      }
                    }),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green,
                    ),
                  );
                } else {
                  return Container();
                }
              }),
              Container(
                margin: EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(8.0),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // border: Border.all(color: Colors.black),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black, blurRadius: 2.0)
                    ]),
                // width: 200,
                height: 450,
                child: ContainedTabBarView(
                  tabBarProperties: TabBarProperties(
                      background: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                  )),
                  tabs: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Orders', style: TextStyle(color: Colors.black)),
                          Container(
                            height: 35,
                            child: Text(
                                orderList.length.toString().padLeft(2, '0'),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30)),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Requests', style: TextStyle(color: Colors.black)),
                        Container(
                          height: 35,
                          child: Text(
                              requestList.length.toString().padLeft(2, '0'),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30)),
                        ),
                      ],
                    ),
                  ],
                  views: [
                    Container(
                      color: Colors.white,
                      child: Container(
                          //height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.5),
                              borderRadius: BorderRadius.circular(8)),
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(
                            children: [
                              LayoutBuilder(builder: (context, constraints) {
                                if (user_type == "Dealer") {
                                  return Container(
                                    height: 300,
                                    child: SingleChildScrollView(
                                      child: ListView.builder(
                                        itemCount: orderList.length > 3
                                            ? 3
                                            : orderList.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
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
                                                                order: orderList[
                                                                    index])));
                                              },
                                              child: orderCard(context,
                                                  orderList[index], id));
                                        },
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    height: 300,
                                    child: SingleChildScrollView(
                                      child: ListView.builder(
                                        itemCount: orderList.length > 3
                                            ? 3
                                            : orderList.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
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
                                                                order: orderList[
                                                                    index])));
                                              },
                                              child: orderCard(context,
                                                  orderList[index], id));
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
                                      horizontal: 0, vertical: 0),
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: ElevatedButton(
                                    child: const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "View All",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/orders');
                                    },
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                    Container(
                      color: Colors.white,
                      child: LayoutBuilder(builder: (context, constraints) {
                        if (user_type != "Dealer") {
                          return Container(
                              //height: MediaQuery.of(context).size.height*0.36,
                              decoration: BoxDecoration(
                                  // color:
                                  //     const Color.fromRGBO(255, 255, 255, 0.5),

                                  borderRadius: BorderRadius.circular(8)),
                              margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 300,
                                    child: SingleChildScrollView(
                                      child: Container(
                                        child: ListView.builder(
                                          itemCount: requestList.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
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
                                                    context, requestList[index],
                                                    () {
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
                                      // margin:
                                      //     EdgeInsets.symmetric(horizontal: 20),
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: ElevatedButton(
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text("View All")),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed('/orderreq');
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
