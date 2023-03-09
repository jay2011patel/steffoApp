import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import '../Models/gen_item_list.dart';
import '../Models/order.dart';
import '../UI/common.dart';

// void main(){
//   runApp(MaterialApp(
//     home: GeneratedChallan(),
//   ));
//
// }


class OrderDetails extends StatelessWidget {
  Order order;
  OrderDetails({super.key,required this.order});


  @override
  Widget build(BuildContext context) {
    return OrderPage(order: order);
  }
}

class OrderPage extends StatefulWidget {

  const OrderPage({Key? key, required this.order}):
  super(key:key);
  final Order order;
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  @override
  Widget build(BuildContext context) {
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
    //status.text = widget.order.status!;

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
                      const Padding(padding: EdgeInsets.all(10)),

                  Card(
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.withOpacity(0.20),
                        ),
                        child: Column(children: [
                          Card(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Shipping Address :",
                                          style: TextStyle(fontSize: 15,fontFamily: "Poppins_Bold")),
                                      Text(widget.order.party_address!,
                                          style: const TextStyle(fontSize: 15,fontFamily: "Poppins_Bold"))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Contact:", style: TextStyle(fontSize: 15,fontFamily: "Poppins_Bold")),
                                      Text(widget.order.party_mob_num!,
                                          style: const TextStyle(fontSize: 15,fontFamily: "Poppins_Bold"))
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        const Text("Billing Address :",
                                            style: TextStyle(fontSize: 15,fontFamily: "Poppins_Bold")),
                                        Text(widget.order.user_id!,
                                            style: const TextStyle(fontSize: 15,fontFamily: "Poppins_Bold"))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        const Text("Contact:", style: TextStyle(fontSize: 15,fontFamily: "Poppins_Bold")),
                                        Text(widget.order.user_id!, style: const TextStyle(fontSize: 15,fontFamily: "Poppins_Bold"))
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    const Text("Loading Type:", style: TextStyle(fontSize: 15,fontFamily: "Poppins_Bold")),
                                    Text(widget.order.loading_type!, style: const TextStyle(fontSize: 15,fontFamily: "Poppins_Bold"))
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    const Text("Base Price:", style: TextStyle(fontSize: 15,fontFamily: "Poppins_Bold")),
                                    Text(widget.order.base_price!, style: const TextStyle(fontSize: 15,fontFamily: "Poppins_Bold"))
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children:  [
                                    const Text("Status: ", style: TextStyle(fontSize: 15,fontFamily: "Poppins_Bold")),
                                    Text(widget.order.status!, style: const TextStyle(fontSize: 15,fontFamily: "Poppins_Bold"))
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
                        padding: const EdgeInsets.all(10),
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
                    if(widget.order.status == "Pending"){
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(flex:40,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await http.post(
                                        Uri.parse("http://urbanwebmobile.in/steffo/approveorder.php"),

                                        body: {
                                          "decision":"Approved",
                                          "order_id": widget.order.order_id!
                                        },
                                      );
                                      widget.order.status="Confirmed";
                                      setState(() {

                                      });
                                    },
                                    child: Text("Confirm",style: TextStyle(color: Colors.green,fontSize: 15,fontFamily: "Poppins_Bold"),),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white
                                    )
                                )
                            ),
                            const SizedBox(
                              width: 10,
                            )
                            ,
                            Expanded(flex:40,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await http.post(
                                        Uri.parse("http://urbanwebmobile.in/steffo/approveorder.php"),

                                        body: {
                                          "decision":"Denied",
                                          "order_id": widget.order.order_id!
                                        },
                                      );
                                      widget.order.status="Denied";
                                      setState(() {

                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white
                                    ),
                                    child: const Text("Reject",style: TextStyle(color: Colors.red,fontSize: 15,fontFamily: "Poppins_Bold"))
                                )
                            ),
                          ],
                        ),
                      );
                    }else{
                      if(widget.order.status == "Confirmed"){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
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
