import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/services.dart';
import 'package:stefomobileapp/pages/ForgetPassPage.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OTPContent();
  }
}

class OTPContent extends StatefulWidget {

  @override
  State<OTPContent> createState() => _OTPPageState();
}


class _OTPPageState extends State<OTPContent>{
  // final _pinPutController = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )
          )
        ],
        title: Center(
          child: Text("Verify Your Email",style: TextStyle(color:Color.fromRGBO(19, 59, 78, 1.0),fontFamily: "Poppins-bold",fontSize: 24),),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body:

      Container(
        padding: EdgeInsets.only(top: 60),
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
                        child: Image.asset("assets/images/otp.png"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   "Forget Password",
                      //   style: TextStyle(
                      //     fontSize: 32,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
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
                      // defaultPinTheme(),
                      SizedBox(
                        child: Pinput(
                          length: 4,
                          animationDuration: Duration.zero,
                          defaultPinTheme: PinTheme(
                            height: 60,
                            width: 50,
                            textStyle: TextStyle(
                              fontSize: 25,
                              fontFamily: "Poppins"
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black .withOpacity(0.30)
                              )
                            )
                          ),

                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),



                      // Container(
                      //   child: darkRoundedPinPut(),
                      // ),
                      Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(onPressed: (){
                          Navigator.of(context).pushNamed("/newPass");
                        },style: ButtonStyle(),
                            child: Text("Verify",style: TextStyle(fontSize: 20),)),
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
                      //         "Verify",
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.white,
                      //           fontSize: 20,
                      //         ),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //       onPressed: () {},
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