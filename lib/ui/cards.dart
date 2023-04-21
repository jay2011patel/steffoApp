import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/grade.dart';
import '../Models/lumpsum.dart';
import '../Models/order.dart';
import '../Models/user.dart';

Widget orderCard(BuildContext context, Order order, String? curr_user_id) {
  String org_name = " Bhagyodey Steel Corporation";
  return Card(
    elevation: 10,
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 7, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.user_name!,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                LayoutBuilder(builder: (context, constraints) {
                  if (curr_user_id == order.reciever_id) {
                    return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Sales",
                        ));
                  } else {
                    return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Purchase"));
                  }
                })
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Org Name:",
                    style: TextStyle(fontFamily: "Poppins_Bold"),
                  ),
                  padding: EdgeInsets.only(bottom: 5, right: 5),
                ),
                Text(
                  order.party_name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Status:", style: TextStyle(fontFamily: "Poppins_Bold")),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Text(order.status!),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order Date: ",
                    style: TextStyle(fontFamily: "Poppins_Bold")),
                Text(order.order_date!.substring(0, 10))
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget DistributorCard(User user, BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 5, right: 5),
    height: 160,
    //margin: EdgeInsets.only(top: 20),
    child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 10, left: 5),
                    child: Text(
                      user.userType!,
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                      textAlign: TextAlign.left,
                    )),
                Expanded(
                  flex: 0,
                  child: Container(
                      width: 250,
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        user.orgName!,
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.visible,
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      width: 300,
                      padding: EdgeInsets.only(top: 10, left: 5),
                      child: Text(
                        user.address!,
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(fontSize: 15)),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.visible,
                        maxLines: 4,
                      )),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                width: 82,
                child: Image.asset("assets/images/distributor.png"))
          ],
        )),
  );
}

Widget DealerCard(User user, BuildContext context) {
  return Container(
    width: 400,
    height: 160,
    // margin: EdgeInsets.only(top: 20,),
    child: Card(
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20)
        // ),
        elevation: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 10, left: 5),
                    child: Text(
                      user.userType!,
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue)),
                      textAlign: TextAlign.left,
                    )),
                Expanded(
                  flex: 0,
                  child: Container(
                      width: 200,
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        user.orgName!,
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.visible,
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      width: 250,
                      padding: EdgeInsets.only(top: 10, left: 5),
                      child: Text(
                        user.address!,
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(fontSize: 15)),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.visible,
                        maxLines: 4,
                      )),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                width: 70,
                child: Image.asset("assets/images/dealer.png"))
          ],
        )),
  );
}

Widget InventoryCard(BuildContext context, Lumpsum lumpsum) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Order id: ",
                      style: TextStyle(
                          fontFamily: "Cambria",
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width / 17,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: lumpsum.orderId.toString(),
                      style: TextStyle(
                          fontFamily: "Cambria",
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 17,
                          color: Colors.black)),
                ]),
              ),
            ),
            Align(
              child: RichText(
                text: TextSpan(style: TextStyle(), children: [
                  TextSpan(
                      text: "Per Ton Price: ",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.width / 30)),
                  TextSpan(
                      text: lumpsum.price,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.width / 30,
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
                    fontFamily: "Cambria",
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width / 30,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: lumpsum.date?.substring(0, 10),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width / 30))
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
              // DataColumn(
              //     label: Text(
              //   "Sr No",
              //   textAlign: TextAlign.center,
              // )),
              DataColumn(label: Text("Item name")),
              DataColumn(label: Text("Quantity (Tons)"))
            ],
            rows: [
              DataRow(
                cells: <DataCell>[
                  // DataCell(Text("1")), //Extracting from Map element the value

                  DataCell(Text(lumpsum.name!)),
                  DataCell(Text(lumpsum.qty!))
                ],
              )
            ]),
      ),
    ],
  );
}

Widget LumpSumTotal(BuildContext context, Grade g) {
  return Container(
      child: Row(
    children: [
      Expanded(
        flex: 6,
        child: Text(g.value.toString(),
            style: TextStyle(fontSize: 15, color: Colors.white)),
      ),
      Expanded(
        flex: 1,
        child: Text(":", style: TextStyle(fontSize: 15, color: Colors.white)),
      ),
      Expanded(
        flex: 2,
        child: Center(
            child: Text(g.qty.toString(),
                style: TextStyle(fontSize: 15, color: Colors.white))),
      ),
    ],
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.start,
  )
      // RichText(
      //     text: TextSpan(children: [
      //   TextSpan(
      //       text: g.value,
      //       style: TextStyle(
      //           color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
      //   TextSpan(
      //       text: ":",
      //       style: TextStyle(
      //           color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
      //   TextSpan(
      //       text: g.qty.toString(),
      //       style: TextStyle(
      //           color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
      // ])),
      );
}
