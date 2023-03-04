import 'package:flutter/material.dart';

Widget orderCard(BuildContext context, int index){
  String org_name=" Bhagyodey Steel Corporation";


  return Container(
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
          children: [
            Container(child: Text("Bill No:",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Poppins_Bold"),)),
            Container(
                padding: EdgeInsets.only(left: 30),
                child: Text("$index",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Poppins_Bold"),)),
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 7),
          child: Row(
            children: [

              Container(
                child: Text("Org Name:",style: TextStyle(fontFamily: "Roboto"),),
                padding: EdgeInsets.only(top: 5,bottom: 5,right: 5),
              ),

              Expanded(child: Text(org_name,overflow: TextOverflow.ellipsis,maxLines: 3,))
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Text("Status:"),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text("Dispatched"),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Text("Order Date: "),
              Text("22-02-2023")
            ],
          ),
        )

      ],
    ),
  );
}