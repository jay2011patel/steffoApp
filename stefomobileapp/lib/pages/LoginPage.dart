import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stefomobileapp/pages/HomePage.dart';
import 'package:stefomobileapp/pages/RegistrationPage.dart';
import 'package:stefomobileapp/validator/validations.dart';
import 'package:http/http.dart' as http;

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
  TextEditingController password = TextEditingController();

  Future<void> login() async
  {
    String uri="http://localhost/steefo_api/login.php";
    var res = await http.post(Uri.parse(uri), body: {
      "email":email.text,
      "password": password.text,

    });

    var response=jsonDecode(res.body);
    if(response["success"]=="true")
    {
      print("record inserted");
      email.text="";
      password.text="";
    }
    else{
      print("some issue");
    }
  }

  bool _isPWVisible = false;

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
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //--------------------------StartOfChildren---------------------------

            Container(

                child: logo(context),
            ),

            Container(
              //margin: EdgeInsets.fromLTRB(20, 20,20,0),

              width: width,
              padding: EdgeInsets.fromLTRB(10,0,10,5),
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

            //------------------------------Password-----------------------------

            Container(
              width: width,
              padding: EdgeInsets.fromLTRB(10,5,10,10),
              child: TextFormField(
                  controller: password,
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
                    label: Text("Password",style: TextStyle(fontFamily: "Poppins"),),
                    border: OutlineInputBorder(

                        borderSide:   BorderSide.none, //<-- SEE HERE
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  )
              ),
            ),

            //------------------------------LoginButton-----------------------------

            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: buttonStyle("Login",()=>{
                    login(),
                    if(validateLoginDetails(email.text,password.text)){
                      Navigator.of(context).pushNamed('/home')
                    }
                  }
                  ),
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

