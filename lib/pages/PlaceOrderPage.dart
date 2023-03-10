import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../UI/common.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceOrderContent();
  }
}

class PlaceOrderContent extends StatefulWidget {
  const PlaceOrderContent({super.key});
  final selected = 0;
  @override
  State<PlaceOrderContent> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderContent> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;
  late FocusNode focusNode4;
  late FocusNode focusNode5;
  late FocusNode focusNode6;
  final field1Key = GlobalKey<FormFieldState>();
  final field2Key = GlobalKey<FormFieldState>();
  final field3Key = GlobalKey<FormFieldState>();
  final field4Key = GlobalKey<FormFieldState>();
  final field5Key = GlobalKey<FormFieldState>();
  final field6Key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Place Order"),
      body: PlaceOrderBody(),
    );
  }

  String? id, supplier_id;
  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id = await prefs.getString('id');
    supplier_id = await prefs.getString('parentId');
    setState(() {});
  }

  String? selectedValue, selectedSize, selectedGrade,selectedType;
  TextEditingController qty = TextEditingController();
  TextEditingController party_name = TextEditingController();
  TextEditingController party_address = TextEditingController();
  TextEditingController party_pan_no = TextEditingController();
  TextEditingController party_mob_num = TextEditingController();
  TextEditingController loading_type = TextEditingController();
  TextEditingController base_price = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
    focusNode5 = FocusNode();
    focusNode6 = FocusNode();
    focusNode1.addListener(() {
      if (!focusNode1.hasFocus) {
        field1Key.currentState?.validate();
      }
    });
    focusNode2.addListener(() {
      if (!focusNode2.hasFocus) {
        field2Key.currentState?.validate();
      }
    });
    focusNode3.addListener(() {
      if (!focusNode3.hasFocus) {
        field3Key.currentState?.validate();
      }
    });
    focusNode4.addListener(() {
      if (!focusNode4.hasFocus) {
        field4Key.currentState?.validate();
      }
    });
    focusNode5.addListener(() {
      if (!focusNode5.hasFocus) {
        field5Key.currentState?.validate();
      }
    });
    focusNode6.addListener(() {
      if (!focusNode6.hasFocus) {
        field6Key.currentState?.validate();
      }
    });
  }
  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    focusNode6.dispose();
    super.dispose();
  }

  List items = ["TMT"];
  List grades = ["FE500", "FE550", "FE500D", "FE550D"];
  List sizes = ["10mm", "20mm", "30mm", "40mm", "50mm"];
  List type = ["Loose", "Bhari"];


  int itemNum = 1;
  final List<Map<String, String>> listOfColumns = [];
  onPlaceOrder() async {
    var res = await http.post(
      Uri.parse("http://urbanwebmobile.in/steffo/placeorder.php"),
      body: {
        "userId": id!,
        "supplierId": supplier_id!,
        "shippingAddress": party_address.text,
        "partyName": party_name.text,
        //"party_address": party_address.text,
        "gstNumber": party_pan_no.text,
        "mobileNumber": party_mob_num.text,
        "basePrice": base_price.text,
        "status": "Pending",
        "loadingType": loading_type.text,
      },
    );
    Fluttertoast.showToast(
        msg: 'Your Order Is Placed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white);

    Navigator.of(context).pushNamed("/home");

    var responseData = json.decode(res.body);
    print(responseData["value"].toString());

    if(responseData["status"]=='200'){
      for(int i = 0 ; i<listOfColumns.length;i++){
        http.post(
          Uri.parse("http://urbanwebmobile.in/steffo/setorder.php"),
          body: {
            "order_id":responseData["value"].toString(),
            "name":listOfColumns[i]["Name"],
            "qty":listOfColumns[i]["Qty"]
          },
        );
      }
    }
     // print(listOfColumns[0]['Name']);
  }

  Widget PlaceOrderBody() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    List<DropdownMenuItem<String>> dropdownGrades = [];
    List<DropdownMenuItem<String>> dropdownSize = [];
    List<DropdownMenuItem<String>> dropdownType = [];
    List<DropdownMenuItem<String>> getItems() {
      for (int i = 0; i < items.length; i++) {
        DropdownMenuItem<String> it = DropdownMenuItem(
          value: items[i],
          child: Text(items[i]),
        );
        dropdownItems.add(it);
      }
      return dropdownItems;
    }

    List<DropdownMenuItem<String>> getGrade() {
      for (int i = 0; i < grades.length; i++) {
        DropdownMenuItem<String> it = DropdownMenuItem(
          value: grades[i],
          child: Text(grades[i]),
        );
        dropdownGrades.add(it);
      }

      return dropdownGrades;
    }

    List<DropdownMenuItem<String>> getSize() {
      for (int i = 0; i < sizes.length; i++) {
        DropdownMenuItem<String> it = DropdownMenuItem(
          value: sizes[i],
          child: Text(sizes[i]),
        );
        dropdownSize.add(it);
      }
      return dropdownSize;
    }

    List<DropdownMenuItem<String>> getType() {
      for (int i = 0; i < type.length; i++) {
        DropdownMenuItem<String> it = DropdownMenuItem(
          value: type[i],
          child: Text(type[i]),
        );
        dropdownType.add(it);
      }
      return dropdownType;
    }

    loadData();

    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //
            //     transform: GradientRotation(1.07),
            //     colors: [
            //       Color.fromRGBO(75, 100, 160, 1.0),
            //       Color.fromRGBO(19, 59, 78, 1.0),
            //     ]
            //
            // )
            color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //-----------------------Name-------------------------------------
              Container(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: TextFormField(
                  key: field1Key,
                  focusNode: focusNode1,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Please enter a Name.';
                    }
                    return null;
                  },
                  controller: party_name,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: "Name",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Color.fromRGBO(233, 236, 239,
                          0.792156862745098) //Color.fromRGBO(233, 236, 239, 0.792156862745098)

                      ),
                ),
              ),
              //----------------------------Shipping Address--------------------
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  key: field2Key,
                  focusNode: focusNode2,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Please enter an Address.';
                    }
                    return null;
                  },
                  controller: party_address,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      labelText: "Shipping Address",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Color.fromRGBO(233, 236, 239,0.792156862745098) //Color.fromRGBO(233, 236, 239, 0.792156862745098)

                      ),
                ),
              ),

              //-----------------------------Pan Number-------------------------

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  key: field3Key,
                  focusNode: focusNode3,
                  controller: party_pan_no,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a value.';
                    }else if(value.length < 15){
                      return 'Please Enter Valid Number';
                    }
                    if (value.length > 15) {
                      return 'Please Enter Valid Number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "GST Number",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: const Color.fromRGBO(233, 236, 239,0.792156862745098) //Color.fromRGBO(233, 236, 239, 0.792156862745098)

                      ),
                ),
              ),

              //----------------------------Contact Number----------------------

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  key: field4Key,
                  focusNode: focusNode4,
                  controller: party_mob_num,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Number.';
                    }else if(value.length < 10){
                      return 'Please Enter Valid Number';
                    }
                    if (value.length > 10) {
                      return 'Please Enter Valid Number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Contact Number",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Color.fromRGBO(233, 236, 239,
                          0.792156862745098) // Color.fromRGBO(233, 236, 239, 0.792156862745098)

                      ),
                ),
              ),

              //--------------------------Loading Type--------------------------

              Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: DropdownButtonFormField(
                    decoration:const InputDecoration(
                        hintText: "Select Loading Type",
                        filled: true,
                        fillColor: Color.fromRGBO(
                            233, 236, 239, 0.792156862745098),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderRadius: BorderRadius.circular(20)
                        )),
                    value: selectedType,
                    items: getType(),
                    onChanged: (String? newValue) {
                      selectedType = newValue;
                    },
                  )),

              // Container(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              //   child: TextFormField(
              //     key: field5Key,
              //     focusNode: focusNode5,
              //     controller: loading_type,
              //     maxLines: 1,
              //     validator: (value) {
              //       if (value!.isEmpty || value == null) {
              //         return 'Please enter a value.';
              //       }
              //       return null;
              //     },
              //     decoration: const InputDecoration(
              //         labelText: "Loading Type",
              //         floatingLabelBehavior: FloatingLabelBehavior.never,
              //         border: OutlineInputBorder(
              //             // borderRadius: BorderRadius.circular(20),
              //             borderSide: BorderSide.none),
              //         filled: true,
              //         fillColor: Color.fromRGBO(233, 236, 239,
              //             0.792156862745098) // Color.fromRGBO(233, 236, 239, 0.792156862745098)
              //
              //         ),
              //   ),
              // ),

              //------------------------------BasePrice--------------------------

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  key: field6Key,
                  focusNode: focusNode6,
                  controller: base_price,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a value.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Base Price",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor:
                          Color.fromRGBO(233, 236, 239, 0.792156862745098)),
                ),
              ),

              //-------------------Add Item Block-------------------------------

              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: const BoxDecoration(
                    // color: Colors.white, borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: DropdownButtonFormField(
                          decoration:const InputDecoration(
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                              hintText: "Select The Grade",
                              filled: true,
                              fillColor: Color.fromRGBO(
                                  233, 236, 239, 0.792156862745098),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                // borderRadius: BorderRadius.circular(20)
                              )),
                          value: selectedGrade,
                          items: getGrade(),
                          onChanged: (String? newValue) {
                            selectedGrade = newValue;
                          },
                        )),
                    Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: DropdownButtonFormField(
                          decoration:const InputDecoration(
                              hintText: "Select The Size",
                              filled: true,
                              fillColor:  Color.fromRGBO(
                                  233, 236, 239, 0.792156862745098),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                // borderRadius: BorderRadius.circular(20)
                              )),
                          value: selectedSize,
                          items: getSize(),
                          onChanged: (String? newValue) {
                            selectedSize = newValue;
                          },
                        )),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        maxLines: 1,
                        controller: qty,
                        decoration:const  InputDecoration(
                          labelText: "Quantity",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor:Color.fromRGBO(233, 236, 239,
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
                              "Name":
                                  "$selectedValue $selectedGrade $selectedSize mm",
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

              Card(
                child: SingleChildScrollView(
                  child: Container(
                    height: 250,
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      child: DataTable(
                        //border: TableBorder.all(borderRadius: BorderRadius.circular(20)),
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(20)),

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
                                          DataCell(Text(element["Sr_no"]!)), //Extracting from Map element the value
                                          DataCell(Text(element["Name"]!)),
                                          DataCell(Text(element["Qty"]!)),
                                        ],
                                      )),
                                )
                                .toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  child: buttonStyle("Submit", () {
                    if (_formKey.currentState!.validate()) {
                      onPlaceOrder();
                    }

                  }))
            ],
          ),
        ),
      ),
    );
  }
}
