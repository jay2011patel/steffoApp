import 'dart:convert';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Models/grade.dart';
import '../Models/region.dart';
import '../Models/size.dart';
import '../UI/common.dart';
import '../ui/cards.dart';

class AddItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddItemContent();
  }
}

class AddItemContent extends StatefulWidget {
  AddItemContent({super.key});

  @override
  State<AddItemContent> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemContent> {
  bool isDataLoaded = false;
  List<Grade> gradeList = [];

  List sizes = [];
  List<ItemSize> sizeList = [];

  List regions = [];
  List<Region> regionList = [];

  var isEnabled = false;

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user_id = await prefs.getString('id');

    var res1 = await http
        .post(Uri.parse("http://urbanwebmobile.in/steffo/getgrade.php"));
    var responseData1 = jsonDecode(res1.body);
    for (int i = 0; i < responseData1['data'].length; i++) {
      print(responseData1['data'][i]);
      Grade g = Grade();
      g.value = responseData1['data'][i]['gradeName'];
      g.price = responseData1['data'][i]['gradePrice'];
      gradeList.add(g);
    }
    var res2 = await http
        .post(Uri.parse("http://urbanwebmobile.in/steffo/getsize.php"));
    var responseData2 = jsonDecode(res2.body);
    for (int i = 0; i < responseData2['data'].length; i++) {
      sizes.add(responseData2['data'][i]["sizeValue"].toString());
      ItemSize s = ItemSize();
      s.price = responseData2['data'][i]["sizePrice"];
      s.value = responseData2['data'][i]["sizeValue"];
      sizeList.add(s);
    }

    var res3 = await http
        .post(Uri.parse("http://urbanwebmobile.in/steffo/getregions.php"));
    var responseData3 = jsonDecode(res3.body);
    for (int i = 0; i < responseData3['data'].length; i++) {
      print(responseData3['data'][i]);
      regions.add(responseData3['data'][i]["regionName"]);
      Region r = Region();
      r.name = responseData3['data'][i]["regionName"];
      r.cost = responseData3['data'][i]["tCost"];
      regionList.add(r);
    }

    var res = await http.post(
        Uri.parse("http://urbanwebmobile.in/steffo/getinventory.php"),
        body: {
          "user_id": user_id,
        });

    var responseData = jsonDecode(res.body);

    print(responseData);
    for (int i = 0; i < responseData["data"].length; i++) {
      print(responseData['data'][i]['name']);
      var ind = gradeList.indexWhere((element) =>
          element.value?.trim() == responseData['data'][i]['name'].trim());

      print(gradeList[ind].value!);
    }
    isDataLoaded = true;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar("Add Fields", () {
          Navigator.pop(context);
        }),
        body: AddItemBody());
  }

  Widget AddItemBody() {
    return Container(
      margin: EdgeInsets.all(10.0),
      // padding: const EdgeInsets.all(8.0),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // border: Border.all(color: Colors.black),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2.0)]),
      // width: 200,
      // height: MediaQuery.of(context).size.height / 1.2 + 10,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // height: MediaQuery.of(context).size.height / 1.2,

              // padding: EdgeInsets.only(top: 5),
              child: ContainedTabBarView(
                tabBarProperties: TabBarProperties(
                    background: Container(
                  width: MediaQuery.of(context).size.width / 2,
                )),
                tabs: [
                  Container(
                    child: Text('Grade', style: TextStyle(color: Colors.black)),
                    height: 50,
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: Text('Size', style: TextStyle(color: Colors.black)),
                    height: 50,
                    alignment: Alignment.center,
                  ),
                  Container(
                    child:
                        Text('Region', style: TextStyle(color: Colors.black)),
                    height: 50,
                    alignment: Alignment.center,
                  ),
                ],
                views: [
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: ListView.builder(
                                itemCount: gradeList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, ind) {
                                  return Center(
                                    child: AddNewGrade(context, gradeList[ind],
                                        () {
                                      gradeList.removeAt(ind);
                                      setState(() {});
                                    }),
                                  );
                                },
                              ),
                            ),
                            LayoutBuilder(builder: (context, constraints) {
                              if (isEnabled == true) {
                                return Column(
                                  children: [
                                    TextFormField(
                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: "Add new Grade",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: OutlineInputBorder(
                                            // borderRadius: BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: Color.fromRGBO(233, 236, 239,
                                            0.792156862745098), //Color.fromRGBO(233, 236, 239, 0.792156862745098)
                                      ),
                                    ),
                                    ElevatedButton(
                                        // icon: Icon(Icons.done_outlined),

                                        onPressed: () {
                                          // print(newBasePrice.text);
                                          setState(() {
                                            isEnabled = false;
                                          });
                                        },
                                        child: Text("Submit"),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueAccent,
                                            foregroundColor: Colors.white))
                                  ],
                                );
                              } else {
                                return ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isEnabled = true;
                                    });
                                  },
                                  child: Text('Add New Grade'),
                                  // icon: Icon(
                                  //   Icons.add_circle_outline_outlined,
                                  //   color: Colors.white,
                                  // ), // <-- Text
                                );
                              }
                            }),
                          ],
                        ),
                      )),

                  //--------------------------Sizes-------------------------------//
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: ListView.builder(
                                itemCount: sizeList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, ind) {
                                  return Center(
                                    child:
                                        AddNewSize(context, sizeList[ind], () {
                                      sizeList.removeAt(ind);
                                      setState(() {});
                                    }),
                                  );
                                },
                              ),
                            ),
                            LayoutBuilder(builder: (context, constraints) {
                              if (isEnabled == true) {
                                return Column(
                                  children: [
                                    TextFormField(
                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: "Add new Size",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: OutlineInputBorder(
                                            // borderRadius: BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: Color.fromRGBO(233, 236, 239,
                                            0.792156862745098), //Color.fromRGBO(233, 236, 239, 0.792156862745098)
                                      ),
                                    ),
                                    ElevatedButton(
                                        // icon: Icon(Icons.done_outlined),

                                        onPressed: () {
                                          // print(newBasePrice.text);
                                          setState(() {
                                            isEnabled = false;
                                          });
                                        },
                                        child: Text("Submit"),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueAccent,
                                            foregroundColor: Colors.white))
                                  ],
                                );
                              } else {
                                return ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isEnabled = true;
                                    });
                                  },
                                  child: Text('Add New Size'),
                                  // icon: Icon(
                                  //   Icons.add_circle_outline_outlined,
                                  //   color: Colors.white,
                                  // ), // <-- Text
                                );
                              }
                            }),
                          ],
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: ListView.builder(
                                itemCount: regionList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, ind) {
                                  return Center(
                                    child: AddNewRegion(
                                        context, regionList[ind], () {
                                      regionList.removeAt(ind);
                                      setState(() {});
                                    }),
                                  );
                                },
                              ),
                            ),
                            LayoutBuilder(builder: (context, constraints) {
                              if (isEnabled == true) {
                                return Column(
                                  children: [
                                    TextFormField(
                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: "Add new Region",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: OutlineInputBorder(
                                            // borderRadius: BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: Color.fromRGBO(233, 236, 239,
                                            0.792156862745098), //Color.fromRGBO(233, 236, 239, 0.792156862745098)
                                      ),
                                    ),
                                    ElevatedButton(
                                        // icon: Icon(Icons.done_outlined),

                                        onPressed: () {
                                          // print(newBasePrice.text);
                                          setState(() {
                                            isEnabled = false;
                                          });
                                        },
                                        child: Text("Submit"),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueAccent,
                                            foregroundColor: Colors.white))
                                  ],
                                );
                              } else {
                                return ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isEnabled = true;
                                    });
                                  },
                                  child: Text('Add New Region'),
                                  // icon: Icon(
                                  //   Icons.add_circle_outline_outlined,
                                  //   color: Colors.white,
                                  // ), // <-- Text
                                );
                              }
                            }),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
