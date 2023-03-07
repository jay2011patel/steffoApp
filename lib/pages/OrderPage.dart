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
          decoration: const BoxDecoration(
              // gradient:LinearGradient(
              //     transform: GradientRotation(1.57),
              //     colors: [
              //       Color.fromRGBO(75, 100, 160, 1.0),
              //       Color.fromRGBO(19, 59, 78, 1.0),
              //     ]
              // )
          ),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(10)),

                  Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.withOpacity(0.20),
                        ),
                        child: Column(children: [
                          Card(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text("Shipping Address :",
                                          style: TextStyle(fontSize: 13)),
                                      Text("Shipping Address",
                                          style: TextStyle(fontSize: 13))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      const Text("Contact:", style: TextStyle(fontSize: 13)),
                                      Text("$ch_s_contact",
                                          style: TextStyle(fontSize: 13))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            child: Container(
                                padding:const  EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children:const  [
                                        Text("Billing Address :",
                                            style: TextStyle(fontSize: 13)),
                                        Text("Billing Address",
                                            style: TextStyle(fontSize: 13))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      children:const  [
                                        Text("Contact:", style: TextStyle(fontSize: 13)),
                                        Text("Contact no", style: TextStyle(fontSize: 13))
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: const [
                                    Text("Loading Type:", style: TextStyle(fontSize: 13)),
                                    Text("Loading Type", style: TextStyle(fontSize: 13))
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children:const  [
                                    Text("Base Price:", style: TextStyle(fontSize: 13)),
                                    Text("Base Price", style: TextStyle(fontSize: 13))
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            child: Container(
                                // margin: EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: const [
                                    Text("Status: ", style: TextStyle(fontSize: 13)),
                                    Text("Status", style: TextStyle(fontSize: 13))
                                  ],
                                )),
                          ),
                        ])),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        // margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.withOpacity(0.20),
                        ),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Card(
                                child: Container(
                                    height: 300,
                                    width: MediaQuery.of(context).size.width - 20,
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10, left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20.0)),
                                    // alignment: Alignment.center,
                                    // padding: const EdgeInsets.only(top: 20),
                                    child: SingleChildScrollView(
                                      child: DataTable(
                                        headingTextStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        columns: const [
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
                            ),
                          ],
                        )
                    ),
                  ),
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
