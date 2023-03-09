import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import '../UI/common.dart';
import 'package:http/http.dart' as http;

class GenerateChallanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GenerateChallanContent();
    throw UnimplementedError();
  }
}

class GenerateChallanContent extends StatefulWidget {
  const GenerateChallanContent({super.key});
  @override
  State<GenerateChallanContent> createState() => _GenerateChallanPageState();
}

class _GenerateChallanPageState extends State<GenerateChallanContent> {
  var _selected = 0;
  List listOfColumns = [];
  List items = ["Item 1", "Item 2", "Item 3"];

  String? selectedValue;
  int itemNum = 1;

  TextEditingController transporter_name = TextEditingController();
  TextEditingController vehicle_number = TextEditingController();
  TextEditingController lr_number = TextEditingController();
  TextEditingController qty = TextEditingController();

  onRegister() async {
    print(selectedValue);
    var test = await http.post(
      Uri.parse('http://urbanwebmobile.in/steffo/transporter.php'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      body: {
        "transporter_name": transporter_name.text,
        "vehicle_": vehicle_number.text,
        "lr_number": lr_number.text,
        "qty": qty.text,
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Generate Challan"),
        body: GenerateChallanPageBody(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){},
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.red,
        // ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
              selectedIcon: const Icon(
                Icons.home_filled,
                color: Colors.grey,
              ),
            ),
            BottomBarItem(
                icon: const Icon(Icons.inventory_2_rounded),
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
            });
          },
        ));
    throw UnimplementedError();
  }

  Widget GenerateChallanPageBody() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    getItems() {
      dropdownItems.clear();
      for (int i = 0; i < items.length; i++) {
        DropdownMenuItem<String> item = DropdownMenuItem<String>(
            value: items[i],
            child: Container(
              decoration: BoxDecoration(
                  //color: ,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(items[i]),
            ));

        dropdownItems.add(item);
      }
      return dropdownItems;
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //----------------------------TransporterName Field-----------------

            Container(
              //margin: EdgeInsets.fromLTRB(20, 20,20,0),

              width: width,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: transporter_name,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.emoji_transportation_rounded),
                    filled: true,
                    fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                    labelText: "Transporter Name",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      // borderRadius: BorderRadius.circular(20.0)
                    ),
                  )),
            ),

            //---------------------------Vehicle Number Field-------------------

            Container(
              //margin: EdgeInsets.fromLTRB(20, 20,20,0),

              width: width,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: vehicle_number,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.fire_truck_rounded),
                    filled: true,
                    fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                    labelText: "Vehicle Number",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      // borderRadius: BorderRadius.circular(20.0)
                    ),
                  )),
            ),

            Container(
              //margin: EdgeInsets.fromLTRB(20, 20,20,0),

              width: width,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: lr_number,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.numbers),
                    filled: true,
                    fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                    labelText: "LR Number",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      // borderRadius: BorderRadius.circular(20.0)
                    ),
                  )),
            ),

            Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                hintText: "Select The Product",
                                filled: true,
                                fillColor: Color.fromRGBO(
                                    233, 236, 239, 0.792156862745098),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  // borderRadius: BorderRadius.circular(20)
                                )),
                            value: selectedValue,
                            items: getItems(),
                            onChanged: (String? newValue) {
                              selectedValue = newValue;
                            },
                          )),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextFormField(
                          maxLines: 1,
                          controller: qty,
                          decoration: const InputDecoration(
                            hintText: "Quantity",
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color.fromRGBO(233, 236, 239,
                                0.792156862745098), //Color.fromRGBO(233, 236, 239, 0.792156862745098)
                          ),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  // borderRadius: BorderRadius.circular(20),
                                  side: BorderSide.none),
                              minimumSize: const Size(190, 40)),
                          onPressed: () {
                            setState(() {
                              listOfColumns.add({
                                "Sr_no": itemNum.toString(),
                                "Name": "$selectedValue",
                                "Qty": qty.text
                              });
                              itemNum = itemNum + 1;
                            });
                          },
                          child: const Text("Add Item"))
                    ],
                  ),
                ),

                //-----------------------DataTable--------------------------------

                Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                        height: 200,
                        // width: MediaQuery.of(context).size.width - 20,
                        // padding: EdgeInsets.only(
                        //     top: 10, bottom: 10, left: 10, right: 10),
                        // decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(20.0)),
                        // alignment: Alignment.center,
                        // padding: const EdgeInsets.only(top: 20),
                        // child: SingleChildScrollView(
                        //   padding: EdgeInsets.only(
                        //       top: 10, bottom: 10, left: 10, right: 10),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Center(
                              child: DataTable(
                                //border: TableBorder.all(borderRadius: BorderRadius.circular(20)),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(
                                      233, 236, 239, 0.792156862745098),

                                  // borderRadius: BorderRadius.circular(20)
                                ),
                                columns: const [
                                  DataColumn(label: Text('Sr\nNo')),
                                  DataColumn(label: Text('HSN/Name')),
                                  DataColumn(label: Text('Quantity(Tons)')),
                                ],
                                rows:
                                    listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                                        .map(
                                          ((element) => DataRow(
                                                cells: <DataCell>[
                                                  DataCell(Text(element[
                                                      "Sr_no"]!)), //Extracting from Map element the value
                                                  DataCell(
                                                      Text(element["Name"]!)),
                                                  DataCell(
                                                      Text(element["Qty"]!)),
                                                ],
                                              )),
                                        )
                                        .toList(),
                              ),
                            )))),
              ],
            ),

            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: buttonStyle("Submit", () {
                  onRegister();

                  Navigator.of(context).pushNamed("/challan");
                }))
          ],
        ),
      ),
    );
  }
}
