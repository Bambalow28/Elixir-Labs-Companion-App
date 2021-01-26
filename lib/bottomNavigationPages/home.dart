import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Home Page Widget
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Home Page Widget State
class _HomePageState extends State<HomePage> {
  bool progressStatus = true;
  int pageIndex = 0;
  String appBarTitle = "Home";
  List data;

  Future<void> upcomingReleases() async {
    var site = await http
        .get('https://resell-tracker-api.herokuapp.com/releases/upcoming');

    this.setState(() {
      data = convert.jsonDecode(site.body);
      progressStatus = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this.upcomingReleases();
  }

  @override
  Widget build(BuildContext context) {
    //Option Menu Action
    void choiceAction(String choice) {
      if (choice == Constants.LogOut) {
        Navigator.of(context).pushReplacementNamed('/');
      }
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
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return PopupMenuButton<String>(
                offset: Offset(5, 50),
                icon: Icon(Icons.settings),
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Constants.options.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                });
          },
        ),
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(Icons.chat_bubble_outline),
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.options.map((String choice) {
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
        iconSize: 30.0,
        currentIndex: pageIndex,
        onTap: navigationBarTapped,
        elevation: 5,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
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
                            Container(
                              margin: EdgeInsets.only(right: 5.0),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(36, 37, 38, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              width: 160.0,
                              height: 190.0,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
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
                                        top: 5.0, left: 12.0, right: 12.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            itemName,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 60.0, left: 7.0),
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
                                              top: 75.0, left: 7.0),
                                          child: Text(
                                            "Release Date: " + itemReleaseDate,
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
