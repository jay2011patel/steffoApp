import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stefomobileapp/Models/lumpsum.dart';
import 'package:stefomobileapp/pages/DealerPage.dart';
import 'package:stefomobileapp/pages/HomePage.dart';
import 'package:stefomobileapp/pages/ProfilePage.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../Models/grade.dart';
import '../Models/item.dart';
import '../ui/common.dart';

class InventoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InventoryContent();
  }
}

class InventoryContent extends StatefulWidget {
  InventoryContent({super.key});
  final selected = 0;
  @override
  State<InventoryContent> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryContent> {
  var _selected = 1;
  bool isDataLoaded = false;
  List<Lumpsum> lumpsums =[];
  List<Grade> gradeList = [];
  loadData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user_id = await prefs.getString('id');

    var res1 = await http.post(Uri.parse("http://urbanwebmobile.in/steffo/getgrade.php"));
    var responseData1 = jsonDecode(res1.body);
    for(int i  = 0 ; i < responseData1['data'].length;i++){
      print(responseData1['data'][i]);
      Grade g = Grade();
      g.value = responseData1['data'][i]['gradeName'];
      g.qty = 0;
      gradeList.add(g);
    }

    var res = await http.post(
     Uri.parse("http://urbanwebmobile.in/steffo/getinventory.php"),
     body: {
      "user_id":user_id,
     }
    );

    var responseData = jsonDecode(res.body);
    var orders = [];

    print(responseData);
    for(int i = 0 ; i < responseData["data"].length; i++) {
      print(responseData['data'][i]['name']);
      var ind = gradeList.indexWhere((element) => element.value?.trim() == responseData['data'][i]['name'].trim());
      gradeList[ind].qty = gradeList[ind].qty! + int.parse(responseData['data'][i]['qty_left']);
      print(gradeList[ind].value! + " " + gradeList[ind].qty.toString());
      Lumpsum l = Lumpsum();
      l.orderId = responseData["data"][i]["order_id"];
      l.name = responseData["data"][i]["name"];
      l.qty = responseData["data"][i]["qty_left"];
      l.price = responseData["data"][i]["price"];
      l.status = responseData["data"][i]["status"];
      l.date = responseData["data"][i]["createdAt"];
      lumpsums.add(l);
    }
    isDataLoaded = true;
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Inventory", () {
          Navigator.pop(context);
        }),
        body: LayoutBuilder(
          builder: (context,constraints) {
            if(isDataLoaded){
              return InventoryPageBody();
            }
            else{
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Loading Inventory")
                ],
              ));
            }
        }
        ),
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
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        HomePage(),
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
  }

  Widget InventoryPageBody() {
    return Container(

      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(

            width: MediaQuery.of(context).size.width - 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                // color: Colors.white,
                // color : Color(0xffEB6440),
                // color : Color(0xff497174),
                color : Color(0xffF05454),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    // spreadRadius: 1.0,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 1.0,
                  )
                ]),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "FE500 : ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16)),
                          TextSpan(
                              text: "99",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16)),
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "FE550 : ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16)),
                          TextSpan(
                              text: "99",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16)),
                        ])),
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 2.5,
                ),
                // SizedBox(
                //   width: 20,
                // ),
                Container(
                  height: 50,
                  child: Row(children: [
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                      width: 5.0,
                    ),
                    ]
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "FE500D : ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16)),
                          TextSpan(
                              text: "99",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16)),
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "FE550D : ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16)),
                          TextSpan(
                              text: "99",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16)),
                        ])),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
            child: Align(
                child: Text(
                  "Purchase History:",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                alignment: Alignment.bottomCenter),
          ),
          SingleChildScrollView(
            child: Column(children: [
              Card(
                  color: Colors.white54,
                  // color : Color(0xff006B7F),
                  elevation: 5,
                  margin: EdgeInsets.all(5.0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(lumpsums[0].orderId.toString(),
                                style: TextStyle(
                                  fontFamily: "Cambria",
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 17,
                                    color: Colors.black)),
                            Align(
                              child: RichText(
                                text: TextSpan(style: TextStyle(), children: [
                                  TextSpan(
                                      text: "Total Quantity: ",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w900,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              30)),
                                  TextSpan(
                                      text: lumpsums[0].qty,
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w900,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                30,
                                      ))
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Ordered On: ",
                                style: TextStyle(
                                    fontFamily: "Cambria",
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 30,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "21/10/2021",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 30))
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: DataTable(
                            columnSpacing: double.minPositive,
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            columns: const [
                              DataColumn(
                                  label: Text(
                                "Sr No",
                                textAlign: TextAlign.center,
                              )),
                              DataColumn(label: Text("Item name")),
                              DataColumn(label: Text("Quantity\n(Tons)"))
                            ],
                            rows: [
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                      "1")), //Extracting from Map element the value

                                  DataCell(Text(lumpsums[0].name!)),
                                  DataCell(Text(lumpsums[0].qty!))
                                ],
                              )
                            ]),
                      )
                    ]),
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
