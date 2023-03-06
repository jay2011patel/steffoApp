import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../UI/common.dart';
// import 'RequestPage.dart';

class ChallanListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ChallanListContent();
    throw UnimplementedError();
  }
}

class ChallanListContent extends StatefulWidget {
  const ChallanListContent({super.key});
  final selected = 0;
  @override
  State<ChallanListContent> createState() => _ChallanListPageState();
}

class _ChallanListPageState extends State<ChallanListContent> {
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Challan"),
        body: ChallanListBody(),
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
              if (index == 0) {
                Navigator.of(context).popAndPushNamed('/home');
              }

              if (index == 1) {
                Navigator.of(context).popAndPushNamed('/inventory');
              }

              if (index == 2) {
                Navigator.of(context).popAndPushNamed('/dealer');
              }
            });
          },
        ));
    throw UnimplementedError();
  }

  //-----------------------------------ChallanListMainBody----------------------

  Widget ChallanListBody() {
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
                  children: const [
                    Text(
                      "Order Id:",
                      style: TextStyle(fontFamily: "Poppins_Bold"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("98761"),
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
                            itemCount: 2,
                            //physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: false,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("/challan");
                                  },
                                  child: ChallanCard(context, index));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  child: buttonStyle("Generate Challan", () {
                    Navigator.of(context).pushNamed('/gnchallan');
                  }))
            ],
          ),
        ));
  }

  //----------------------------SingleChallanCard-------------------------------

  Widget ChallanCard(context, index) {
    String trp_name = "XY Transporter";

    return Container(
      decoration: BoxDecoration(
          // color: Colors.white, borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  child: const Text(
                "Challan ID:",
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: "Poppins_Bold"),
              )),
              Container(
                  padding: EdgeInsets.only(left: 65),
                  child: const Text(
                    "987611",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "Poppins_Bold"),
                  ))
            ],
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(
                    "Transporter Name:",
                    style: TextStyle(fontFamily: "Roboto"),
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5, right: 20),
                ),
                Expanded(
                    child: Text(
                  trp_name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ))
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text("Vehicle Number:"),
                Padding(
                  padding: const EdgeInsets.only(left: 36.0),
                  child: Text("GJ01XX1234"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
