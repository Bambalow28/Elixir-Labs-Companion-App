import 'package:elixirlabs_mobileapp/Pages/createProfiles.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/bottomNavigationPages/home.dart';
import 'package:elixirlabs_mobileapp/bottomNavigationPages/spoofBrowser.dart';
import 'package:elixirlabs_mobileapp/bottomNavigationPages/supremeBot.dart';
import 'package:elixirlabs_mobileapp/bottomNavigationPages/profile.dart';

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
