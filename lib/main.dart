import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import "bottomNavigationPages/home.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

final authEnd = Uri.parse(
    'https://discord.com/api/oauth2/authorize?client_id=799140079494496276&redirect_uri=https%3A%2F%2Fwww.google.ca&response_type=code&scope=identify%20email%20guilds');
final tokenEnd = Uri.parse('https://discord.com/api/oauth2/token');
final clientID = '799140079494496276';
final clientSecret = '7QZ0cVfqyHPCTitgIBkK3IhlDgYcjvbd';
final redirectUrl = Uri.parse('https://www.google.ca');

// Future<oauth2.Client> launchURL() async {
//   var grant = oauth2.AuthorizationCodeGrant(clientID, authEnd, tokenEnd,
//       secret: clientSecret);

//   // A URL on the authorization server (authorizationEndpoint with some additional
//   // query parameters). Scopes and state can optionally be passed into this method.
//   var authorizationUrl = grant.getAuthorizationUrl(redirectUrl, scopes: ['identify', 'email', 'guilds']);

//   await redirect(authorizationUrl);
//   var responseUrl = await listen(redirectUrl);

//   return await grant.handleAuthorizationResponse(responseUrl.queryParameters);
// }

// Future redirect(Uri url) async {
//   if (await canLaunch(url.toString())) {
//     await launch(url.toString());
//   }
// }

// Future<Null> listen(Uri url) async {
//   //ignore: cancel_subscriptions
//   final linksStream = getLinksStream().listen((Uri uri) => async {
//     if (uri.toString().startsWith(redirectUrl.toString())) {
//       redirectUrl = uri;
//     }
//   });
// }

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

  void navigateToHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        ModalRoute.withName("/LoginPage"));
  }

  //Initiate FlutterFire (Firebase)
  void initializeFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        dbInitialized = true;
        print('DB Initialized');
      });
    } catch (e) {
      print('Error');
    }
  }

  void enterLogin() {
    Future.delayed(Duration(seconds: 1), () {
      if (dbInitialized == true) {
        Navigator.of(context).push(loginRoute());
      } else {
        initializeFire();
        enterLogin();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initializeFire();
    enterLogin();
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
