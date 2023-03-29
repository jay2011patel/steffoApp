import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stefomobileapp/UI/common.dart';
import 'package:http/http.dart' as http;
import '../Models/user.dart';
import 'HomePage.dart';

class UserRequestPage extends StatelessWidget {
  final User user;
  const UserRequestPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Requests", () {
        print("Back Pressed");
        Navigator.pop(context);
      }),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          Card(
            shadowColor: Colors.grey,
            elevation: 5,
            child: Container(
              // height: 100,
              width: 700,
              // alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20, top: 10,bottom: 10),
              // color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.userType!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins_Bold",
                        fontSize: 17,
                        color: Colors.green,
                      )),SizedBox(height: 10),
                  Text(user.orgName!,
                      style: TextStyle(
                        fontFamily: "Poppins_Bold",
                        fontSize: 20,
                        color: Color.fromRGBO(19, 59, 78, 1),
                      )),SizedBox(height: 10),
                  Text(user.address!,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        color: Colors.grey,
                      )
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),

          Card(
            child: Container(
              width: 500,
              padding: EdgeInsets.only(top: 20,bottom: 20,left: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
                      Text("Person Name:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                      ),
                      SizedBox(height:20),
                      Text("Contact Number:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                      ),
                      SizedBox(height:20),
                      Text("Email:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                      ),
                      SizedBox(height:20),
                      Text("PAN Number:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                      ),
                      SizedBox(height:20),
                      Text("Aadhar Number:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                      ),
                      SizedBox(height:20),
                      Text("GST Number:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                      ),
                      SizedBox(height:20),
                      Text("Registered date:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
                      Text(user.firstName! + user.lastName!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text(user.mobileNumber!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      // Text("98765432",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      // ),
                      // SizedBox(height:20),
                      Text(user.email!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text(user.gstNumber!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text(user.panNumber!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text(user.adhNumber!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text("21/03/2023",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(102, 178, 83, 1.0)
                ),
                onPressed: () async{
                  var f =0;
                  await AlertDialog();

                  if(f ==1){
                    final res = await http.post(
                      Uri.parse(
                          "http://urbanwebmobile.in/steffo/approveuser.php"),
                      body: {"decision": "Approve", "id": user.id},
                    );
                  }
                },
                child: Text("Approve")
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 113, 91)
                ),
                onPressed: () async{

                  final res = await http.post(
                    Uri.parse("http://urbanwebmobile.in/steffo/approveuser.php"),
                    body: {
                      "decision":"Reject",
                      "id": user.id
                    },

                  );
                  Navigator.of(context).popUntil((route){
                    if(route.isFirst){
                      return false;
                    }else{
                      return true;
                    }
                  });
                },
                child: Text("Reject")
            ),
          )
        ],
      ),
    );
  }
}
