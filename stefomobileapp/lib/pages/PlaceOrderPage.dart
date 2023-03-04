import 'dart:convert';

import 'package:flutter/material.dart';

import '../UI/common.dart';
import 'package:http/http.dart' as http;


class PlaceOrderPage extends StatelessWidget{
  const PlaceOrderPage({super.key});


  @override
  Widget build(BuildContext context) {
    return const PlaceOrderContent();
  }

}

class PlaceOrderContent extends StatefulWidget{
  const PlaceOrderContent({super.key});
  final selected = 0;
  @override
  State<PlaceOrderContent> createState()=> _PlaceOrderPageState();
}


class _PlaceOrderPageState extends State<PlaceOrderContent>{



  TextEditingController partyName = TextEditingController();
  TextEditingController shippingAddress = TextEditingController();
  TextEditingController panNumber = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController loadingType= TextEditingController();

  Future<void> placeOrder() async
  {
    String uri="http://localhost/steefo_api/placeOrder.php";
    var res = await http.post(Uri.parse(uri), body: {
      "partyName":partyName.text,
      "shippingAddress": shippingAddress.text,
      "panNumber":panNumber.text,
      "mobileNumber":mobileNumber.text,
      "loadingType":loadingType.text,
      "product_name":selectedValue,
      "grade":selectedGrade,
      "size":selectedSize,
      "qty":qty.text,
    }
    );

    var response=jsonDecode(res.body);
    if(response["success"]=="true")
    {
      print("record inserted");
      partyName.text="";
      shippingAddress.text="";
      panNumber.text="";
      mobileNumber.text="";
      loadingType.text="";
      selectedValue ="";
      selectedGrade ="";
      selectedSize ="";
      qty.text="";
    }
    else{
      print("some issue");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Place Order"),
        body: PlaceOrderBody(),
        );
  }


  String? selectedValue,selectedSize,selectedGrade;
  TextEditingController qty = TextEditingController();
  List items = ["TMT"];
  List grades = ["FE500","FE550","FE500D","FE550D"];
  List sizes = ["10","20","30","40","50"];
  int itemNum = 1;
  final List<Map<String, String>> listOfColumns = [];


  Widget PlaceOrderBody(){

    List<DropdownMenuItem<String>> dropdownItems = [];
    List<DropdownMenuItem<String>> dropdownGrades = [];
    List<DropdownMenuItem<String>> dropdownSize = [];

    List<DropdownMenuItem<String>> getItems(){

      for(int i = 0 ; i < items.length ;i++){
        DropdownMenuItem<String> it = DropdownMenuItem(
          value: items[i],
          child: Text(items[i]),
        );
        dropdownItems.add(it);
      }

      return dropdownItems;
    }

    List<DropdownMenuItem<String>> getGrade(){

      for(int i = 0 ; i < grades.length ;i++){
        DropdownMenuItem<String> it = DropdownMenuItem(
          value: grades[i],
          child: Text(grades[i]),
          // value: grades[i],
          // child: Text(grades[i]),
        );
        dropdownGrades.add(it);
      }

      return dropdownGrades;
    }

    List<DropdownMenuItem<String>> getSize(){

      for(int i = 0 ; i < sizes.length ;i++){
        DropdownMenuItem<String> it = DropdownMenuItem(
          value: sizes[i],
          child: Text(sizes[i]),
        );
        dropdownSize.add(it);
      }

      return dropdownSize;
    }



    return Container(
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
        color: Colors.white
      ),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              transform: GradientRotation(1.57),
              colors: [
                Color.fromRGBO(75, 100, 160, 1.0),
                Color.fromRGBO(19, 59, 78, 1.0),
              ]
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [

              //-----------------------Name-------------------------------------
              Container(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: TextFormField(

                  controller: partyName,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      ),
                      filled: true,
                      fillColor: Colors.white//Color.fromRGBO(233, 236, 239, 0.792156862745098)

                  ),
                ),
              ),
              //----------------------------Shipping Address--------------------
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  controller: shippingAddress,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Shipping Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                    ),
                    filled: true,
                    fillColor: Colors.white //Color.fromRGBO(233, 236, 239, 0.792156862745098)

                  ),
                ),
              ),

              //-----------------------------Pan Number-------------------------

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  controller: panNumber,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Pan Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      ),
                      filled: true,
                      fillColor: Colors.white//Color.fromRGBO(233, 236, 239, 0.792156862745098)

                  ),
                ),
              ),

              //----------------------------Contact Number----------------------

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  controller: mobileNumber,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Contact Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      ),
                      filled: true,
                      fillColor:Colors.white// Color.fromRGBO(233, 236, 239, 0.792156862745098)

                  ),
                ),
              ),

              //--------------------------Loading Type--------------------------

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  controller: loadingType,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Loading Type",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                      ),
                      filled: true,
                      fillColor:Colors.white// Color.fromRGBO(233, 236, 239, 0.792156862745098)

                  ),
                ),
              ),

              //-------------------Add Item Block-------------------------------

              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              hintText: "Select The Product",
                              filled: true,
                              fillColor: const Color.fromRGBO(233, 236, 239, 0.792156862745098),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                          value: selectedValue,
                          items: getItems(),
                          onChanged: (String? newValue) {
                            selectedValue = newValue;
                          },
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              hintText: "Select The Grade",
                              filled: true,
                              fillColor: const Color.fromRGBO(233, 236, 239, 0.792156862745098),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                          value: selectedGrade,
                          items: getGrade(),
                          onChanged: (String? newValue) {
                            selectedGrade = newValue;
                          },
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              hintText: "Select The Size",
                              filled: true,
                              fillColor: const Color.fromRGBO(233, 236, 239, 0.792156862745098),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                          value: selectedSize,
                          items: getSize(),
                          onChanged: (String? newValue) {
                            selectedSize = newValue;
                          },
                        )
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        maxLines: 1,
                        controller: qty,
                        decoration: InputDecoration(
                            hintText: "Quantity",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none
                            ),
                            filled: true,
                            fillColor:const Color.fromRGBO(233, 236, 239, 0.792156862745098), //Color.fromRGBO(233, 236, 239, 0.792156862745098)

                        ),
                      ),
                    ),
                    ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide.none
                          ),
                          minimumSize: const Size(190,40)
                        ),
                        onPressed: (){

                          setState(() {
                            listOfColumns.add(
                                {"Name": itemNum.toString() , "Number": "$selectedValue $selectedGrade $selectedSize" , "State": qty.text}
                            );
                            itemNum=itemNum+1;
                          });
                        },
                        child: const Text("Add Item")
                    )
                  ],
                ),
              ),

              //-----------------------DataTable--------------------------------

            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: DataTable(
                //border: TableBorder.all(borderRadius: BorderRadius.circular(20)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
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
                        DataCell(Text(element["Name"]!)), //Extracting from Map element the value
                        DataCell(Text(element["Number"]!)),
                        DataCell(Text(element["State"]!)),
                      ],
                    )),
                  )
                      .toList(),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  child: buttonStyle("Submit", () {
                    placeOrder();
                  }
                  )
              )

            ],
          ),
        ),
      ),

    );
  }

}