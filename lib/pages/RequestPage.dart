import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stefomobileapp/ui/custom_tabbar.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import '../Models/order.dart';
import '../UI/common.dart';




class RequestPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return RequestContent();
  }

}

class RequestContent extends StatefulWidget{
  const RequestContent({super.key});
  final selected = 0;
  @override
  State<RequestContent> createState()=> _RequestPageState();
}


class _RequestPageState extends State<RequestContent>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Requests"),
        extendBodyBehindAppBar: false,
        body:RequestPageBody(),
        bottomNavigationBar: StylishBottomBar(
          option: AnimatedBarOptions(
            iconSize: 30,
            //barAnimation: BarAnimation.liquid,
            iconStyle: IconStyle.simple,
            opacity: 0.3,
          ),

          items: [
            BottomBarItem(
              icon: const Icon(Icons.home_filled,),
              title: const Text('Abc'),
              backgroundColor: Colors.red,
              selectedIcon: const Icon(Icons.home_filled,color:Colors.blueAccent),
            ),
            BottomBarItem(
                icon: const Icon(Icons.inventory_2_rounded,),
                title: const Text('Safety'),
                backgroundColor: Colors.orange,
                selectedIcon: const Icon(Icons.inventory_2_rounded,color:Colors.blueAccent)
            ),
            BottomBarItem(
                icon: const Icon(Icons.warehouse_rounded,),
                title: const Text('Safety'),
                backgroundColor: Colors.orange,
                selectedIcon: const Icon(Icons.warehouse_rounded,color:Colors.blueAccent)
            ),
            BottomBarItem(
                icon: const Icon(Icons.person_pin,),
                title: const Text('Cabin'),
                backgroundColor: Colors.purple,
                selectedIcon: const Icon(Icons.person_pin,color:Colors.blueAccent)
            ),
          ],
          //fabLocation: StylishBarFabLocation.center,
          hasNotch: false,
          onTap: (index) {
            setState(() {

              if(index==0){
                Navigator.of(context).popAndPushNamed('/home');
              }

              if(index==1){
                Navigator.of(context).popAndPushNamed('/inventory');
              }

              if(index==2){
                Navigator.of(context).popAndPushNamed('/dealer');              }

            });
          },
        )
    );
  }

  //----------------------------------PageBody----------------------------------

  String? id ="";

  List<Order> requestList= [];

  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var m = id;
    id = await prefs.getString('id');

    if(m!=id){

      final res = await http.post(
        Uri.parse("http://urbanwebmobile.in/steffo/vieworder.php"),

        body: {
          "id": id!
        },
      );
      var responseData = jsonDecode(res.body);
      print(responseData);


      for(int i = 0;i<responseData["data"].length;i++){
        Order req = Order();
        req.reciever_id = responseData["data"][i]["supplier_id"];
        req.party_name = responseData["data"][i]["partyName"];
        req.order_date = responseData["data"][i]["createdAt"];
        req.base_price = responseData["data"][i]["basePrice"];
        if(req.reciever_id == id){
          requestList.add(req);
        }
      }
      setState(() {});

    }
  }

  Widget RequestPageBody() {
    loadData();
    return Container(
      height: MediaQuery.of(context).size.height,

      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   transform: GradientRotation(1.07),
        //   colors: [
        //     Color.fromRGBO(75, 100, 160, 1.0),
        //     Color.fromRGBO(19, 59, 78, 1.0),
        //   ]
        // )
      ),
      child: SingleChildScrollView(
        child: Container(
          //margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(vertical: 20),

          width: MediaQuery.of(context).size.width,
          child: CustomTabBar(
            selectedCardColor: Colors.white,
            selectedTitleColor: Color.fromRGBO(12, 53, 68, 1),
            unSelectedCardColor: Color.fromRGBO(12, 53, 68, 1),
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                tabBarItemExtend: ((MediaQuery.of(context).size.width)/2),
                tabBarItems: ["Order","Registration"],
                tabViewItems: [

                  Container(child: OrderList()),

                  Container(child: RegistrationList())

                ],
                tabViewItemHeight: MediaQuery.of(context).size.height*0.7,

            ),
        ),
      ),
    );

  }

  //----------------------------------OrderList---------------------------------

  Widget OrderList(){
    return Card(
      shadowColor: Colors.grey,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.5),
          // borderRadius: BorderRadius.circular(8)
        ),
        height: 50,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Text("Orders",style: TextStyle(fontFamily: "Poppins_Bold"),)),
              Container(
                  child: ListView.builder(
                    itemCount: requestList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return orderRequestCard(context,requestList[index],(){});
                    },
                  ),
                ),

            ],
          ),
        )
      ),
    );
  }


