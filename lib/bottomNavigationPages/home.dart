import 'dart:core';
import 'package:elixirlabs_mobileapp/Options/drawer.dart';
import 'package:elixirlabs_mobileapp/adminAccess/news.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Options/settings.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elixirlabs_mobileapp/Options/loadAnimation.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:elixirlabs_mobileapp/Pages/upcomingInfo.dart';

DateTime today = DateTime.now();
DateFormat formatDate = DateFormat('MMM');

//Home Page Widget
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Class for sending data to new page
class UpcomingInfo {
  final String itemName;
  final String price;

  UpcomingInfo(this.itemName, this.price);
}

//Home Page Widget State
class _HomePageState extends State<HomePage> {
  bool progressStatus = true;
  bool itemCheck = true;
  int pageIndex = 0;
  String appBarTitle = "Home";
  List data = [];

  String formattedDate = formatDate.format(today).toUpperCase();

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;

  //This Function gets a request from an API for Upcoming Releases.
  //In cases that the GET fails then it retries again.
  upcomingReleases() async {
    try {
      var site = await http
          .get('https://resell-tracker-api.herokuapp.com/releases/upcoming');

      this.setState(() {
        if (site.statusCode == 200) {
          progressStatus = false;
          data = convert.jsonDecode(site.body);

          // Only RUN On New Releases
          for (var i = 1; i < data.length; i++) {
            var item = data[i]["name"];
            firestoreInstance
                .collection("itemReleases")
                .doc(formattedDate + i.toString())
                .get()
                .then((value) {
              if (value.exists) {
                print('Item is in the System');
              } else if (!value.exists) {
                firestoreInstance
                    .collection("itemReleases")
                    .doc(formattedDate + i.toString())
                    .set({
                  //Set Likes and Resell Predictions
                  "itemName": item
                });
                print('New Items Added!');
              } else {
                print('Error!');
              }
            });
          }
        } else {
          print(site.statusCode);
          upcomingReleases();
        }
      });
    } catch (e) {
      upcomingReleases();
      print(e);
    }
  }

  //This function is called on Page Load.
  //It runs the UpcomingReleases Function.
  @override
  void initState() {
    super.initState();
    this.upcomingReleases();
  }

  @override
  void dispose() {
    super.dispose();
    print('Disposed');
  }

