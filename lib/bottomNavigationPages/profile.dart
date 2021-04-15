import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Options/settings.dart';
import 'package:elixirlabs_mobileapp/Options/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elixirlabs_mobileapp/Options/loadAnimation.dart';
import 'package:url_launcher/url_launcher.dart';

//Profile Page Widget
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

//Create Firebase Instance
final firestoreInstance = FirebaseFirestore.instance;

//Profile Page Widget State
class _ProfilePage extends State<ProfilePage> {
  int navIndex = 3;
  String appBarTitle = "Profile";
  var discordName;
  var profilePic;
  var userRole;
  String storeUrl = 'https://elixirlabs.xyz/shop';
  TextEditingController reason = new TextEditingController();

  //Show Modal Bottom Sheet when 'Cancel Membership' is Clicked
  void cancelClicked() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Container(
                height: 400.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0),
                    ),
                    color: Colors.grey[850]),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                      child: Text(
                        'Request for Cancellation',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      padding:
                          EdgeInsets.only(left: 10, right: 10.0, top: 20.0),
                      child: TextField(
                          maxLines: 10,
                          controller: reason,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[700],
                            hintText: 'Why are you leaving?',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.left),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.only(left: 23.0, right: 20.0, top: 5.0),
                      child: Text(
                        '* Request will be placed on hold until an ElixirLabs Staff reviews the Request.',
                        style: TextStyle(color: Colors.grey, fontSize: 8.0),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {print('Process Clicked')},
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Text(
                            'Process Request',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                    )
                  ],
                ),
              ));
        }).whenComplete(() => {reason.clear()});
  }

  //Fetch User Data from Firebase
  Future getProfileInfo() async {
    await firestoreInstance
        .collection("users")
        .doc('682347192140169305')
        .get()
        .then((info) {
      setState(() {
        discordName = info.data()["discordName"];
        profilePic = info.data()["profilePic"];
        userRole = info.data()["role"];
      });
    });
  }

  goToShop() async {
    if (await canLaunch(storeUrl)) {
      await launch(storeUrl);
    } else {
      print('Oops! Something Went Wrong');
    }
  }

  @override
  void initState() {
    super.initState();
    getProfileInfo();
  }

  //Option Menu Action
  void choiceAction(String choice) {
    //ProfileArea
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
          appBarTitle = "Profile";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ShowDrawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(appBarTitle),
          backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
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
                  color: Colors.cyan,
                ),
                label: (''))
          ],
        ),
        body: Container(
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
            child: discordName != null
                ? Column(
                    children: <Widget>[
                      Container(
                        height: 250.0,
                        margin:
                            EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.grey[900],
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blueGrey[800].withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0, 0)),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 150.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                                image: new DecorationImage(
                                  fit: BoxFit.contain,
                                  image: new NetworkImage(
                                    profilePic,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30.0),
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(discordName,
                                    style: TextStyle(
                                        color: Colors.cyan[400],
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 80,
                              margin: EdgeInsets.only(top: 20.0, left: 20.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Colors.grey[900],
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 0)),
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Role',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    alignment: Alignment.center,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        userRole,
                                        style: TextStyle(
                                            color: Colors.orange[100],
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Container(
                              height: 80.0,
                              margin: EdgeInsets.only(top: 20.0, right: 20.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Colors.grey[900],
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 0)),
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Renewal Date',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'N/A',
                                      style: TextStyle(
                                          color: Colors.orange[400],
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 80.0,
                        margin:
                            EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.grey[900],
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 0)),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              alignment: Alignment.center,
                              child: Text(
                                'Credit Points',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              alignment: Alignment.center,
                              child: Text(
                                'N/A',
                                style: TextStyle(
                                    color: Colors.green[600],
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {print('TBD Clicked')},
                              child: Container(
                                height: 80,
                                margin: EdgeInsets.only(
                                    top: 20.0, left: 10.0, bottom: 20.0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  color: Colors.yellow[900],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.help,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'TBD',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {goToShop()},
                              child: Container(
                                height: 80,
                                margin:
                                    EdgeInsets.only(top: 20.0, bottom: 20.0),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.purple[700]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.store,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'Store Credits',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {cancelClicked()},
                              child: Container(
                                height: 80.0,
                                margin: EdgeInsets.only(
                                    top: 20.0, right: 10.0, bottom: 20.0),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.red[700]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'Cancel Membership',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                //Show This when It is Loading
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Getting User Data...',
                          style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                      ),
                      CircularProgressIndicator()
                    ],
                  ))));
  }
}
