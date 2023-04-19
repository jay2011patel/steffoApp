import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:form_field_validator/form_field_validator.dart';


class NewPassPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return NewPasscontent();
  }
}

class NewPasscontent extends StatefulWidget {
  NewPasscontent({super.key});
  final selected = 0;
  @override
  State<NewPasscontent> createState() => _NewPassPageState();
}

class _NewPassPageState extends State<NewPasscontent>{
  bool _isPWVisible = false;
  bool _isPWVisible1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )
        )
      ],
        title: Center(
          child: Text("Create New Password",style: TextStyle(color: Color.fromRGBO(19, 59, 78, 1.0),fontFamily: "Poppins-bold",fontSize: 24),),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/images/newPassword1.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   "Por favor, informe o E-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para restauração de sua senha.",
                      //   style: TextStyle(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: _isPWVisible,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPWVisible = !_isPWVisible;
                              });
                            },
                            icon: Icon(_isPWVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        validator: EmailValidator(errorText: "Not Valid"),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: _isPWVisible1,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPWVisible1 = !_isPWVisible1;
                            });
                          },
                          icon: Icon(_isPWVisible1
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        ),
                        validator: EmailValidator(errorText: "Not Valid"),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 40,
                      ),


                      Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(onPressed: (){
                          Navigator.of(context).pushNamed("/OTP");
                        },style: ButtonStyle(),
                            child: Text("Save",style: TextStyle(fontSize: 20),)),
                      ),
                      // Container(
                      //   height: 60,
                      //   alignment: Alignment.centerLeft,
                      //   decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //       begin: Alignment.topLeft,
                      //       end: Alignment.bottomRight,
                      //       stops: [0.3, 1],
                      //       colors: [
                      //         Color(0xFFF58524),
                      //         Color(0XFFF92B7F),
                      //       ],
                      //     ),
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(5),
                      //     ),
                      //   ),
                      //   child: SizedBox.expand(
                      //     child: ElevatedButton(
                      //       child: Text(
                      //         "Send Code",
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.white,
                      //           fontSize: 20,
                      //         ),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //       onPressed: () {
                      //         Navigator.of(context).pushNamed("/OTP");
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}