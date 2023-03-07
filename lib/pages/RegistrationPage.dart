import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../UI/common.dart';
import 'package:form_field_validator/form_field_validator.dart';

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

  String? selectedValue;
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mob_num = TextEditingController();
  TextEditingController user_type = TextEditingController();
  TextEditingController password = TextEditingController();

  onRegister() async{
    print(selectedValue);
   var test= await http.post(
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
   Navigator.of(context).pushNamed("/login");
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
              margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                child: buttonStyle("Submit", () {
                  onRegister();
                }
                )
            ),
        ]
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
          padding: const EdgeInsets.fromLTRB(5,0,5,5),
          child: TextFormField(
              controller: first_name,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                labelText: "First Name",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                // label: Text("First Name",style: TextStyle(fontFamily: "Poppins"),),
                border: OutlineInputBorder(
                    borderSide:   BorderSide.none,
                    //borderRadius: BorderRadius.circular(20.0)
                ),
              )
          ),
        ),


        //-----------------------LASTNAME-------------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: const EdgeInsets.fromLTRB(5,5,5,5),
          child: TextFormField(
              controller: last_name,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                labelText: "Last Name",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                // label: const Text("Last Name",style: TextStyle(fontFamily: "Poppins"),),
                border: OutlineInputBorder(
                    borderSide:   BorderSide.none,
                    // borderRadius: BorderRadius.circular(20.0)
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
            autovalidateMode: AutovalidateMode.always,
              controller: email,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                labelText: "Email",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                // label: Text("Email",style: TextStyle(fontFamily: "Poppins"),),
                border: OutlineInputBorder(
                    borderSide:   BorderSide.none,
                    // borderRadius: BorderRadius.circular(20.0)
                ),
              ),
              validator: EmailValidator(errorText: "Not Valid"),
          ),
        ),
        //--------------------------------Password------------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: EdgeInsets.fromLTRB(5,5,5,5),
          child: TextFormField(
              obscureText: true,
              controller: password,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                labelText: "Password",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                // label: Text("Password",style: TextStyle(fontFamily: "Poppins"),),
                border: OutlineInputBorder(
                    borderSide:   BorderSide.none,
                    // borderRadius: BorderRadius.circular(20.0)
                ),
              ),
            validator: MultiValidator([
              RequiredValidator(errorText: "Required"),
              MinLengthValidator(6, errorText: "Minimum 6 digit required")
            ])
            // validator: RequiredValidator(errorText: "Required"),

          ),
        ),


        //--------------------------------MobNum----------------------------

        Container(
          //margin: EdgeInsets.fromLTRB(20, 20,20,0),

          width: width,
          padding: EdgeInsets.fromLTRB(5,5,5,5),
          child: TextFormField(
              controller: mob_num,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: "Mobile Number",
                filled: true,
                fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                // label: Text("Mobile Number",style: TextStyle(fontFamily: "Poppins"),),
                border: OutlineInputBorder(
                    borderSide:   BorderSide.none,
                    // borderRadius: BorderRadius.circular(20.0)
                ),
              )
          ),
        ),

        //----------------------------UserType------------------------------

        Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                  hintText: "User Type",
                  filled: true,
                  fillColor: Color.fromRGBO(233, 236, 239, 0.792156862745098),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      // borderRadius: BorderRadius.circular(20)
                  )
              ),
              value: selectedValue,
              items: getItems(),
              onChanged: (String? newValue) {
                selectedValue = newValue;
              },
            )
        ),

        ],
      );
}

}