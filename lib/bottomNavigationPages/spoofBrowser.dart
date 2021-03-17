import 'package:elixirlabs_mobileapp/Pages/createProfilePage.dart';
import 'package:elixirlabs_mobileapp/Pages/createProfiles.dart';
import 'package:elixirlabs_mobileapp/Pages/spoofBrowserTask.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
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
  List<String> tasks = [];
  String appBarTitle = "Spoof Browser";
  TextEditingController taskName = new TextEditingController();
  TextEditingController browserURL = new TextEditingController();
  TextEditingController taskCount = new TextEditingController();
  List<String> taskCountNum = [];

  var taskNum;

  void checkNum() {
    if (taskCount.text != '0') {
      taskNum = int.parse(taskCount.text);
      taskCountNum = new List<String>.generate(taskNum, (i) => "Task $i");
      print(taskCountNum);
    }
  }

  void handleTask() {
    checkNum();
    setState(() {
      tasks.add(browserURL.text);
    });
  }

  //Show Create Task Bottom Sheet when 'Create Task' is Clicked
  void createTaskClicked() {
    Navigator.pop(context);
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                  ),
                  color: Colors.grey[850]),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                      ),
                      color: Colors.blueGrey[600],
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.only(top: 15.0, left: 20.0, bottom: 15.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: GestureDetector(
                              onTap: () =>
                                  {Navigator.pop(context), addClicked()},
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 23.0,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Create Task',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width - 170,
                    padding: EdgeInsets.only(left: 10, right: 10.0, top: 10.0),
                    child: TextField(
                      controller: taskName,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Task Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(8.0),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.cyan),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'URL',
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 50,
                          padding:
                              EdgeInsets.only(left: 10, right: 10.0, top: 5.0),
                          decoration: BoxDecoration(),
                          child: TextField(
                              controller: browserURL,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter URL',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.all(8.0),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.white),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.cyan),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                              ),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Quantity',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              padding: EdgeInsets.only(
                                  left: 10, right: 10.0, top: 5.0),
                              decoration: BoxDecoration(),
                              child: TextField(
                                  controller: taskCount,
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: '1',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.all(8.0),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0, color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0, color: Colors.cyan),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                  ),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => {handleTask()},
                    child: Container(
                      alignment: Alignment.center,
                      width: 200.0,
                      height: 50.0,
                      color: Colors.deepOrange[400],
                      child: Text(
                        'Create Tasks',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //Show Modal Bottom Sheet when '+' is Clicked
  void addClicked() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 230.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30.0),
                  topRight: const Radius.circular(30.0),
                ),
                color: Colors.grey[850]),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => {createTaskClicked()},
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.cyan[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.create,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Create Tasks',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateProfile())),
                        },
                        child: Container(
                          height: 80.0,
                          margin: EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 10.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.deepPurple[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 40.0,
                                    ),
                                    Text(
                                      'Profiles',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 80.0,
                        margin: EdgeInsets.only(
                            top: 20.0, right: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateProfilePage())),
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.only(top: 12.0, bottom: 10.0),
                                child: Column(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'G',
                                              style: TextStyle(
                                                  color: Colors.blue[400])),
                                          TextSpan(
                                              text: 'O',
                                              style: TextStyle(
                                                  color: Colors.red[400])),
                                          TextSpan(
                                              text: 'O',
                                              style: TextStyle(
                                                  color: Colors.orange[400])),
                                          TextSpan(
                                              text: 'G',
                                              style: TextStyle(
                                                  color: Colors.blue[400])),
                                          TextSpan(
                                              text: 'L',
                                              style: TextStyle(
                                                  color: Colors.green[400])),
                                          TextSpan(
                                              text: 'E',
                                              style: TextStyle(
                                                  color: Colors.red[400])),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Sign In',
                                      style: TextStyle(
                                        color: Colors.blue[400],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    browserURL.clear();
    taskName.clear();
    taskCount.clear();
    super.dispose();
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
      backgroundColor: Colors.transparent,
      drawer: ShowDrawer(),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: GestureDetector(
                onTap: () => {addClicked()}, child: Icon(Icons.add)),
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
                Icons.person,
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
                child: taskCountNum.length != 0
                    ? Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        height: MediaQuery.of(context).size.height - 600,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount:
                              taskCountNum == null ? 0 : taskCountNum.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              key: Key(taskCountNum[index]),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                setState(() {
                                  taskCountNum.removeAt(index);
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
                                onLongPress: () {
                                  print('Long hold pressed');
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
                                            padding:
                                                EdgeInsets.only(left: 13.0),
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              width: 5.0,
                                              height: 60.0,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        0, 255, 255, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10.0,
                                                left: 30.0),
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
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 30.0,
                                                right: 5.0,
                                                bottom: 10.0),
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
                                                    text: browserURL.text,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 30.0,
                                                right: 5.0,
                                                bottom: 10.0),
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
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            padding:
                                                EdgeInsets.only(right: 20.0),
                                            child: Icon(
                                              Icons.circle,
                                              color: Color.fromRGBO(
                                                  92, 184, 92, 1),
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
                      )
                    : Center(
                        child: Text(
                          'No Tasks',
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 25.0),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
