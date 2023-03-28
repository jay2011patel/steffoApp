
import 'package:flutter/material.dart';
import 'package:stefomobileapp/UI/common.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar("Profile", () {
        print("Back Pressed");
        Navigator.pop(context);
      }),

      body: SingleChildScrollView(
        child: Column(
          children: [
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
              // color: Colors.orangeAccent,
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 10,top: 10)),
                  Card(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Business Name",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Contact Number",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                  SizedBox(
                  height: 10,
                ),
                Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "GST Number",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                  SizedBox(
                  height: 10,
                ),
                Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "PAN Number",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                  SizedBox(
                  height: 10,
                ),
                Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Aadhar Number",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                  SizedBox(
                  height: 10,
                ),
                Card(
                  child: TextFormField(
                    // minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "Address",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                ],
              ),
            ),
          ],
        ),
      ),
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



