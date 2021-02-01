import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
import 'package:elixirlabs_mobileapp/barcodeScan/barcode.dart';

import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Supreme Bot Widget
class SupremeBot extends StatefulWidget {
  @override
  _SupremeBot createState() => _SupremeBot();
}

//Spoof Browser Widget State
class _SupremeBot extends State<SupremeBot> {
  int navIndex = 2;
  String appBarTitle = "Supreme";

  //Option Menu Action
  void choiceAction(String choice) {
    if (choice == Constants.LogOut) {
      Navigator.of(context).pushReplacementNamed('/');
    } else if (choice == Constants.Barcode) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BarcodeScanner()));
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
        leading: Builder(
          builder: (BuildContext context) {
            return PopupMenuButton<String>(
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
    );
  }
}
