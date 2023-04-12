import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stefomobileapp/UI/common.dart';

import '../Models/user.dart';

class DistributorDetailPage extends StatelessWidget{

  User user;
  DistributorDetailPage({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return DistributorDetailContent(user: user,);
  }

}

class DistributorDetailContent extends StatefulWidget{

  User user;
  DistributorDetailContent({super.key,required this.user});

  @override
  State<StatefulWidget> createState() {
    return DistributorDetailState();

  }

}

class DistributorDetailState extends State<DistributorDetailContent>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Distributor", () {

      }),
    );
  }

}