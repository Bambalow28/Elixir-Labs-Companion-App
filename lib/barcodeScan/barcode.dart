import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Supreme Bot Widget
class BarcodeScanner extends StatefulWidget {
  @override
  _BarcodeScan createState() => _BarcodeScan();
}

//Spoof Browser Widget State
class _BarcodeScan extends State<BarcodeScanner> {
  int navIndex = 2;
  String appBarTitle = "Barcode Scanner";

  //Option Menu Action
  void choiceAction(String choice) {
    if (choice == Constants.LogOut) {
      Navigator.of(context).pushReplacementNamed('/');
    }
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
          appBarTitle = "Supreme";
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
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(CustomIcons.chat),
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
        onTap: navigationBarTapped,
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        iconSize: 30.0,
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Coming Soon",
              style: TextStyle(color: Colors.grey, fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
        onPressed: () => {
          print('Barcode Scanner Opened'),
        },
      ),
    );
  }
}
