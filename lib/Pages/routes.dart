import 'package:elixirlabs_mobileapp/Pages/createProfiles.dart';
import 'package:elixirlabs_mobileapp/Pages/support.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/zendesk.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/bottomNavigationPages/home.dart';
import 'package:elixirlabs_mobileapp/bottomNavigationPages/spoofBrowser.dart';
import 'package:elixirlabs_mobileapp/bottomNavigationPages/supremeBot.dart';
import 'package:elixirlabs_mobileapp/bottomNavigationPages/profile.dart';
import 'package:elixirlabs_mobileapp/barcodeScan/barcode.dart';
import 'package:elixirlabs_mobileapp/Pages/chatRoom.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/zendesk.dart';

//Transition To Home Page
Route homeRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

//Transition To Spoof Browser Page
Route spoofBrowserRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SpoofBrowser(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

//Transition To Supreme Bot Page
Route supremeBotRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SupremeBot(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

//Transition To Profile Page
Route profileRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

//Transition To Barcode Scanner
Route barcodeRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => BarcodeScanner(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

//Transition To Chat Room
Route chatRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ChatRoom(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

//Transition To Support
Route supportRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SupportPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
