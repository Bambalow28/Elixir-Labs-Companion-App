import 'package:flutter/material.dart';
import "bottomNavigationPages/home.dart";
import 'package:elixirlabs_mobileapp/Pages/routes.dart';

final authEnd = Uri.parse(
    'https://discord.com/api/oauth2/authorize?client_id=799140079494496276&redirect_uri=https%3A%2F%2Fwww.google.ca&response_type=code&scope=identify%20email%20guilds');
final tokenEnd = Uri.parse('https://discord.com/api/oauth2/token');
final clientID = '799140079494496276';
final clientSecret = '7QZ0cVfqyHPCTitgIBkK3IhlDgYcjvbd';
final redirectUrl = Uri.parse('https://www.google.ca');

//Splash Screen Widget
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

  void navigateToHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        ModalRoute.withName("/LoginPage"));
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2), () => {Navigator.of(context).push(loginRoute())});
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
