import 'package:elixirlabs_mobileapp/discordLogin/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_particle_background/flutter_particle_background.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import "bottomNavigationPages/home.dart";
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() => runApp(MyApp());

Future<void> launchURL() async {
  var client = OAuth2Helper(DiscordOAuth2Client(
      customUriScheme: 'elixirlabs_mobileapp',
      redirectUri:
          'https://discord.com/api/oauth2/authorize?client_id=799140079494496276&redirect_uri=https%3A%2F%2Fwww.google.ca&response_type=code&scope=identify%20email%20guilds'));

  client.setAuthorizationParams(
      grantType: OAuth2Helper.AUTHORIZATION_CODE,
      clientId: '799140079494496276',
      clientSecret: '7QZ0cVfqyHPCTitgIBkK3IhlDgYcjvbd',
      scopes: ['identify', 'email', 'guilds']);
}

Future<void> joinNow() async {
  const joinURL = 'https://elixirlabs.xyz';

  if (await canLaunch(joinURL)) {
    await launch(joinURL);
  } else {
    throw 'Error Launching $joinURL';
  }
}

//Widget that defines app title, app theme and home page
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Elixir Login UI",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: "Elixir Login"),
    );
  }
}

//Login Widget
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

//Login Page Widget State
class _LoginState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool isLoggedIn = false;

  void navigateToHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        ModalRoute.withName("/LoginPage"));
  }

  @override
  Widget build(BuildContext context) {
    //Create Login Button
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromRGBO(70, 130, 191, 1.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => {navigateToHome()},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    //Login View
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // ParticleBackground(
            //   backgroundColor: const Color.fromRGBO(21, 21, 21, 1.0),
            //   multiColor: false,
            //   particleColor: Colors.cyan,
            //   numberOfParticles: 200,
            //   biggestSize: 6,
            //   smallestSize: 4,
            //   blur: true,
            //   allFilled: true,
            //   highestSpeed: 1.1,
            //   slowestSpeed: 0.2,
            //   blurIntensity: 8,
            // ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, bottom: 20.0, top: 230.0),
                  child: Column(
                    children: <Widget>[
                      //Logo Photo PNG
                      Container(
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.cover,
                          width: 200.0,
                        ),
                      ),
                      Container(
                        child: ColorizeAnimatedTextKit(
                          text: ["Elixir Labs"],
                          textStyle: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                          colors: [Colors.white, Colors.cyan],
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(50.0)),
                      loginButton,
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: 500.0,
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 1),
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () => {joinNow()},
                          child: Text("Join Now",
                              textAlign: TextAlign.center,
                              style: style.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text('Version 1.0',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
