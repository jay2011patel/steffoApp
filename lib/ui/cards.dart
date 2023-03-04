import 'package:flutter/material.dart';

import '../Models/order.dart';

Widget orderCard(BuildContext context,Order order){
  String org_name=" Bhagyodey Steel Corporation";


  return Card(
    elevation: 10,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
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
          ),
          Container(
            padding: EdgeInsets.only(top: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("Org Name:",style: TextStyle(fontFamily: "Poppins_Bold"),),
                  padding: EdgeInsets.only(top: 5,bottom: 5,right: 5),
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