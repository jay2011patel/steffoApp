import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stefomobileapp/Models/challan.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import "package:http/http.dart" as http;
import '../Models/order.dart';
import '../ui/common.dart';
import 'GenerateChallanPage.dart';
import 'GeneratedChallanPage.dart';
// import 'RequestPage.dart';

class ChallanListPage extends StatelessWidget {
  final Order order;
  ChallanListPage({super.key,required this.order});
  @override
  Widget build(BuildContext context) {
    return ChallanListContent(order: order,);
    throw UnimplementedError();
  }
}

class ChallanListContent extends StatefulWidget {
  final Order order;
  ChallanListContent({super.key,required this.order});
  final selected = 0;
  @override
  State<ChallanListContent> createState() => _ChallanListPageState();
}

class _ChallanListPageState extends State<ChallanListContent> {
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Challan",(){
          Navigator.pop(context);
        }),
        body: ChallanListBody(),
        // bottomNavigationBar: StylishBottomBar(
        //   option: AnimatedBarOptions(
        //     iconSize: 30,
        //     //barAnimation: BarAnimation.liquid,
        //     iconStyle: IconStyle.simple,
        //     opacity: 0.3,
        //   ),
        //
        //   items: [
        //     BottomBarItem(
        //       icon: const Icon(
        //         Icons.home_filled,
        //       ),
        //       title: const Text('Abc'),
        //       backgroundColor: Colors.red,
        //       selectedIcon:
        //           const Icon(Icons.home_filled, color: Colors.blueAccent),
        //     ),
        //     BottomBarItem(
        //         icon: const Icon(
        //           Icons.inventory_2_rounded,
        //         ),
        //         title: const Text('Safety'),
        //         backgroundColor: Colors.orange,
        //         selectedIcon: const Icon(Icons.inventory_2_rounded,
        //             color: Colors.blueAccent)),
        //     BottomBarItem(
        //         icon: const Icon(
        //           Icons.warehouse_rounded,
        //         ),
        //         title: const Text('Safety'),
        //         backgroundColor: Colors.orange,
        //         selectedIcon: const Icon(Icons.warehouse_rounded,
        //             color: Colors.blueAccent)),
        //     BottomBarItem(
        //         icon: const Icon(
        //           Icons.person_pin,
        //         ),
        //         title: const Text('Cabin'),
        //         backgroundColor: Colors.purple,
        //         selectedIcon:
        //             const Icon(Icons.person_pin, color: Colors.blueAccent)),
        //   ],
        //   //fabLocation: StylishBarFabLocation.center,
        //   hasNotch: false,
        //   currentIndex: _selected,
        //   onTap: (index) {
        //     setState(() {
        //       if (index == 0) {
        //         Navigator.of(context).popAndPushNamed('/home');
        //       }
        //
        //       if (index == 1) {
        //         Navigator.of(context).popAndPushNamed('/inventory');
        //       }
        //
        //       if (index == 2) {
        //         Navigator.of(context).popAndPushNamed('/dealer');
        //       }
        //     });
        //   },
        // )
    );
    throw UnimplementedError();
  }
  int flag =0;
  String? id;
  String? userType;
  List<Challan> challanList = [];
  loadChallanList() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    id = await prefs.getString('id');
    if(flag == 0){
      final res = await http.post(
        Uri.parse("http://urbanwebmobile.in/steffo/getchallanlist.php"),
        body: {"order_id": widget.order.order_id},
      );
      var responseData = jsonDecode(res.body);
      print(responseData);

      for (int i = 0; i < responseData["data"].length; i++) {
          Challan ch = Challan();
          ch.order_id=responseData["data"][i]["order_id"];
          ch.challan_id=responseData["data"][i]["challan_id"].toString();
          ch.transporter_name=responseData["data"][i]["transporter_name"];
          ch.vehicle_number=responseData["data"][i]["vehicle_number"];
          ch.lr_number=responseData["data"][i]["lr_number"];
          challanList.add(ch);
      }
      flag =1;
      setState(() {

      });
    }
  }

  //-----------------------------------ChallanListMainBody----------------------

  Widget ChallanListBody() {
    loadChallanList();
    return Container(
        height: MediaQuery.of(context).size.height * 0.83,
        decoration: const BoxDecoration(
            // gradient:
        //         LinearGradient(transform: GradientRotation(1.07), colors: [
        //   Color.fromRGBO(75, 100, 160, 1.0),
        //   Color.fromRGBO(19, 59, 78, 1.0),
        // ]
        //         )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    // color: Colors.grey,
                    // borderRadius: BorderRadius.circular(20)
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      "Order Id:",
                      style: TextStyle(fontFamily: "Poppins_Bold"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(widget.order.order_id.toString()),
                    )
                  ],
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.5),
                      borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Column(
                    children: [
                      const Center(
                          child: Text(
                        "Challan",
                        style: TextStyle(fontFamily: "Poppins_Bold"),
                      )),
                      SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                            itemCount: challanList.length,
                            //physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: false,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GeneratedChallan(challan_id: challanList[index].challan_id!)
                                        )
                                    );
                                    },
                                  child: ChallanCard(context, challanList[index]));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  child:LayoutBuilder(builder: (context, constraints) {
                    if(id == "0"){
                      return Container(

                          margin: EdgeInsets.only(left: 20, right: 20,top: 10),
                          width: MediaQuery.of(context).size.width,
                          child: buttonStyle("Generate Challan", () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GenerateChallanPage(order: widget.order,)
                                )
                            );
                          }));
                    }else{
                      return Container();
                    }
                  })
              )

            ],
          ),
        ));
  }

  //----------------------------SingleChallanCard-------------------------------

  Widget ChallanCard(context, Challan challan) {
    String trp_name = "XY Transporter";

    return Card(
      child: Container(
        decoration: BoxDecoration(
            // color: Colors.white, borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: const Text(
                  "Challan ID:",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontFamily: "Poppins_Bold"),
                )),
                Container(
                    padding: EdgeInsets.only(left: 65),
                    child:  Text(
                      challan.challan_id!.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Poppins_Bold"),
                    ))
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Transporter Name:",
                      style: TextStyle(fontFamily: "Roboto"),
                    ),
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                  ),
                  Container(
                    child: Text(
                      challan.transporter_name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text("Vehicle Number:"),
                  Padding(
                    padding: const EdgeInsets.only(left: 36.0),
                    child: Text(challan.vehicle_number!),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
