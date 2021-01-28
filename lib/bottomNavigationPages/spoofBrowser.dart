import 'package:elixirlabs_mobileapp/Pages/createProfiles.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Spoof Browser Widget
class SpoofBrowser extends StatefulWidget {
  @override
  _SpoofBrowser createState() => _SpoofBrowser();
}

//Spoof Browser Widget State
class _SpoofBrowser extends State<SpoofBrowser> {
  int navIndex = 1;
  String appBarTitle = "Spoof Browser";
  TextEditingController browserURL = new TextEditingController();
  TextEditingController taskCount = new TextEditingController();

  void handleTask() {
    print(browserURL.text);
  }

  //Create Tasks Dialog
  Future createTask(BuildContext context) async {
    Alert(
        context: context,
        title: "Create Task",
        content: Column(
          children: [
            TextField(
              controller: browserURL,
              decoration: InputDecoration(
                labelText: "Enter URL",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Row(
              children: [
                Container(
                  width: 100.0,
                  child: TextField(
                    controller: taskCount,
                    decoration: InputDecoration(
                      hintText: "Task Count",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0)),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: 130.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Profile",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0)),
                    ),
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ],
        ),
        buttons: [
          DialogButton(
            child: Text(
              "Create Task",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () => {handleTask()},
          ),
        ]).show();
  }

  //Option Menu Action
  void choiceAction(String choice) {
    if (choice == Constants.LogOut) {
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void navigationBarTapped(int index) {
    setState(() {
      navIndex = index;

      switch (navIndex) {
        case 0:
          Navigator.of(context).push(homeRoute());
          break;

        case 1:
          appBarTitle = "Spoof Browser";
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
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return PopupMenuButton<String>(
                icon: Icon(Icons.settings),
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Constants.options.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                });
          },
        ),
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(Icons.chat_bubble_outline),
              itemBuilder: (BuildContext context) {
                return Constants.options.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: navigationBarTapped,
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        iconSize: 30.0,
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
        // child: Container(
        //   margin:
        //       EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0, bottom: 10.0),
        //   child: InAppWebView(
        //     initialUrl: "https://www.supremenewyork.com/shop/all",
        //   ),
        // ),
        child: Text('No Tasks',
            style: TextStyle(color: Colors.grey, fontSize: 30.0)),
      ),
      floatingActionButton: SpeedDial(
        overlayColor: Colors.grey,
        overlayOpacity: 0.0,
        backgroundColor: Colors.cyan,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: Icon(Icons.add),
              label: "Create Task",
              backgroundColor: Colors.amber,
              onTap: () => {
                    createTask(context),
                  }),
          SpeedDialChild(
              child: Icon(Icons.bolt),
              label: "Autofill",
              backgroundColor: Colors.green),
          SpeedDialChild(
              child: Icon(Icons.person),
              label: "Profiles",
              backgroundColor: Colors.blue,
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfile())),
                  }),
        ],
      ),
    );
  }
}
