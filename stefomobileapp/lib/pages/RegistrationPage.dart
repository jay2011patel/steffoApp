import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql_utils/mysql1/src/single_connection.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:http/http.dart' as http;
import '../UI/common.dart';

class RegistrationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child:RegistrationForm()
        )
      )
    );
    throw UnimplementedError();
  }

}
class RegistrationForm extends StatefulWidget{
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm>{

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController userType= TextEditingController();

  Future<void> register() async
  {
    String uri="http://localhost/steefo_api/register.php";
    var res = await http.post(Uri.parse(uri), body: {
      "firstName":firstName.text,
      "lastName": lastName.text,
      "email":email.text,
      "mobileNumber":mobileNumber.text,
      "userType":userType.text,
    });

    var response=jsonDecode(res.body);
    if(response["success"]=="true")
    {
      print("record inserted");
      firstName.text="";
      lastName.text="";
      email.text="";
      mobileNumber.text="";
      userType.text="";
    }
    else{
      print("some issue");
    }
  }

  @override
  Widget build(BuildContext context) {


    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 40, 10, 20),
        color: Color.fromRGBO(255, 255, 255, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            logo(context),

            //-----------------------FormDetails--------------------------

            SingleChildScrollView(
              child: Container(

                child: FormDetails(),
              )
            ),
            
            //----------------------------Submit--------------------------------
            
            Container(
              margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                child: buttonStyle("Submit", () {
                  register();
                }
                )
            )
          ],
        ),
      )
    );
  }

  Widget FormDetails(){
    List<DropdownMenuItem<String>> dropdownItems=[];
    List items = ["Distributor","Dealer"];
    List<DropdownMenuItem<String>> getItems(){

      for(int i = 0 ; i < items.length ;i++){
        DropdownMenuItem<String> it = DropdownMenuItem(
          value: items[i],
          child: Text(items[i]),
        );
        dropdownItems.add(it);
      }

      return dropdownItems;
    }
    return Column(
      children: [
        //--------------------------First Name------------------------------
        Container(

          width: width,
          padding: EdgeInsets.fromLTRB(5,0,5,5),
          child: TextFormField(
              controller: firstName,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                label: Text("First Name",style: TextStyle(fontFamily: "Poppins"),),
                border: OutlineInputBorder(
                    borderSide:   BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0)
                ),
              )
          ),
        ),


        //-----------------------LASTNAME-------------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: EdgeInsets.fromLTRB(5,5,5,5),
          child: TextFormField(
              controller: lastName,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                label: Text("Last Name",style: TextStyle(fontFamily: "Poppins"),),
                border: OutlineInputBorder(
                    borderSide:   BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0)
                ),
              )
          ),
        ),

        //-------------------------Email------------------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: EdgeInsets.fromLTRB(5,5,5,5),
          child: TextFormField(
              controller: email,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                label: Text("Email",style: TextStyle(fontFamily: "Poppins"),),
                border: OutlineInputBorder(
                    borderSide:   BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0)
                ),
              )
          ),
        ),

        //--------------------------------MobNum----------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: EdgeInsets.fromLTRB(5,5,5,5),
          child: TextFormField(
              controller: mobileNumber,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                label: Text("Mobile Number",style: TextStyle(fontFamily: "Poppins"),),
                border: OutlineInputBorder(
                    borderSide:   BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0)
                ),
              )
          ),
        ),

        //----------------------------UserType------------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: const EdgeInsets.fromLTRB(2,5,5,5),
          child: TextFormField(
              controller: userType,
              //controller: email,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                filled: true,
                fillColor: const Color.fromRGBO(233, 236, 239, 1.0),
                label: const Text("UserType",style: TextStyle(fontFamily: "Poppins"),),
                border: OutlineInputBorder(
                    borderSide:   BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0)
                ),
              )
          ),
        ),

        ],
      );
}

}