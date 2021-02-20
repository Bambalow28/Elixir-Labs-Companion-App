import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:elixirlabs_mobileapp/SettingsPopup/drawer.dart';
import 'package:http/http.dart';
import 'package:zendesk/zendesk.dart';

import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Zendesk Support Info
//Must Be Hidden/Encrypted
const ZendeskAccountKey = 'SM1FWmfqgGJYK0Sy8oUKZQ2oMfBw0Zum';
const ZendeskAppId = 'b5acdf70e07c1871527007a7639edbe8e9715934f6c91704';

//Supreme Bot Widget
class SupportPage extends StatefulWidget {
  @override
  _SupportPage createState() => _SupportPage();
}

//Spoof Browser Widget State
class _SupportPage extends State<SupportPage> {
  int navIndex;
  String appBarTitle = "Support Center";

  final Zendesk zendesk = Zendesk();

  //Execute initZendesk Function On Load
  @override
  void initState() {
    super.initState();
    initZendesk();
  }

  // Zendesk is asynchronous, so we initialize in an async method.
  Future<void> initZendesk() async {
    zendesk.init(ZendeskAccountKey).then((r) {
      print('init finished');
    }).catchError((e) {
      print('failed with error $e');
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // But we aren't calling setState, so the above point is rather moot now.
  }

  //Navigation Function for Bottom Nav Bar
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
          Navigator.of(context).push(supremeBotRoute());
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
      drawer: ShowDrawer(),
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: navigationBarTapped,
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        iconSize: 25.0,
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
        child: Container(
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blueGrey[900]),
                  // width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 5.0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Frequently Asked Questions',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Colors.blueGrey[700]),
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Q: How do you access Elixir Help Center?',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'To access, Click on the button bellow which will redirect you to login on Discord for Authorization.',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Colors.blueGrey[700]),
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Q: How do use Barcode Scanner?',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'To access, Click on the button bellow which will redirect you to login on Discord for Authorization.',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Colors.blueGrey[700]),
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Q: How do you the Spoof Browser?',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'To access, Click on the button bellow which will redirect you to login on Discord for Authorization.',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () async => {
                        zendesk
                            .startChat(
                                messagingName: "Elixir Support",
                                iosNavigationBarColor: Colors.cyan,
                                iosNavigationTitleColor: Colors.white,
                                isAgentAvailabilityEnabled: false)
                            .then((r) {
                          print('startChat finished');
                        }).catchError((e) {
                          print('error $e');
                        })
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.cyan,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(1.0),
                                spreadRadius: 2,
                                blurRadius: 4),
                          ],
                        ),
                        height: 60.0,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Icon(
                              //   Icons.person,
                              //   size: 30.0,
                              //   color: Colors.white,
                              // ),
                              Text(
                                "Contact Support",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () async => {print('Documentation Clicked')},
                          child: Container(
                            margin: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(1.0),
                                      spreadRadius: 2,
                                      blurRadius: 4),
                                ],
                                color: Colors.purple[400]),
                            height: 90.0,
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.book,
                                    size: 50.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Help Center",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async => {print('Policy Clicked')},
                          child: Container(
                            margin: EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(1.0),
                                      spreadRadius: 2,
                                      blurRadius: 4),
                                ],
                                color: Colors.orange[400]),
                            height: 90.0,
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.contact_support_outlined,
                                    size: 50.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Policy",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
