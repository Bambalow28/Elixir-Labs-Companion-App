import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/drawer.dart';

import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Supreme Bot Widget
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

//Spoof Browser Widget State
class _ProfilePage extends State<ProfilePage> {
  int navIndex = 3;
  String appBarTitle = "Profile";

  //Option Menu Action
  void choiceAction(String choice) {
    //ProfileArea
  }

  void navigationBarTapped(int index) {
    setState(() {
      navIndex = index;

      switch (navIndex) {
        case 0:
          Navigator.of(context).push(homeRoute());
          break;

        case 1:
          Navigator.of(context).push(spoofBrowserRoute());
          break;

        case 2:
          Navigator.of(context).push(supremeBotRoute());
          break;

        case 3:
          appBarTitle = "Profile";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ShowDrawer(),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(CustomIcons.chat, size: 20.0),
              itemBuilder: (BuildContext context) {
                return BarcodeSelection.options.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: navigationBarTapped,
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        iconSize: 27.0,
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
                color: Colors.cyan,
              ),
              label: (''))
        ],
      ),
      body: Container(
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
            Container(
              height: 250.0,
              margin: EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.grey[900],
                boxShadow: [
                  BoxShadow(
                      color: Colors.blueGrey[800].withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 0)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 150.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey
                        // image: new DecorationImage(
                        //   fit: BoxFit.fill,
                        //   image: new NetworkImage(
                        //     "https://example.com/assets/images/john-doe.jpg",
                        //   ),
                        // ),
                        ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('SUPREMO#1533',
                          style: TextStyle(
                              color: Colors.cyan[400],
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 80,
                    margin: EdgeInsets.only(top: 20.0, left: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.grey[900]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Role',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          alignment: Alignment.center,
                          child: Text(
                            'F&F',
                            style: TextStyle(
                                color: Colors.orange[100],
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    height: 80.0,
                    margin: EdgeInsets.only(top: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.grey[900]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Renewal Date',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          alignment: Alignment.center,
                          child: Text(
                            '03/22/2021',
                            style: TextStyle(
                                color: Colors.orange[400],
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 80,
                    margin:
                        EdgeInsets.only(top: 20.0, left: 10.0, bottom: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.yellow[900]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.help,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            alignment: Alignment.center,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'TBD',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.yellow[900]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.help,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            alignment: Alignment.center,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'TBD',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    height: 80.0,
                    margin:
                        EdgeInsets.only(top: 20.0, right: 10.0, bottom: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.red[700]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.cancel,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            alignment: Alignment.center,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Cancel Membership',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