  @override
  Widget build(BuildContext context) {
    List<String> importantNotif = ['Urgent', 'Test'];

    //Option Menu Action
    void choiceAction(String choice) {
      //NotificationArea
    }

    //Responsible for the Bottom Navigation Bar
    //Page doesn't change if user is in current page.
    void navigationBarTapped(int index) {
      setState(() {
        pageIndex = index;

        switch (pageIndex) {
          case 0:
            appBarTitle = "Home";
            break;
          case 1:
            Navigator.of(context).push(spoofBrowserRoute());
            break;
          case 2:
            Navigator.of(context).push(supremeBotRoute());
            break;
          case 3:
            Navigator.of(context).push(profileRoute());
            break;
        }
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      drawer: ShowDrawer(),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(
                Icons.notifications_none_outlined,
                size: 25.0,
              ),
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return NotificationArea.options.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        type: BottomNavigationBarType.fixed,
        iconSize: 27.0,
        currentIndex: pageIndex,
        onTap: navigationBarTapped,
        elevation: 5,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                color: Colors.cyan,
              ),
              label: ('')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
                color: Colors.white,
              ),
              label: ('')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              label: ('')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: (''))
        ],
      ),
      body: progressStatus
          ? Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(23, 23, 23, 1),
                      Color.fromRGBO(13, 13, 13, 1)
                    ],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    //Upcoming Releases Widget
                    Container(
                      padding: EdgeInsets.only(
                          top: 10.0, left: 10.0, right: 10.0, bottom: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: LoadAnimation(
                          child: Container(
                            width: 300.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      height: 205.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              LoadAnimation(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  width: 160.0,
                                  height: 190.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              LoadAnimation(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  width: 160.0,
                                  height: 190.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //News Section Widget
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: LoadAnimation(
                          child: Container(
                            width: 300.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin:
                              EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                          height: MediaQuery.of(context).size.height - 500,
                          child: Column(
                            children: <Widget>[
                              LoadAnimation(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width - 10,
                                  height: 123.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              LoadAnimation(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width - 10,
                                  height: 123.0,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            )
          //Show when Loaded
          : Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(23, 23, 23, 1),
                      Color.fromRGBO(13, 13, 13, 1)
                    ],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    //Upcoming Releases Widget
                    Container(
                      padding: EdgeInsets.only(
                          top: 10.0, left: 10.0, right: 10.0, bottom: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Upcoming Releases",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      height: 205.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data == null ? 0 : data.length,
                        itemBuilder: (BuildContext context, int index) {
                          String itemName = data[index]["name"];
                          String itemImage = data[index]["image"];
                          String itemPrice = data[index]["price"];
                          String itemReleaseDate = data[index]["releaseDate"];

                          bool itemImageCheck() {
                            if (itemImage ==
                                'https://images.solecollector.com/complex/image/upload/v1557176412/SC_Logo_Globe_TM_Blue_20190506-01-01-01_urcggx.svg') {
                              return false;
                            }
                            return true;
                          }

                          return Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpcomingReleaseInfo(
                                                itemName: itemName,
                                                itemPrice: itemPrice,
                                                itemReleaseDate:
                                                    itemReleaseDate,
                                                itemImage: itemImage,
                                              ))),
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 5.0, right: 5.0, top: 6.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[850],
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 1)
                                                  .withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 4),
                                        ],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      width: 160.0,
                                      height: 190.0,
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(
                                                top: 30.0, bottom: 10.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: itemImageCheck() == false
                                                  ? Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 130.0,
                                                      height: 80.0,
                                                      child: Text(
                                                        'Image Not Available',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle: FontStyle
                                                                .italic),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ))
                                                  : Image.network(
                                                      itemImage,
                                                      width: 130.0,
                                                      height: 80.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 5.0,
                                                left: 12.0,
                                                right: 12.0),
                                            child: Stack(
                                              children: <Widget>[
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    itemName,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 150.0, left: 7.0),
                                                  child: Text(
                                                    "Price: " + itemPrice,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 165.0, left: 7.0),
                                                  child: Text(
                                                    "Release Date: " +
                                                        itemReleaseDate,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    //News Section Widget
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "News",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                        height: MediaQuery.of(context).size.height - 500,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: importantNotif.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ViewNews())),
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 5.0, right: 5.0, bottom: 5.0),
                                    decoration: BoxDecoration(
                                        // color: Colors.blueGrey[900],
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       color: Color.fromRGBO(0, 0, 0, 1)
                                        //           .withOpacity(0.5),
                                        //       spreadRadius: 2,
                                        //       blurRadius: 4),
                                        // ],
                                        // borderRadius: BorderRadius.all(
                                        //   Radius.circular(10),
                                        // ),
                                        ),
                                    width:
                                        MediaQuery.of(context).size.width - 10,
                                    height: 123.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5.0, right: 5.0),
                                                  alignment: Alignment.topLeft,
                                                  child: SizedBox(
                                                      width: 28.0,
                                                      height: 25.0,
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.all(2.0),
                                                        child: Image.asset(
                                                          "assets/images/newElixirLogo.png",
                                                          fit: BoxFit.contain,
                                                          width: 200.0,
                                                        ),
                                                      )),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    top: 13.5,
                                                    bottom: 10.0,
                                                  ),
                                                  alignment: Alignment.topLeft,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 5.0),
                                                        child: Text(
                                                            'Air Jordan 1 Pollen',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              child: Text(
                                                'Rumour has it that they are releasing this August',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: SizedBox(),
                                            ),
                                            Container(
                                              child: Text(
                                                'By: ' + 'SUPREMO#1533',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Expanded(
                                        //   child: SizedBox(),
                                        // ),
                                        // Column(
                                        //   children: <Widget>[
                                        //     Container(
                                        //       padding: EdgeInsets.only(top: 13.5),
                                        //       child: Text(
                                        //         '0:00 AM',
                                        //         style: TextStyle(
                                        //             color: Colors.grey,
                                        //             fontSize: 12.0,
                                        //             fontWeight: FontWeight.bold),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),

                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.start,
                                        //   children: <Widget>[
                                        //     Container(
                                        //       padding: EdgeInsets.only(
                                        //           top: 11.0,
                                        //           left: 5.0,
                                        //           right: 5.0),
                                        //       alignment: Alignment.topLeft,
                                        //       child: SizedBox(
                                        //           width: 28.0,
                                        //           height: 25.0,
                                        //           child: Container(
                                        //             margin: EdgeInsets.all(2.0),
                                        //             child: Image.asset(
                                        //               "assets/images/newElixirLogo.png",
                                        //               fit: BoxFit.contain,
                                        //               width: 200.0,
                                        //             ),
                                        //           )),
                                        //     ),
                                        //   ],
                                        // ),
                                        // Container(
                                        //   alignment: Alignment.topRight,
                                        //   padding: EdgeInsets.all(10.0),
                                        //   child: Text(
                                        //     '0:00AM',
                                        //     style: TextStyle(
                                        //       color: Colors.grey,
                                        //       fontSize: 10.0,
                                        //       fontWeight: FontWeight.bold,
                                        //     ),
                                        //     textAlign: TextAlign.center,
                                        //   ),
                                        // ),
                                        // Container(
                                        //   alignment: Alignment.bottomRight,
                                        //   padding: EdgeInsets.all(10.0),
                                        //   child: SizedBox(
                                        //     width: 120.0,
                                        //     height: 80.0,
                                        //     child: ClipRRect(
                                        //       borderRadius: BorderRadius.all(
                                        //           Radius.circular(10)),
                                        //       child: Image.asset(
                                        //         "assets/images/jordanss.png",
                                        //         fit: BoxFit.fill,
                                        //         width: 200.0,
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        // Container(
                                        //   alignment: Alignment.centerLeft,
                                        //   width: 300.0,
                                        //   padding: EdgeInsets.only(left: 10.0),
                                        //   child: FittedBox(
                                        //     fit: BoxFit.fitWidth,
                                        //     child: Text('Release in August!',
                                        //         style: TextStyle(
                                        //             color: Colors.grey,
                                        //             fontSize: 20.0,
                                        //             fontWeight: FontWeight.bold)),
                                        //   ),
                                        // ),
                                        // Container(
                                        //   padding: EdgeInsets.only(
                                        //       top: 13.5,
                                        //       bottom: 10.0,
                                        //       left: 35.0),
                                        //   alignment: Alignment.topLeft,
                                        //   child: Column(
                                        //     children: <Widget>[
                                        //       Container(
                                        //         alignment: Alignment.topLeft,
                                        //         padding:
                                        //             EdgeInsets.only(bottom: 5.0),
                                        //         child: Text('Air Jordan 1 Pollen',
                                        //             style: TextStyle(
                                        //                 color: Colors.white,
                                        //                 fontSize: 18.0,
                                        //                 fontWeight:
                                        //                     FontWeight.bold)),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  height: 2.0,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
