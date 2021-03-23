import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
import 'package:elixirlabs_mobileapp/barcodeScan/barcode.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/drawer.dart';

import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Supreme Bot Widget
class ChatRoom extends StatefulWidget {
  @override
  _ChatRoom createState() => _ChatRoom();
}

//Spoof Browser Widget State
class _ChatRoom extends State<ChatRoom> {
  int navIndex;
  String appBarTitle = 'Chat Room';

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
    TextEditingController message = new TextEditingController();

    return Scaffold(
      drawer: ShowDrawer(),
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 2.0, right: 15.0),
            child: GestureDetector(
              onTap: () => {print('Direct Messages Clicked')},
              child: Icon(
                Icons.question_answer_rounded,
                size: 27.0,
                color: Colors.blue[300],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.0, right: 15.0),
            child: GestureDetector(
              onTap: () => {print('Questions Clicked')},
              child: Icon(
                Icons.help,
                size: 27.0,
                color: Colors.orange[300],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: navigationBarTapped,
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        iconSize: 27.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
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
                Icons.person,
                color: Colors.white,
              ),
              label: (''))
        ],
      ),
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).requestFocus(new FocusNode()),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.transparent,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            width: MediaQuery.of(context).size.width - 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey[400],
                                  ),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[600],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
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
              ),
            ),
            // SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              height: 60.0,
              child: TextField(
                controller: message,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  filled: true,
                  fillColor: Color.fromRGBO(45, 45, 45, 1),
                  hintText: 'Enter Message...',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: () => {print('Sent'), message.clear()},
                    icon: Icon(
                      Icons.send_rounded,
                      color: Colors.blue[400],
                    ),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
