import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stefomobileapp/UI/common.dart';

class UserRequestPage extends StatelessWidget {
  const UserRequestPage({Key? key}) : super(key: key);

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
                  Text("Distributor",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins_Bold",
                        fontSize: 17,
                        color: Colors.green,
                      )),SizedBox(height: 10),
                  Text("Business Name",
                      style: TextStyle(
                        fontFamily: "Poppins_Bold",
                        fontSize: 20,
                        color: Color.fromRGBO(19, 59, 78, 1),
                      )),SizedBox(height: 10),
                  Text("1104, Shilp Epitome,B/H Shyamvilla Bunglow,S G Highway,Ahmedabad",
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
                      Text("Phone Number:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
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
                      Text("xyz",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text("9876543210",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text("98765432",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text("abc@gmail.com",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text("OIUYTE947J",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text("325614789657",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text("KJ98HU36RH73HF7",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                      SizedBox(height:20),
                      Text("21/03/2023",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                      ),
                    ],
                  ),


                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}
