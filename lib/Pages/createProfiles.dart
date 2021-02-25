import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/createProfilePage.dart';

//Create Profile Widget
class CreateProfile extends StatefulWidget {
  @override
  _CreateProfile createState() => _CreateProfile();
}

//Spoof Browser Widget State
class _CreateProfile extends State<CreateProfile> {
  int navIndex = 1;
  String appBarTitle = "Profiles";
  bool billingInfo = true;
  bool billingVisible = false;

  void createProfilePressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreateProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Profiles'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
                onTap: () => {createProfilePressed()},
                child: Icon(Icons.person_add_alt_1)),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(23, 23, 23, 1),
              Color.fromRGBO(13, 13, 13, 1)
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.blueGrey[900]),
              width: MediaQuery.of(context).size.width - 50,
              height: 100.0,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Text(
                      'SUPREMO',
                      style: TextStyle(
                          color: Colors.cyan[400],
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'John Doe',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '0123 **** **** 1234',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
