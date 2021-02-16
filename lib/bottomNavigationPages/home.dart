import 'dart:io';
import 'package:elixirlabs_mobileapp/SettingsPopup/drawer.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:elixirlabs_mobileapp/Pages/upcomingInfo.dart';

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
  int pageIndex = 0;
  String appBarTitle = "Home";
  List data;

  Future<void> upcomingReleases() async {
    try {
      var site = await http
          .get('https://resell-tracker-api.herokuapp.com/releases/upcoming');

      this.setState(() {
        data = convert.jsonDecode(site.body);
        progressStatus = false;
      });
    } catch (e) {
      return e;
    }
  }

  @override
  void initState() {
    super.initState();
    this.upcomingReleases();
  }

  @override
  Widget build(BuildContext context) {
    List<String> importantNotif = ['Urgent'];

    //Option Menu Action
    void choiceAction(String choice) {
      //NotificationArea
    }

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
        iconSize: 25.0,
        currentIndex: pageIndex,
        onTap: navigationBarTapped,
        elevation: 5,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
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
                Icons.person_outline,
                color: Colors.white,
              ),
              label: (''))
        ],
      ),
      body: progressStatus
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                children: <Widget>[
                  //Upcoming Releases Widget
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Upcoming Releases",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    height: 200.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data == null ? 0 : data.length,
                      itemBuilder: (BuildContext context, int index) {
                        String itemName = data[index]["name"];
                        String itemImage = data[index]["image"];
                        String itemPrice = data[index]["price"];
                        String itemReleaseDate = data[index]["releaseDate"];

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
                                              itemReleaseDate: itemReleaseDate,
                                              itemImage: itemImage,
                                            ))),
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(35, 39, 42, 1),
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
                                            child: Image.network(
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
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                    height: MediaQuery.of(context).size.height - 500,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: importantNotif.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: 5.0, right: 5.0, bottom: 10.0),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(36, 37, 38, 1),
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
                              width: MediaQuery.of(context).size.width - 10,
                              height: 123.0,
                              child: Stack(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 5.0, right: 5.0),
                                        alignment: Alignment.topLeft,
                                        child: SizedBox(
                                          width: 28.0,
                                          height: 25.0,
                                          child: Image.asset(
                                            "assets/images/logo.png",
                                            fit: BoxFit.cover,
                                            width: 200.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      '0:00AM',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    padding: EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: 120.0,
                                      height: 80.0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          "assets/images/jordanss.png",
                                          fit: BoxFit.fill,
                                          width: 200.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 300.0,
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text('Yeezys are out!',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 13.5, bottom: 10.0, left: 35.0),
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.only(bottom: 5.0),
                                          child: Text('Air Jordan 1 Pollen',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
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
                ],
              ),
            ),
    );
  }
}
