import 'package:flutter/material.dart';

//import '../Models/gen_item_list.dart';
import '../UI/common.dart';

// void main(){
//   runApp(MaterialApp(
//     home: GeneratedChallan(),
//   ));
//
// }


class GeneratedChallan extends StatelessWidget {
  const GeneratedChallan({super.key});

  @override
  Widget build(BuildContext context) {
    return ChallanPage();
  }
}

class ChallanPage extends StatefulWidget {
  const ChallanPage({super.key});

  @override
  State<ChallanPage> createState() => _ChallanPageState();
}

class _ChallanPageState extends State<ChallanPage> {
  @override
  Widget build(BuildContext context) {
    num ch_s_contact = 9898989898;
    //List<GeneratedItems> items;

    @override
    void initState() {
     // items = GeneratedItems.getItems();

      super.initState();
    }

    return Scaffold(

        appBar: appbar("Challan"),
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
                width: MediaQuery.of(context).size.width - 20,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                    children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 5,
                      child: Image.asset("assets/images/stefo_logo.png")),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    //          alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Survey NO 311, Tajpur Road Vill- Bhat, Changodar, Ahmedabad, Gujarat- 382210',
                            style: TextStyle(fontSize: 10),
                            maxLines: 3,
                            softWrap: true),
                        Text("Contact No: 9879365399/9558622200",
                            style: TextStyle(fontSize: 10)),
                        Text("Gst Number: 24ADTFS5560M1ZB",
                            style: TextStyle(fontSize: 10)),
                        Text("Pan Number:ADTFS5560M",
                            style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 10.0,
              ),
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
                  ])),
              SizedBox(
                height: 10.0,
              ),
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
                      child: Row(
                        children: [
                          Text("Transporter name:",
                              style: TextStyle(fontSize: 10)),
                          Text("Transporter", style: TextStyle(fontSize: 10))
                        ],
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
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
                                Text("Transporter Address :",
                                    style: TextStyle(fontSize: 10)),
                                Text("Transporter Address",
                                    style: TextStyle(fontSize: 10))
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Text("Transporter Contact:",
                                    style: TextStyle(fontSize: 10)),
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
                            Text("LR no:", style: TextStyle(fontSize: 10)),
                            Text("LR", style: TextStyle(fontSize: 10))
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
                            Text("Vehicle no", style: TextStyle(fontSize: 10)),
                            Text("Vehicle", style: TextStyle(fontSize: 10))
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Date :", style: TextStyle(fontSize: 10)),
                            Text(
                              "DT",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )),
                  ]))
                ]),
              ),
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
                      Text(
                        "Items:",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
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
                                  DataColumn(label: Text("Sr. No.")),
                                  DataColumn(label: Text("Item name")),
                                  DataColumn(label: Text("Quantity"))
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(Text("1")),
                                    DataCell(Text("FE500")),
                                    DataCell(Text("100")),
                                  ])
                                ],
                              ),
                            )),
                      ),
                    ],
                  ))
            ])),
          ),
        ));
  }
}
