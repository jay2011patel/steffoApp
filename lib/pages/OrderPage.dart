import 'package:flutter/material.dart';

//import '../Models/gen_item_list.dart';
import '../UI/common.dart';

// void main(){
//   runApp(MaterialApp(
//     home: GeneratedChallan(),
//   ));
//
// }


class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderPage();
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    num ch_s_contact = 9898989898;
    //List<GeneratedItems> items;

    @override
    void initState() {
      // items = GeneratedItems.getItems();

      super.initState();
    }

    var listOfColumns =[
      {"Sr_no" :"1","Name" :"TMT FE500D 10 mm","Qty" :"1"}
    ];

    TextEditingController status = TextEditingController();
    status.text = "Approved";

    return Scaffold(

        appBar: appbar("Order"),
        body: Container(
          decoration: BoxDecoration(
              gradient:const LinearGradient(
                  transform: GradientRotation(1.57),
                  colors: [
                    Color.fromRGBO(75, 100, 160, 1.0),
                    Color.fromRGBO(19, 59, 78, 1.0),
                  ]
              )
          ),
          child: Center(
            child: SingleChildScrollView(
                child: Column(children: [

                  Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.70),
                      ),
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.85),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Shipping Address :",
                                      style: TextStyle(fontSize: 10)),
                                  Text("Shipping Address",
                                      style: TextStyle(fontSize: 10))
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text("Contact:", style: TextStyle(fontSize: 10)),
                                  Text("$ch_s_contact",
                                      style: TextStyle(fontSize: 10))
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.85),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Billing Address :",
                                        style: TextStyle(fontSize: 10)),
                                    Text("Billing Address",
                                        style: TextStyle(fontSize: 10))
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: [
                                    Text("Contact:", style: TextStyle(fontSize: 10)),
                                    Text("Contact no", style: TextStyle(fontSize: 10))
                                  ],
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.85),
                            ),
                            child: Row(
                              children: [
                                Text("Loading Type:", style: TextStyle(fontSize: 10)),
                                Text("Loading Type", style: TextStyle(fontSize: 10))
                              ],
                            )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.85),
                            ),
                            child: Row(
                              children: [
                                Text("Challan no:", style: TextStyle(fontSize: 10)),
                                Text("Challan no", style: TextStyle(fontSize: 10))
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.85),
                            ),
                            child: Row(
                              children: [
                                Text("Status: ", style: TextStyle(fontSize: 10)),
                                Text("Status", style: TextStyle(fontSize: 10))
                              ],
                            )),
                      ])),
                  SizedBox(
                    height: 10.0,
                  ),

                  Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.70),
                      ),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width - 20,
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0)),
                                // alignment: Alignment.center,
                                // padding: const EdgeInsets.only(top: 20),
                                child: SingleChildScrollView(
                                  child: DataTable(
                                    headingTextStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    columns: [
                                      DataColumn(label: Text("Sr\nNo")),
                                      DataColumn(label: Text("Item name")),
                                      DataColumn(label: Text("Quantity"))
                                    ],
                                    rows: listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
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
                                )),
                          ),
                        ],
                      )),
                  LayoutBuilder(builder: (context, constraints) {
                    if(status.text == "Pending"){
                      return Text("Y is greater than or equal to 10");
                    }else{
                      if(status.text == "Approved"){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        child: buttonStyle("View Challan", () {
                          Navigator.of(context).pushNamed("/challanlist");
                        }),
                      );
                    }else{
                        return(Container());
                      }
                  }})

                ])),
          ),
        ));
  }
}