//------------------------------RegistrationList--------------------------------


  Widget RegistrationList(){
    return Card(
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              borderRadius: BorderRadius.circular(5)
          ),
          height: 50,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Text("Registration",style: TextStyle(fontFamily: "Poppins_Bold"),)),
                Card(
                  child: Container(
                    child: ListView.builder(
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return RegistrationRequestCard(context, index);
                      },
                    ),
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }





}


//---------------------------------SingleOrderRequestWidget---------------------

Widget orderRequestCard(context,Order orderReq,c()){

  String org_name=" Bhuyangdev Steel Corporation";


  return Card(
    elevation: 20,
    shadowColor: Colors.black,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          //borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child: Text("Order Details",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Poppins_Bold"),)),
              Container(
                  //width: MediaQuery.of(context).size.width-200,
                  child: IconButton(onPressed: () async {
                    await http.post(
                      Uri.parse("http://urbanwebmobile.in/steffo/approveorder.php"),

                      body: {
                        "decision":"Approved",
                        "order_id": orderReq.order_id!
                      },
                    );
                    c();
                  }, icon: Icon(Icons.thumb_up_alt_rounded,color: Colors.green,))),
              IconButton(onPressed: () async {
                await http.post(
                  Uri.parse("http://urbanwebmobile.in/steffo/approveorder.php"),

                  body: {
                    "decision":"Denied",
                    "order_id": orderReq.order_id!
                  },
                );
                c();
              }, icon: Icon(Icons.thumb_down_alt_rounded,color: Colors.red,))
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  child: Text("Org Name:",style: TextStyle(fontFamily: "Poppins_Bold"),),
                  padding: EdgeInsets.symmetric(vertical: 5),
                ),

                Text(orderReq.party_name!,overflow: TextOverflow.ellipsis,maxLines: 3,)
              ],
            ),
          ),
          Container(
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order Date:",style:TextStyle(fontFamily: "Poppins_Bold"),),
                Text(orderReq.order_date!)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Base Price",style:TextStyle(fontFamily: "Poppins_Bold"),),
                Text(orderReq.base_price!)
              ],
            ),
          )

        ],
      ),
    ),
  );
}


//-------------------------------SingleRegistrationRequest----------------------

Widget RegistrationRequestCard(context,index){

  String org_name=" Bhuyangdev Steel Corporation";
  var region = ['Ahmedabad','Mehsana','Anand'];

  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
    ),
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("PlaceHolder"),
        Row(
          children: [
            Container(child: Text("Entity Details",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Poppins_Bold"),)),
            Container(
                width: MediaQuery.of(context).size.width-200,
                child: IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt_rounded,color: Colors.green,))),
            IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down_alt_rounded,color: Colors.red,))
          ],
        ),
        Container(
          child: Row(
            children: [

              Container(
                child: Text("Org Name:",style: TextStyle(fontFamily: "Roboto"),),
                padding: EdgeInsets.symmetric(vertical: 5),
              ),

              Expanded(child: Text(org_name,overflow: TextOverflow.ellipsis,maxLines: 3,))
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Text("Region:"),
              Text(region[index])
            ],
          ),
        ),

      ],
    ),
  );
}


