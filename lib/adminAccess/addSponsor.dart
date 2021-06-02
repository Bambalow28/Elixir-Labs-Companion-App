import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//View News Page Widget
class AddSponsor extends StatefulWidget {
  @override
  _AddSponsor createState() => _AddSponsor();
}

//View News Widget State
class _AddSponsor extends State<AddSponsor> {
  String appBarTitle = "Add Sponsor";

  TextEditingController companyName = new TextEditingController();
  TextEditingController twitterHandle = new TextEditingController();
  TextEditingController websiteUrl = new TextEditingController();

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
                        controller: companyName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(45, 45, 45, 1),
                          hintText: 'Company Name',
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
                      width: 180.0,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        controller: twitterHandle,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(45, 45, 45, 1),
                          hintText: '@ Twitter Handle',
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
                      // width: 300.0,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        controller: websiteUrl,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(45, 45, 45, 1),
                          hintText: 'Website URL',
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
                      onTap: () => {print('Select Image')},
                      child: Container(
                          margin: EdgeInsets.only(
                              top: 15.0, left: 20.0, right: 20.0),
                          height: 50.0,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.image,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    'Logo/Banner',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                ],
                              ))),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Text(
                        'Preview',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
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
                            'ADD NEW SPONSOR',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ))));
  }
}
