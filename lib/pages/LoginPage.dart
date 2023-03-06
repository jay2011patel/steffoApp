import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stefomobileapp/pages/HomePage.dart';
import 'package:stefomobileapp/pages/RegistrationPage.dart';
import 'package:stefomobileapp/validator/validations.dart';

import '../UI/common.dart';


void main(){
  runApp(LoginPage());
}


class LoginPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  LoginContent();
    throw UnimplementedError();
  }
  
}

class LoginContent extends StatefulWidget{
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _loginPageState() ;
}

class _loginPageState extends State<LoginContent> {

  TextEditingController email = TextEditingController();
  TextEditingController pw = TextEditingController();
  bool userValid= true;
  bool _isPWVisible = true;

  onLogin(String email,String pw) async{

    var test= await http.post(

      Uri.parse('http://urbanwebmobile.in/steffo/login.php'),

      body: {
        "email": email,
        "password": pw,
      },

    );

    var responseData = json.decode(test.body);

    print(responseData);
    if(responseData["status"] == "200"){
      userValid = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', responseData["id"]);
      prefs.setString('firstName', responseData["firstName"]);
      prefs.setString('lastName', responseData["lastName"]);
      prefs.setString('email', responseData["email"]);
      prefs.setString('mobileNumber', responseData["mobileNumber"]);
      prefs.setString('parentId', responseData["parentId"]);

      Navigator.of(context).pushNamed("/home");

    }
    else{
      userValid = false;
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child : LoginForm())
    );
  }

  Widget LoginForm(){
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            //--------------------------StartOfChildren---------------------------

            Container(

                child: logo(context),
            ),

            Container(

              width: width,
              padding: EdgeInsets.fromLTRB(10,0,10,5),
              child: TextFormField(
                  controller: email,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderSide:   BorderSide.none,
                        //borderRadius: BorderRadius.circular(20.0)
                    ),
                  )
              ),
            ),

            //------------------------------Password-----------------------------

            Container(
              width: width,
              padding: EdgeInsets.fromLTRB(10,5,10,10),
              child: TextFormField(
                  controller: pw,
                  textAlign: TextAlign.left,
                  obscureText: _isPWVisible,
                  decoration: InputDecoration(

                    prefixIcon: Icon(Icons.lock_outline_rounded),

                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _isPWVisible = !_isPWVisible;
                      });
                    }, icon: Icon(Icons.remove_red_eye)) ,

                    filled: true,

                    fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                    hintText: "Password", //Text("Password",style: TextStyle(fontFamily: "Poppins"),),
                    border: OutlineInputBorder(

                        borderSide:   BorderSide.none, //<-- SEE HERE
                        //borderRadius: BorderRadius.circular(20.0)
                    ),
                  )
              ),
            ),

            LayoutBuilder(builder: (context, constraints) {
              if(!userValid){
                return Text("Incorrect Username or Password",style: TextStyle(color: Colors.red),);
              }else{
                return Text("");
              }
            }),

            //------------------------------LoginButton-----------------------------

            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: buttonStyle("Login",()=>{

                      onLogin(email.text,pw.text)
                    
                  })
              )
            ),
            //-----------------------------Register Now-------------------------
            Container(
              //margin: EdgeInsets.fromLTRB(20, 0,20,0),

              width: MediaQuery. of(context). size. width,
              padding: EdgeInsets.fromLTRB(20,0,20,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => )
                          // );
                        },
                        child: Text("Forgot Password ?")
                    )
                  ),
                  Container(
                    child: Text("|"),
                  ),
                  Container(
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                        child: Text("Register Now")
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

