import 'dart:convert';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stefomobileapp/UI/common.dart';
import 'package:http/http.dart' as http;
import '../Models/order.dart';
import '../Models/user.dart';
import '../ui/cards.dart';
import 'DealerDetailPage.dart';
import 'OrderPage.dart';

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
      appBar: appbar("Distributor Info", () {
        Navigator.pop(context);
      }),
      body: DistributorDetailPageBody(),

    );
  }

  var f = 0 ;
  String? id;
  List<User> child = [];
  List<Order> orderList = [];
  loadChildData() async {
    if(f == 0){
      orderList = [];
      child = [];
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var id = await prefs.getString('id');
      String uri;
      uri = "http://urbanwebmobile.in/steffo/getchildren.php";

      var res = await http.post(Uri.parse(uri), body: {
        "id": widget.user.id,
      });

      var responseData = json.decode(res.body);
      print(responseData['data'].length);
      for (int i = 0; i < responseData['data'].length; i++) {
        User u = User();
        u.id = responseData["data"][i]["id"];
        u.userType = responseData["data"][i]["userType"];
        u.orgName = responseData["data"][i]["orgName"];
        u.address = responseData["data"][i]["address"];
        u.email = responseData["data"][i]["email"];
        u.mobileNumber = responseData["data"][i]["mobileNumber"];
        u.gstNumber = responseData["data"][i]["gstNumber"];
        u.panNumber = responseData["data"][i]["panNumber"];
        u.adhNumber = responseData["data"][i]["adhNumber"];
        print(u);
        child.add(u);
      }

      res = await http.post(
        Uri.parse("http://urbanwebmobile.in/steffo/vieworder.php"),

        body: {
          "id": widget.user.id!
        },
      );
      responseData = jsonDecode(res.body);
      //print(responseData);

      for(int i = 0;i<responseData["data"].length;i++){
        Order req = Order();
        req.reciever_id = responseData["data"][i]["supplier_id"];
        req.user_id = responseData["data"][i]["user_id"];
        req.user_mob_num = responseData["data"][i]["mobileNumber"];
        req.user_name = responseData["data"][i]["firstName"]+" " +responseData["data"][i]["lastName"];
        req.status = responseData["data"][i]["orderStatus"];
        req.party_name = responseData["data"][i]["partyName"];
        req.party_address = responseData["data"][i]["shippingAddress"];
        req.billing_address = responseData["data"][i]["address"];
        req.party_mob_num = responseData["data"][i]["partyMobileNumber"];
        req.loading_type = responseData["data"][i]["loadingType"];
        req.order_date = responseData["data"][i]["createdAt"];
        req.base_price = responseData["data"][i]["basePrice"];
        req.order_id = responseData["data"][i]["order_id"].toString();
        //print(req);
        orderList.add(req);
      }
      f=1;
      setState(() {});
    }


  }
  Widget DistributorDetailPageBody(){
    loadChildData();
    return Column(
      children: [
        Stack(
          children: [
            // Padding(padding: EdgeInsets.only(bottom: 10)),
            Card(
              // margin: EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 15,
                child:Column(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                        child:Text(widget.user.orgName!,style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green)),)
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child:Text(widget.user.address!,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15)),)
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email Id :",style: GoogleFonts.poppins(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                          Text(widget.user.email!,style: TextStyle(fontSize: 15),)
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mobile Number :",style: GoogleFonts.poppins(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                          Text(widget.user.mobileNumber!,style: TextStyle(fontSize: 15),)
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Gst Number :",style: GoogleFonts.poppins(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                          Text(widget.user.gstNumber!,style: TextStyle(fontSize: 15),)
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PAN Number :",style: GoogleFonts.poppins(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                          Text(widget.user.panNumber!,style: TextStyle(fontSize: 15),)
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Aadhar Number :",style: GoogleFonts.poppins(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                          Text(widget.user.adhNumber!,style: TextStyle(fontSize: 15),)
                        ],
                      ),
                    ),
                    SizedBox(height: 10,)


                  ],
                )
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(widget.user.userType!,style: TextStyle(color: Colors.white),),

              ),
            )
          ],
        ),

        Expanded(
          flex: 1,
          child: ContainedTabBarView(
            tabBarProperties: TabBarProperties(
                background: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                )),
            tabs: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Dealers', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Orders', style: TextStyle(color: Colors.black)),
                ],
              ),
            ],
            views: [
              Card(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10),
                // ),
                margin: EdgeInsets.all(5),
                elevation: 10,
                child: SingleChildScrollView(
                  child: Container(
                    width: 500,
                    // width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: child.length,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => DealerDetailPage(user: child[index])
                                  )
                                  );
                                },

                                child: DealerCard(child[index],context)
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(5),
                elevation: 10,
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: orderList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => OrderPage(order: orderList[index],)
                                  )
                                  );
                                },

                                child: orderCard(context,orderList[index],widget.user.id)
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )


            ],
          )
        ),
      ],
    );


  }


}
