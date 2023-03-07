import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stefomobileapp/pages/DealerPage.dart';
import 'package:stefomobileapp/pages/GenerateChallanPage.dart';
import 'package:stefomobileapp/pages/GeneratedChallanPage.dart';
import 'package:stefomobileapp/pages/HomePage.dart';
import 'package:stefomobileapp/pages/InventoryPage.dart';
import 'package:stefomobileapp/pages/LoginPage.dart';
import 'package:stefomobileapp/pages/OrderPage.dart';
import 'package:stefomobileapp/pages/OrdersPage.dart';
import 'package:stefomobileapp/pages/RegistrationPage.dart';
import 'package:stefomobileapp/pages/RequestPage.dart';
import 'package:stefomobileapp/pages/ChallanListPage.dart';
import 'package:stefomobileapp/pages/PlaceOrderPage.dart';

import 'pages/LRPage.dart';
import 'UI/common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/lrpage': (BuildContext context) => LRPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegistrationPage(),
        '/home': (BuildContext context) => HomePage(),
        '/inventory': (BuildContext context) => InventoryPage(),
        '/dealer': (BuildContext context) => DealerPage(),
        '/orderreq': (BuildContext context) => RequestPage(),
        '/challanlist': (BuildContext context) => ChallanListPage(),
        '/placeorder': (BuildContext context) => PlaceOrderPage(),
        '/orders': (BuildContext context) => OrdersPage(),
        '/gnchallan': (BuildContext context) => GenerateChallanPage(),
        //'/order': (BuildContext context) => OrderDetails(),
        '/challan': (BuildContext context) => GeneratedChallan(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 4), () => Navigator.of(context).pushNamed('/lrpage'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(context).animate().fade(duration: Duration(seconds: 1)),
            //Form()
          ],
        ),
      ),
    );
  }
}
