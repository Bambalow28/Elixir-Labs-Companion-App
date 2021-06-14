import 'package:elixirlabs_mobileapp/Options/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import "bottomNavigationPages/home.dart";
import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

//Widget that defines app title, app theme and home page
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Elixir Login UI",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(title: "Elixir Login"),
    );
  }
}

//Login Widget
class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreen createState() => _SplashScreen();
}

//Login Page Widget State
class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool isLoggedIn = false;
  bool checkPressed = false;
  bool dbInitialized = false;
  bool status;

  void navigateToHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        ModalRoute.withName("/LoginPage"));
  }

  @override
  void dispose() {
    super.dispose();
  }

  //Initiate FlutterFire (Firebase)
  void initializeFire() async {
    try {
      await Firebase.initializeApp();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        dbInitialized = true;
        status = sharedPreferences.getBool('userLoggedIn');
        print('DB Initialized');
        Future.delayed(Duration(seconds: 1), () {
          if (status == true && dbInitialized == true) {
            Navigator.of(context).push((homeRoute()));
            // } else if (status == null) {
            //   // initializeFire();
            //   print(status);
            //   enterLogin();
          } else {
            // initializeFire();
            // enterLogin();
            Navigator.of(context).push((loginRoute()));
          }
        });
      });
    } catch (e) {
      print('Error');
    }
  }

  void enterLogin() {
    Future.delayed(Duration(seconds: 1), () {
      if (status == true && dbInitialized == true) {
        Navigator.of(context).push((homeRoute()));
      } else if (status == null) {
        // initializeFire();
        print(status);
        enterLogin();
      } else {
        // initializeFire();
        enterLogin();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initializeFire();
    // enterLogin();
  }

  @override
  Widget build(BuildContext context) {
    //Login View
    return Container(
      color: Colors.grey[900],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50.0),
              width: 200.0,
              height: 200.0,
              child: Image.asset(
                "assets/images/newElixirLogo.png",
                fit: BoxFit.fill,
                height: 100.0,
              ),
            ),
            Container(
                child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.cyan))),
          ],
        ),
      ),
    );
  }
}
