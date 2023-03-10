import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stefomobileapp/pages/HomePage.dart';
import 'package:stefomobileapp/pages/RegistrationPage.dart';
import 'package:stefomobileapp/validator/validations.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../UI/common.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const LoginContent();
    throw UnimplementedError();
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _loginPageState();
}

class _loginPageState extends State<LoginContent> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode focusNode1;
  late FocusNode focusNode2;
  final field1Key = GlobalKey<FormFieldState>();
  final field2Key = GlobalKey<FormFieldState>();

  TextEditingController email = TextEditingController();
  TextEditingController pw = TextEditingController();
  bool userValid = true;
  bool _isPWVisible = true;

  @override
  void initState() {
    super.initState();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();

    focusNode1.addListener(() {
      if (!focusNode1.hasFocus) {
        field1Key.currentState?.validate();
      }
    });
    focusNode2.addListener(() {
      if (!focusNode2.hasFocus) {
        field2Key.currentState?.validate();
      }
    });
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  onLogin(String email, String pw) async {
    var test = await http.post(
      Uri.parse('http://urbanwebmobile.in/steffo/login.php'),
      body: {
        "email": email,
        "password": pw,
      },
    );
    //Navigator.of(context).pushNamed("/home");

    var responseData = json.decode(test.body);

    print(responseData);
    if (responseData["status"] == "200") {
      userValid = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', responseData["id"]);
      prefs.setString('firstName', responseData["firstName"]);
      prefs.setString('lastName', responseData["lastName"]);
      prefs.setString('email', responseData["email"]);
      prefs.setString('mobileNumber', responseData["mobileNumber"]);
      prefs.setString('parentId', responseData["parentId"]);

      Navigator.of(context).pushNamed("/home");
      Fluttertoast.showToast(
          msg: 'Logged In Successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white);
    } else {
      userValid = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: LoginForm()));
  }

  Widget LoginForm() {
    return Container(
      child: Form(
        key: _formKey,
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
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: TextFormField(
                    key: field1Key,
                    focusNode: focusNode1,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Please enter an email.';
                      }
                      return null;
                    },
                    controller: email,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Email",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: Color.fromRGBO(233, 236, 239, 1.0),
                      // hintText: "Email",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        //borderRadius: BorderRadius.circular(20.0)
                      ),
                    )),
              ),

              //------------------------------Password-----------------------------

              Container(
                width: width,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: TextFormField(
                    key: field2Key,
                    focusNode: focusNode2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password.';
                      }
                      // if (value.length < 8) {
                      //   return 'Incorrect Password';
                      // }
                      return null;
                    },
                    controller: pw,
                    textAlign: TextAlign.left,
                    obscureText: _isPWVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline_rounded),

                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPWVisible = !_isPWVisible;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye)),

                      filled: true,

                      fillColor: const Color.fromRGBO(233, 236, 239, 1.0),
                      hintText:
                          "Password", //Text("Password",style: TextStyle(fontFamily: "Poppins"),),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none, //<-- SEE HERE
                        //borderRadius: BorderRadius.circular(20.0)
                      ),
                    )),
              ),

              LayoutBuilder(builder: (context, constraints) {
                if (!userValid) {
                  return const Text(
                    "Incorrect Username or Password",
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return const Text("");
                }
              }),

              //------------------------------LoginButton-----------------------------

              Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      child: buttonStyle(
                          "Login",
                          () => {
                                if (_formKey.currentState!.validate())
                                  {onLogin(email.text, pw.text)}
                              }))),
              //-----------------------------Register Now-------------------------
              Container(
                //margin: EdgeInsets.fromLTRB(20, 0,20,0),

                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
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
                            child: const Text("Forgot Password ?"))),
                    Container(
                      child: const Text("|"),
                    ),
                    Container(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          child: const Text("Register Now")),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
