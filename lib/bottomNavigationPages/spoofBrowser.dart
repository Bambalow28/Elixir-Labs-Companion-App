import 'package:elixirlabs_mobileapp/Pages/createProfiles.dart';
import 'package:elixirlabs_mobileapp/Pages/spoofBrowserTask.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/drawer.dart';
import 'package:flutter/foundation.dart';

import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Spoof Browser Widget
class SpoofBrowser extends StatefulWidget {
  @override
  _SpoofBrowser createState() => _SpoofBrowser();
}

//Spoof Browser Widget State
class _SpoofBrowser extends State<SpoofBrowser> {
  // final Future<FirebaseApp> firebaseInit = Firebase.initializeApp();

  int navIndex = 1;
  List<String> tasks = new List<String>();
  String appBarTitle = "Spoof Browser";
  TextEditingController taskName = new TextEditingController();
  TextEditingController browserURL = new TextEditingController();
  TextEditingController taskCount = new TextEditingController();

  void handleTask() {
    setState(() {
      tasks.add(browserURL.text);
    });
    print(tasks);
  }

  @override
  void dispose() {
    browserURL.clear();
    taskName.clear();
    taskCount.clear();
    super.dispose();
  }

  //Create Tasks Dialog
  Future createTask(BuildContext context) async {
    Alert(
        context: context,
        title: "Create Task",
        content: Column(
          children: [
            TextField(
              controller: taskName,
              decoration: InputDecoration(
                labelText: "Task Name",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
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
    if (choice == SpoofBrowserAdd.CreateTask) {
      createTask(context);
    } else if (choice == SpoofBrowserAdd.Profiles) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateProfile()));
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
      drawer: ShowDrawer(),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          PopupMenuButton<String>(
              onSelected: choiceAction,
              icon: Icon(Icons.add),
              itemBuilder: (BuildContext context) {
                return SpoofBrowserAdd.options.map((String choice) {
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
                color: Colors.cyan,
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
            Container(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Queue Status Checker",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(92, 184, 92, 1),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(96, 211, 148, 1)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    height: 186.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            '0',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 80.0),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Passed Queue',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 173, 78, 1),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(255, 217, 125, 1)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    height: 186.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            '0',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 80.0),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Still In Queue',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                height: MediaQuery.of(context).size.height - 600,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(tasks[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          tasks.removeAt(index);
                        });

                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Task Deleted",
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        )));
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.delete,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BrowserTask(
                                        taskName: taskName.text,
                                      ))),
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: 5.0, right: 5.0, bottom: 10.0),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(36, 37, 38, 1),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 1)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 80.0,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 13.0),
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: 5.0,
                                      height: 60.0,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(0, 255, 255, 1),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 10.0, bottom: 10.0, left: 30.0),
                                    alignment: Alignment.topLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'TASK NAME: ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: taskName.text,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 30.0, right: 5.0, bottom: 10.0),
                                    padding: EdgeInsets.only(top: 30.0),
                                    alignment: Alignment.topLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'URL: ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: tasks[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 30.0, right: 5.0, bottom: 10.0),
                                    padding: EdgeInsets.only(top: 50.0),
                                    alignment: Alignment.topLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'PROFILE: ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'SUPREMO',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Icon(
                                      Icons.circle,
                                      color: Color.fromRGBO(92, 184, 92, 1),
                                      size: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
