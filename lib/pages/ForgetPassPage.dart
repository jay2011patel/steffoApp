import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:form_field_validator/form_field_validator.dart';


class ForgetPassPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ForgetPasscontent();
  }
}

class ForgetPasscontent extends StatefulWidget {
  ForgetPasscontent({super.key});
  final selected = 0;
  @override
  State<ForgetPasscontent> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPasscontent>{
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
          child: Text("Forgot Password",style: TextStyle(color:Color.fromRGBO(19, 59, 78, 1.0),fontFamily: "Poppins-bold",fontSize: 24),),
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
                        child: Image.asset("assets/images/wrong-password.png"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
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
                            child: Text("Send Code",style: TextStyle(fontSize: 20),)),
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