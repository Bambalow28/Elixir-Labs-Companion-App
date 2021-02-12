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
          children: <Widget>[
            if (Platform.isIOS)
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20.0),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width - 200,
                  child: Text('Start Chat'),
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
