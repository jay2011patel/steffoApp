import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../UI/common.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: SingleChildScrollView(child: RegistrationForm())));
    throw UnimplementedError();
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String? selectedValue;
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mob_num = TextEditingController();
  TextEditingController user_type = TextEditingController();
  TextEditingController password = TextEditingController();

  onRegister() async {
    print(selectedValue);
    var test = await http.post(
      Uri.parse('http://urbanwebmobile.in/steffo/register.php'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      body: {
        "firstName": first_name.text,
        "lastName": last_name.text,
        "email": email.text,
        "password": password.text,
        "mobileNumber": mob_num.text,
        "userType": selectedValue!,
      },
    );

    print(jsonEncode(<String, String>{
      'firstName': first_name.text,
      'lastName': last_name.text,
      'email': email.text,
      'password': password.text,
      'mobileNumber': mob_num.text,
      'userType': selectedValue!,
    }));
    print(test.request);
    print(test.body);
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
          )),

          //----------------------------Submit--------------------------------

          Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              child: buttonStyle("Submit", () {
                onRegister();
              }))
        ],
      ),
    ));
  }

  Widget FormDetails() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    List items = ["Distributor", "Dealer"];
    List<DropdownMenuItem<String>> getItems() {
      for (int i = 0; i < items.length; i++) {
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
          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: TextFormField(
              controller: first_name,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                label: Text(
                  "First Name",
                  style: TextStyle(fontFamily: "Poppins"),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  //borderRadius: BorderRadius.circular(20.0)
                ),
              )),
        ),

        //-----------------------LASTNAME-------------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: TextFormField(
              controller: last_name,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                label: Text(
                  "Last Name",
                  style: TextStyle(fontFamily: "Poppins"),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0)),
              )),
        ),

        //-------------------------Email------------------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: TextFormField(
              controller: email,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                label: Text(
                  "Email",
                  style: TextStyle(fontFamily: "Poppins"),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0)),
              )),
        ),
        //--------------------------------Password------------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: TextFormField(
              obscureText: true,
              controller: password,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                label: Text(
                  "Password",
                  style: TextStyle(fontFamily: "Poppins"),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0)),
              )),
        ),

        //--------------------------------MobNum----------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: TextFormField(
              controller: mob_num,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                label: Text(
                  "Mobile Number",
                  style: TextStyle(fontFamily: "Poppins"),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0)),
              )),
        ),

        //----------------------------UserType------------------------------

        Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                  hintText: "User Type",
                  filled: true,
                  fillColor:
                      const Color.fromRGBO(233, 236, 239, 0.792156862745098),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
              value: selectedValue,
              items: getItems(),
              onChanged: (String? newValue) {
                selectedValue = newValue;
              },
            )),
      ],
    );
  }
}
