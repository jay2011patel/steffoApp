import 'package:flutter/material.dart';
import 'package:stefomobileapp/pages/DealerPage.dart';
import 'package:stefomobileapp/pages/HomePage.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Inventory", () {
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
                    pageBuilder: (context, animation1, animation2) => HomePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => DealerPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );              }
            });
          },
        ));
  }

  Widget InventoryPageBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(children: [
          Card(
              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Distributor Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width / 16,
                                color: Colors.black)),
                        Align(
                          child: RichText(
                            text: TextSpan(style: TextStyle(), children: [
                              TextSpan(
                                  text: "Total Quantity: ",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w900,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              35)),
                              TextSpan(
                                  text: "9999999",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w900,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 35,
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
                            fontWeight: FontWeight.bold, color: Colors.black),
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

                              DataCell(Text("FE500")),
                              DataCell(Text("999"))
                            ],
                          )
                        ]),
                  )
                ]),
              )),
        ]),
      ),
    );
  }
}
