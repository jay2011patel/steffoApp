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
          decoration: const BoxDecoration(
          //     gradient:
          //         LinearGradient(transform: GradientRotation(1.57), colors: [
          //   Color.fromRGBO(75, 100, 160, 1.0),
          //   Color.fromRGBO(19, 59, 78, 1.0),
          // ]
          //         )
          ),
          child: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width - 20,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 100,
                      child: Image.asset("assets/images/stefo_logo.png")),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    alignment: Alignment.centerRight,
                    //          alignment: Alignment.centerLeft,
                    child: Column(
                      //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            'Survey NO 311, Tajpur Road Vill- Bhat, Changodar, Ahmedabad, Gujarat- 382210',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                            maxLines: 3,
                            softWrap: true),
                        RichText(
                            text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Contact No: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            TextSpan(
                              text: "9879365399/9558622200",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            )
                          ],
                        )),
                        RichText(
                            text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Gst Number: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            TextSpan(
                              text: "24ADTFS5560M1ZB",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            )
                          ],
                        )),
                        RichText(
                            text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Pan Number: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            TextSpan(
                              text: "ADTFS5560M",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            )
                          ],
                        )),
                        // Text("Contact No: 9879365399/9558622200",
                        //     style: TextStyle(fontSize: 10),
                        //     textAlign: TextAlign.left),
                        // Text("Gst Number: 24ADTFS5560M1ZB",
                        //                     //     style: TextStyle(fontSize: 10)),
                        //                     // Text("Pan Number:ADTFS5560M",
                        //                     //     style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Card(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(0.20),
                    ),
                    child: Column(
                        children: [
                      Card(
                        child: Container(
                          padding:const  EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.50),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Shipping Address :",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    // padding: EdgeInsets.only(bottom: 25, top: 10),
                                    child: Text(
                                      "Survey NO 311, Tajpur Road Vill- Bhat, Changodar, Ahmedabad, Gujarat- 382210",
                                      style: TextStyle(fontSize: 10),
                                      maxLines: 4,
                                      softWrap: true,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  const Text("Contact:",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                  Text("$ch_s_contact",
                                      style:const  TextStyle(fontSize: 10))
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
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.85),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Billing Address :",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                    Expanded(
                                      // padding: EdgeInsets.only(bottom: 25, top: 10),
                                      child: Text(
                                          "Survey NO 311, Tajpur Road Vill- Bhat, Changodar, Ahmedabad, Gujarat- 382210",
                                          style: TextStyle(fontSize: 10),
                                          maxLines: 4,
                                          softWrap: true),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: const [
                                    Text("Contact:",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                    Text("Contact no",
                                        style: TextStyle(fontSize: 10))
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
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.85),
                            ),
                            child: Row(
                              children: const [
                                Text("Loading Type:",
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold)),
                                Text("Loading Type", style: TextStyle(fontSize: 10))
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.85),
                            ),
                            child: Row(
                              children: const [
                                Text("Challan no:",
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold)),
                                Text("Challan no", style: TextStyle(fontSize: 10))
                              ],
                            )),
                      ),
                    ]
                    )
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(0.20),
                  ),
                  child: Column(
                      children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: const [
                            Text("Transporter name:",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                            Text("Transporter", style: TextStyle(fontSize: 10))
                          ],
                        )
                    ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(children: [
                        Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: const [
                            //     Text("Transporter Address :",
                            //         style: TextStyle(
                            //             fontSize: 10,
                            //             fontWeight: FontWeight.bold)),
                            //     Expanded(
                            //       // padding: EdgeInsets.only(bottom: 25, top: 10),
                            //       child: Text(
                            //           "Survey NO 311, Tajpur Road Vill- Bhat, Changodar, Ahmedabad, Gujarat- 382210",
                            //           style: TextStyle(fontSize: 10),
                            //           maxLines: 4,
                            //           softWrap: true),
                            //     )
                            //   ],
                            // ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: const [
                                Text("Transporter Contact:",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                                Text("Contact no",
                                    style: TextStyle(fontSize: 10))
                              ],
                            ),
                          ],
                        )
                        ),
                        const SizedBox(
                      height: 10.0,
                        ),
                        Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                          child: Row(
                          children: const [
                            Text("LR no:",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                            Text("LR", style: TextStyle(fontSize: 10))
                          ],
                        )),
                        const SizedBox(
                      height: 10.0,
                        ),
                        Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: const [
                            Text("Vehicle no",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                            Text("Vehicle", style: TextStyle(fontSize: 10))
                          ],
                        )),
                        const SizedBox(
                      height: 10.0,
                        ),
                        Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text("Date :",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                            Text(
                              "DT",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )
                        ),
                      ]
                      )
                    ]
                  ),
                  ),
              ),



              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(0.20),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Items:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width - 20,
                          // padding: EdgeInsets.only(
                          //     top: 10, bottom: 10, left: 10, right: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              // borderRadius: BorderRadius.circular(20.0)
                          ),
                          // alignment: Alignment.center,
                          // padding: const EdgeInsets.only(top: 20),
                          // child: SingleChildScrollView(
                          //   padding: EdgeInsets.only(
                          //       top: 10, bottom: 10, left: 10, right: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Center(
                              child: DataTable(
                                headingTextStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                columns: const [
                                  DataColumn(label: Text("Sr. No.")),
                                  DataColumn(label: Text("Item name")),
                                  DataColumn(label: Text("Quantity"))
                                ],
                                rows: const [
                                  DataRow(cells: [
                                    DataCell(Text("1")),
                                    DataCell(Text("FE500")),
                                    DataCell(Text("100")),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("1")),
                                    DataCell(Text("FE500")),
                                    DataCell(Text("100")),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("1")),
                                    DataCell(Text("FE500")),
                                    DataCell(Text("100")),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("1")),
                                    DataCell(Text("FE500")),
                                    DataCell(Text("100")),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("1")),
                                    DataCell(Text("FE500")),
                                    DataCell(Text("100")),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ])),
          ),
        ));
  }
}
