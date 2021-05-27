import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:elixirlabs_mobileapp/Options/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

//Report Issue Widget
class ReportIssue extends StatefulWidget {
  @override
  _ReportIssue createState() => _ReportIssue();
}

//Report Issue Widget State
class _ReportIssue extends State<ReportIssue> {
  int navIndex;
  String appBarTitle = "Report Issue";
  String buttonText = 'Submit';
  String status = '';
  var discordName;
  TextEditingController issueName = TextEditingController();
  TextEditingController issueDescription = TextEditingController();

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;

  //Fetch User Data from Firebase
  Future getProfileInfo() async {
    await firestoreInstance
        .collection("users")
        .doc('682347192140169305')
        .get()
        .then((info) {
      setState(() {
        discordName = info.data()["discordName"];
        print(discordName);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.getProfileInfo();
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
      backgroundColor: Colors.transparent,
      drawer: ShowDrawer(),
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
                color: Colors.white,
              ),
              label: (''))
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          // margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                padding: EdgeInsets.only(top: 10.0, left: 10.0),
                child: Text(
                  'What Seems to be the Issue?',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextField(
                  controller: issueName,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(45, 45, 45, 1),
                    hintText: 'Issue Name...',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextField(
                  controller: issueDescription,
                  maxLines: 10,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(45, 45, 45, 1),
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  status,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              GestureDetector(
                onTap: () => {
                  firestoreInstance.collection("issues").add({
                    "submittedBy": discordName,
                    "issueName": issueName.text,
                    "description": issueDescription.text
                  }).then((value) => setState(() {
                        buttonText = 'Issue Submitted';
                        const oneSec = const Duration(seconds: 2);
                        Timer(oneSec, () => buttonText = 'Submit');
                      })),
                  issueName.clear(),
                  issueDescription.clear()
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[400]),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      buttonText,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
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
