import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//View News Page Widget
class PushNotifs extends StatefulWidget {
  @override
  _PushNotifs createState() => _PushNotifs();
}

//View News Widget State
class _PushNotifs extends State<PushNotifs> {
  String appBarTitle = "Notification To Users";
  bool general = false;
  bool release = false;
  bool restock = false;
  bool shockDrop = false;

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
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                      width: 300.0,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        controller: messageTitle,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(45, 45, 45, 1),
                          hintText: 'Message Title',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        controller: messageDescription,
                        maxLines: 10,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(45, 45, 45, 1),
                          hintText: 'Description',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setState(() {
                          general = true;
                          release = false;
                          restock = false;
                          shockDrop = false;
                        })
                      },
                      child: Container(
                          margin: EdgeInsets.only(
                              top: 15.0, left: 10.0, right: 10.0),
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'General Alert',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          )),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () => {
                              setState(() {
                                general = false;
                                release = true;
                                restock = false;
                                shockDrop = false;
                              })
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: 15.0, left: 10.0, right: 5.0),
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.yellow[300],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Release',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => {
                              setState(() {
                                general = false;
                                release = false;
                                restock = true;
                                shockDrop = false;
                              })
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: 15.0, left: 5.0, right: 5.0),
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Restock',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => {
                              setState(() {
                                general = false;
                                release = false;
                                restock = false;
                                shockDrop = true;
                              })
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: 15.0, right: 10.0, left: 10.0),
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.red[300],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Shock Drop',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      child: Text(
                        'Alert Type: ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: 15.0, right: 20.0, left: 20.0, bottom: 40.0),
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Push To All Users',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ))));
  }
}
