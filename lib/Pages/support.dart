import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:elixirlabs_mobileapp/SettingsPopup/drawer.dart';
import 'package:zendesk/zendesk.dart';

import 'package:elixirlabs_mobileapp/Pages/routes.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () async {
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
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.cyan.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4),
                          ],
                          color: Colors.cyan),
                      height: 80.0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              size: 50.0,
                              color: Colors.white,
                            ),
                            Text(
                              "Start Chat",
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
            SizedBox(
              height: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () async {
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
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.purple.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4),
                              ],
                              color: Colors.purple[300]),
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
                                Text(
                                  "Documentation",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () async {
                          print('Documentation Clicked');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.orange.withOpacity(0.5),
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
                                  Icons.assignment_rounded,
                                  size: 50.0,
                                  color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
