import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

//View News Page Widget
class PushNotifs extends StatefulWidget {
  @override
  _PushNotifs createState() => _PushNotifs();
}

//View News Widget State
class _PushNotifs extends State<PushNotifs> {
  String appBarTitle = "Notification To Users";

  TextEditingController messageTitle = new TextEditingController();
  TextEditingController messageDescription = new TextEditingController();
  TextEditingController messageTime = new TextEditingController();

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        appBar: AppBar(
          title: Text(appBarTitle),
          backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () => {print('Save Article')},
                child: Icon(Icons.bookmark_rounded),
              ),
            )
          ],
        ),
        body: GestureDetector(
            onTap: () => {FocusScope.of(context).requestFocus(new FocusNode())},
            child: Container(
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
                child: Text('Test'))));
  }
}
