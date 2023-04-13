
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:stefomobileapp/UI/common.dart';
// import 'package:stefomobileapp/pages/EditableProfilePage.dart';
import 'package:stefomobileapp/pages/InventoryPage.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

// import '../Models/order.dart';
import '../Models/user.dart';
import 'DealerPage.dart';
import 'HomePage.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileContent();
  }
}


class ProfileContent extends StatefulWidget {
  ProfileContent({super.key});
  // final selected = 0;
  @override
  State<ProfileContent> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileContent>{

  String? id,firstName,lastName,email,mobileNumber,address,orgName,adhNumber,gstNumber,panNumber;
  var f =0 ;
  User user = User();
  loadData() async {
    if(f==0){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      user.id = await prefs.getString('id');
      user.firstName = await prefs.getString('firstName');
      user.lastName = await prefs.getString("lastName");
      user.email = await prefs.getString("email");
      user.mobileNumber = await prefs.getString("mobileNumber");
      user.orgName = await prefs.getString("orgName");
      user.gstNumber = await prefs.getString("gstNumber");
      user.panNumber = await prefs.getString("panNumber");
      user.adhNumber = await prefs.getString("adhNumber");
      user.address = await prefs.getString("address");
      f=1;
      setState(() {

      });
    }
  }

  var _selected = 3;
  onRegister() async{
    Navigator.of(context).pushNamed("/editprofile");
  }

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar("Profile", () {
          print("Back Pressed");
          Navigator.pop(context);
        }),

        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children:[
              Align(alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.topLeft,
                    width: 100,
                    child: ElevatedButton(onPressed: () {
                        onRegister();
                      },
                      child: Text("Edit"),)),
              ),
              // ElevatedButton(
              //     onPressed: () { EditableProfilePage(); },
              //     child: const Text("Edit")),
              Text("Your Information",style: TextStyle(fontSize: 25,color:Color.fromRGBO(19, 59, 78, 1.0),fontFamily: "Poppins_Bold")),
              Padding(padding: EdgeInsets.only(left: 30,top: 20)),

              // Container(
              //   color: Colors.white,
              //   padding: EdgeInsets.only(left: 10,top: 20,bottom: 20),
              //   // height: 100,
              //   width: 500,
              //   child: Column(
              //     children: [
              //
              //       imageProfile(context),
              //     ],
              //   ),
              // ),
              Container(
                alignment: Alignment.topLeft,
                // color: Colors.orangeAccent,
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  children:[
                    Align(alignment: Alignment.topLeft,),
                    Card(
                      child: Container(
                        width: 500,
                        padding: EdgeInsets.only(top: 20,bottom: 20,left: 20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
                                Text("Name:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                                ),
                                SizedBox(height:20),
                                Text("business Name:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                                ),
                                SizedBox(height:20),
                                Text("Contact Number:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                                ),
                                SizedBox(height:20),
                                Text("Email:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                                ),
                                SizedBox(height:20),
                                Text("GST Number:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                                ),
                                SizedBox(height:20),
                                Text("PAN Number:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                                ),
                                SizedBox(height:20),
                                Text("Aadhar Number:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                                ),
                                SizedBox(height:20),
                                Text("Address:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                                ),
                                SizedBox(height:20),
                                Text("Registered date:",style: TextStyle(fontFamily: "Poppins_Bold", fontSize: 15, color: Color.fromRGBO(19, 59, 78, 1))
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
                                Text(user.firstName! +" "+ user.lastName!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                                ),
                                SizedBox(height:20),
                                Text(user.orgName!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                                ),
                                SizedBox(height:20),
                                Text(user.mobileNumber!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                                ),
                                SizedBox(height:20),
                                // Text("98765432",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                                // ),
                                // SizedBox(height:20),
                                Text(user.email!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                                ),
                                SizedBox(height:20),
                                Text(user.gstNumber!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                                ),
                                SizedBox(height:20),
                                Text(user.panNumber!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                                ),
                                SizedBox(height:20),
                                Text(user.adhNumber!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                                ),
                                SizedBox(height:20),
                                Text(user.address!,style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                                ),
                                SizedBox(height:20),
                                Text("21/03/2023",style: TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.grey)
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // IconButton(
                    //     icon: Icon(
                    //       Icons.edit,
                    //       color: Color(0xFF8D8D8D),
                    //     ),
                    //     onPressed: null),
                    // Row(
                    //   children: [
                    //     Text("Your Information",style: TextStyle(fontSize: 25,color:Color.fromRGBO(19, 59, 78, 1.0),fontFamily: "Poppins_Bold")),
                    //   ],
                    // ),
                    // Padding(padding: EdgeInsets.only(bottom: 10,top: 10)),
                    // Card(
                    //   elevation: 5,
                    //   child: Text("Name"
                    //   ),
                    // ),
                    //
                    // SizedBox(
                    //   height: 10,
                    // ),
                    //
                    // Card(
                    //   elevation: 5,
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             width: 1, color: Colors.black),
                    //         //<-- SEE HERE
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(width: 2, color: Colors.indigo),
                    //       ),
                    //       labelText: "Business Name",
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Card(
                    //   elevation: 5,
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             width: 1, color: Colors.black), //<-- SEE HERE
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(width: 2, color: Colors.indigo),
                    //       ),
                    //       labelText: "Contact Number",
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //     ),
                    //   ),
                    // ),
                    //
                    // SizedBox(
                    //   height: 10,
                    // ),
                    //
                    // Card(
                    //   elevation: 5,
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             width: 1, color: Colors.black), //<-- SEE HERE
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(width: 2, color: Colors.indigo),
                    //       ),
                    //       labelText: "Email",
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Card(
                    //   elevation: 5,
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             width: 1, color: Colors.black), //<-- SEE HERE
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(width: 2, color: Colors.indigo),
                    //       ),
                    //       labelText: "GST Number",
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    //
                    // Card(
                    //   elevation: 5,
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //         border: OutlineInputBorder(
                    //             borderSide: BorderSide(
                    //                 width: 1,color: Colors.black)
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(width: 2,color: Colors.indigo)
                    //         ),
                    //         labelText: "PAN Number",
                    //         floatingLabelBehavior: FloatingLabelBehavior.never
                    //     ),
                    //   ),
                    // ),
                    //
                    // SizedBox(
                    //   height: 10,
                    // ),
                    //
                    // Card(
                    //   elevation: 5,
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             width: 1, color: Colors.black), //<-- SEE HERE
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(width: 2, color: Colors.indigo),
                    //       ),
                    //       labelText: "Aadhar Number",
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Card(
                    //   elevation: 5,
                    //   child: TextFormField(
                    //     // minLines: 1,
                    //     maxLines: 4,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             width: 1, color: Colors.black), //<-- SEE HERE
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(width: 2, color: Colors.indigo),
                    //       ),
                    //       labelText: "Address",
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //     ),
                    //   ),
                    // ),

                    Container(
                        margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        width: MediaQuery.of(context).size.width,
                        child: buttonStyle("Save", () {
                        }
                        )
                    )
                  ],
                ),
              ),
          ]
            ),
          ),
        ),
        bottomNavigationBar: StylishBottomBar(
          option: AnimatedBarOptions(
            iconSize: 30,
            barAnimation: BarAnimation.fade,
            //barAnimation: BarAnimation.liquid,
            iconStyle: IconStyle.simple,
            opacity: 0.3,
          ),

          items: [
            BottomBarItem(
              icon: const Icon(
                Icons.home_filled,
              ),
              title: const Text('Abc'),
              backgroundColor: Colors.red,
              selectedIcon:
              const Icon(Icons.home_filled, color: Colors.blueAccent),
            ),
            BottomBarItem(
                icon: const Icon(
                  Icons.inventory_2_rounded,
                ),
                title: const Text('Safety'),
                backgroundColor: Colors.orange,
                selectedIcon: const Icon(Icons.inventory_2_rounded,
                    color: Colors.blueAccent)),
            BottomBarItem(
                icon: const Icon(
                  Icons.warehouse_rounded,
                ),
                title: const Text('Safety'),
                selectedIcon: const Icon(Icons.warehouse_rounded,
                    color: Colors.blueAccent)),
            BottomBarItem(
                icon: const Icon(
                  Icons.person_pin,
                ),
                title: const Text('Cabin'),
                backgroundColor: Colors.purple,
                selectedIcon:
                const Icon(Icons.person_pin, color: Colors.blueAccent)),
          ],
          //fabLocation: StylishBarFabLocation.center,
          hasNotch: false,
          currentIndex: _selected,
          onTap: (index) {
            setState(() {
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => HomePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }
              if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => InventoryPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }

              if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => DealerPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );              }
            });
          },
        )
    );

  }
// Widget imageProfile(BuildContext context){
// return Stack(
//   // alignment: Alignment.topLeft,
//   children:[
//     Align(alignment: Alignment.topRight),
//     CircleAvatar(
//       radius: 50,
//       backgroundImage: AssetImage("assets/images/profile.png"),
//     ),
//     Positioned(
//         bottom: 10,
//         left: 60,
//         child: InkWell(
//           onTap: (){
//             showModalBottomSheet<void>(
//               context: context,
//               builder: (BuildContext context) {
//                 return SizedBox(
//                   height: 150,
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         IconButton(onPressed: (){}, icon: Icon(Icons.camera)),
//                         IconButton(onPressed: (){}, icon: Icon(Icons.folder_copy)),
//                         // const Text('Modal BottomSheet'),
//
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//           child: Icon(
//             Icons.camera_alt,
//             color: Colors.white,
//             size: 30,
//           ),
//         ),
//     ),
//   ]
// );
// }

}



