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
import 'package:visa/auth-data.dart';
import 'package:visa/discord.dart';
import 'package:visa/engine/oauth.dart';
import 'package:visa/engine/simple-auth.dart';
import 'package:visa/engine/visa.dart';

final authEnd = Uri.parse(
    'https://discord.com/api/oauth2/authorize?client_id=799140079494496276&redirect_uri=https%3A%2F%2Fwww.google.ca&response_type=code&scope=identify%20email%20guilds');
final tokenEnd = Uri.parse('https://discord.com/api/oauth2/token');
final clientID = '799140079494496276';
final clientSecret = '7QZ0cVfqyHPCTitgIBkK3IhlDgYcjvbd';
final redirectUrl = Uri.parse('https://www.google.ca');
String redUrl =
    'https://discord.com/api/oauth2/authorize?client_id=799140079494496276&redirect_uri=https%3A%2F%2Fwww.google.ca&response_type=code&scope=identify%20email%20guilds';

launchURL() async {
  DiscordAuth discordAuth = DiscordAuth();
  var visa = discordAuth.visa;

  return visa.authenticate(
      clientID: clientID,
      redirectUri: redUrl,
      scope: 'identify,email,guilds,guilds.join',
      state: 'discordAuth',
      onDone: done);
}

done(AuthData authData) {
  print(authData);
}

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

//Login Widget
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

//Login Page Widget State
class _LoginState extends State<LoginPage> with SingleTickerProviderStateMixin {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool isLoggedIn = false;
  bool checkPressed = false;

  void navigateToHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        ModalRoute.withName("/LoginPage"));
  }

  @override
  Widget build(BuildContext context) {
    //Create Login Button

    //Login View
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            WaveWidget(
              config: CustomConfig(
                gradients: [
                  [Colors.cyanAccent, Color(0x66FF9800)],
                  [Colors.cyan, Color(0x55FFEB3B)]
                ],
                durations: [10800, 6000],
                heightPercentages: [0.50, 0.52],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
              backgroundColor: Color.fromRGBO(18, 18, 18, 1),
              size: Size(
                double.infinity,
                double.infinity,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, right: 40.0, bottom: 20.0, top: 190.0),
                child: Column(
                  children: <Widget>[
                    //Logo Photo PNG
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          "assets/images/newElixirLogo.png",
                          fit: BoxFit.contain,
                          width: 150.0,
                        ),
                      ),
                    ),
                    // Padding(padding: const EdgeInsets.all(100.0)),
                    Expanded(
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onTap: () => {
                        checkPressed
                            ? Colors.white
                            : const Color.fromRGBO(18, 18, 18, 1.0),
                        setState(() {
                          checkPressed = !checkPressed;
                          navigateToHome();
                        })
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(23, 23, 23, 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[900].withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 2,
                                  offset: Offset(0, 3)),
                            ]),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                CustomIcons.discord,
                                color: checkPressed
                                    ? const Color.fromRGBO(18, 18, 18, 1.0)
                                    : Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                              ),
                              Text("Login via Discord",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: checkPressed
                                          ? const Color.fromRGBO(
                                              18, 18, 18, 1.0)
                                          : Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 130.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
