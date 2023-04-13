import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/order.dart';
import '../Models/user.dart';

Widget orderCard(BuildContext context,Order order,String? curr_user_id){
  String org_name=" Bhagyoday Steel Corporation";

  print(curr_user_id);
  return Card(
    elevation: 10,
    child: Container(
      decoration: BoxDecoration( 
          color: curr_user_id == order.reciever_id ? Colors.blue:Colors.green,
          borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order No:",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Poppins_Bold"),),
              Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(order.order_id!,textAlign: TextAlign.left,)),
            ],
          ),Container(
            padding: EdgeInsets.only(top: 7,bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("Order From:",style: TextStyle(fontFamily: "Poppins_Bold"),),
                ),
                Text(order.user_name!,overflow: TextOverflow.ellipsis,maxLines: 3,)
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("Org Name:",style: TextStyle(fontFamily: "Poppins_Bold"),),
                  padding: EdgeInsets.only(bottom: 5,right: 5),
                ),
                Text(order.party_name!,overflow: TextOverflow.ellipsis,maxLines: 3,)
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Status:",style: TextStyle(fontFamily: "Poppins_Bold")),
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
                Text("Order Date: ",style: TextStyle(fontFamily: "Poppins_Bold")),
                Text(order.order_date!.substring(0,10))
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget DistributorCard(User user){
  return Container(
    height: 170,
    //margin: EdgeInsets.only(top: 20),
    child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 10,left: 5),
                    child: Text(user.userType!,style: GoogleFonts.raleway(textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green)),textAlign: TextAlign.left,)
                ),
                Expanded(
                  flex: 0,
                  child: Container(

                      width: 250,
                      padding: EdgeInsets.only(left: 5),
                      child: Text(user.orgName!,style: GoogleFonts.raleway(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),textAlign: TextAlign.left,overflow: TextOverflow.visible,)

                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      width: 250,

                      padding: EdgeInsets.only(top: 10,left: 5),
                      child: Text(user.address!,style: GoogleFonts.raleway(textStyle: TextStyle(fontSize: 15)),textAlign: TextAlign.left,overflow: TextOverflow.visible,maxLines: 4,)
                  ),
                ),


              ],
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius: BorderRadius.circular(20)
                ),
                width: 120,
                child: Image.asset("assets/images/distributor.png")
            )
          ],
        )
    ),
  );
}

Widget DealerCard(User user){
  return Container(
    height: 170,
    //margin: EdgeInsets.only(top: 20),
    child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 10,left: 5),
                    child: Text(user.userType!,style: GoogleFonts.raleway(textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.lightBlue)),textAlign: TextAlign.left,)
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                      width: 250,
                      padding: EdgeInsets.only(left: 5),
                      child: Text(user.orgName!,style: GoogleFonts.raleway(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),textAlign: TextAlign.left,overflow: TextOverflow.visible,)
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      width: 250,

                      padding: EdgeInsets.only(top: 10,left: 5),
                      child: Text(user.address!,style: GoogleFonts.raleway(textStyle: TextStyle(fontSize: 15)),textAlign: TextAlign.left,overflow: TextOverflow.visible,maxLines: 4,)
                  ),
                ),


              ],
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  //color: Colors.green,
                    borderRadius: BorderRadius.circular(20)
                ),
                width: 120,
                child: Image.asset("assets/images/dealer.png")
            )
          ],
        )
    ),
  );
}