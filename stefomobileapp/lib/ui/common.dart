
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

//--------------------------------LOGO------------------------------------------

var width;

Widget logo(BuildContext context) {
  width = MediaQuery.of(context).size.width;
  final String assetName = 'assets/images/logo.svg';
  final Widget svg = SvgPicture.asset(
    assetName,

    width: MediaQuery
        .of(context)
        .size
        .width-150
  );
  return Container(
    padding: EdgeInsets.all(50),
    child: svg,
  );
}

//----------------------------Button Widget-------------------------------------

Widget buttonStyle(String str,void c() ){
  return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(75, 100, 160, 1.0),
                Color.fromRGBO(19, 59, 78, 1.0),

                //add more colors
              ]),
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                blurRadius: 5) //blur radius of shadow
          ]
      ),
      child:ElevatedButton(

          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent,
            //make color or elevated button transparent
          ),

          onPressed: c,
          child: Padding(
            padding:EdgeInsets.only(
              top: 18,
              bottom: 18,
            ),
            child:Text(str,style: TextStyle(fontFamily: 'Poppins_Bold'),),
          )
      )
  );
}

//----------------------------------Appbar----------------------------------

AppBar appbar(String txt){
  return AppBar(
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.black,))
    ],
    title: Center(child:Text(txt,style: TextStyle(color: Colors.black,fontFamily: "Poppins_Bold"),)),
    backgroundColor: Colors.white,
    leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),

  );
}

