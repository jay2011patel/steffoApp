import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';
import '../UI/common.dart';

class LRPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirstScreen();

    throw UnimplementedError();
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(context),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(top: 150),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: buttonStyle("Login",
                      () => {Navigator.of(context).pushNamed('/login')})),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: buttonStyle("Register",
                      () => Navigator.of(context).pushNamed('/register'))),
            )
          ],
        ),
      ),
    );
  }
}
