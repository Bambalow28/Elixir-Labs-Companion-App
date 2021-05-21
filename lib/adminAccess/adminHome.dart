import 'package:elixirlabs_mobileapp/Options/drawer.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/adminAccess/updateWeekly.dart';
import 'package:elixirlabs_mobileapp/adminAccess/pushNotifs.dart';
import 'package:elixirlabs_mobileapp/adminAccess/addNews.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Admin Home Page Widget
class AdminHome extends StatefulWidget {
  @override
  _AdminHome createState() => _AdminHome();
}

//Admin Home Widget State
class _AdminHome extends State<AdminHome> {
  int pageIndex;
  String appBarTitle = "Admin Options";

  //This Function controls the bottom navigation bar. Redirecting users in their respective destinations
  void navigationBarTapped(int index) {
    setState(() {
      pageIndex = index;

      switch (pageIndex) {
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
          Navigator.of(context).push(profileRoute());
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ShowDrawer(),
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        type: BottomNavigationBarType.fixed,
        iconSize: 27.0,
        onTap: navigationBarTapped,
        elevation: 5,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
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
                Icons.person,
                color: Colors.white,
              ),
              label: (''))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50.0, bottom: 30.0),
              child: Image.asset(
                "assets/images/newElixirLogo.png",
                fit: BoxFit.contain,
                width: 150.0,
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PushNotifs()))
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[900].withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 0))
                    ]),
                child: Text(
                  'Push Notifications to All Users',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateWeekly()))
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[900].withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 0))
                    ]),
                child: Text(
                  'Update Weekly Calendar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AddNews()))
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[900].withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 0))
                    ]),
                child: Text(
                  'Add News',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('Resell Clicked');
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[900].withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 0))
                    ]),
                child: Text(
                  'Resell Predictions',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {print('Sponsor Clicked')},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                margin: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10.0, bottom: 20.0),
                decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[900].withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 0))
                    ]),
                child: Text(
                  'Add New Sponsor',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
