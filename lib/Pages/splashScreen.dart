import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Supreme Bot Widget
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

//Spoof Browser Widget State
class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
                width: 200.0,
              ),
            ),
            Container(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
