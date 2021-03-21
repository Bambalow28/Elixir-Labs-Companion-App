import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/drawer.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//View Profile Widget
class ViewProfile extends StatefulWidget {
  String profileName;
  ViewProfile({Key key, this.profileName}) : super(key: key);

  @override
  _ViewProfile createState() => _ViewProfile();
}

//Spoof Browser Widget State
class _ViewProfile extends State<ViewProfile> {
  bool editClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(widget.profileName),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width - 100,
              height: 190.0,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[600],
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[600].withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 0)),
                  ]),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.credit_card_rounded,
                      color: Colors.grey[300],
                      size: 40.0,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('1234 **** **** 0987',
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('PROFILE NAME',
                                style: TextStyle(color: Colors.grey[400])),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(widget.profileName,
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('EXP DATE',
                                style: TextStyle(color: Colors.grey[400])),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text('02/24',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                'Shipping/Billing Information',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      enabled: editClicked == true ? true : false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(45, 45, 45, 1),
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        disabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      enabled: editClicked == true ? true : false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(45, 45, 45, 1),
                        hintText: 'Last Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        disabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: TextField(
                          textCapitalization: TextCapitalization.words,
                          enabled: editClicked == true ? true : false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(45, 45, 45, 1),
                            hintText: 'Address',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: TextField(
                          textCapitalization: TextCapitalization.words,
                          enabled: editClicked == true ? true : false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(45, 45, 45, 1),
                            hintText: 'Zip Code',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    enabled: editClicked == true ? true : false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(45, 45, 45, 1),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      disabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: TextField(
                          textCapitalization: TextCapitalization.words,
                          enabled: editClicked == true ? true : false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(45, 45, 45, 1),
                            hintText: 'State',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: TextField(
                          textCapitalization: TextCapitalization.words,
                          enabled: editClicked == true ? true : false,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(45, 45, 45, 1),
                              hintText: 'Country',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => {
                      setState(() {
                        String editState;
                        if (editClicked == true) {
                          editClicked = false;
                          editState = 'Editing Disabled';
                        } else if (editClicked == false) {
                          editClicked = true;
                          editState = 'Editing Enabled';
                        }

                        showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(Duration(seconds: 1), () {
                                Navigator.of(context).pop(true);
                              });
                              return AlertDialog(
                                title: Text(editState),
                              );
                            });
                      })
                    },
                    child: Container(
                      width: 80.0,
                      height: 60.0,
                      margin:
                          EdgeInsets.only(top: 30.0, left: 20.0, bottom: 30.0),
                      decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Edit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
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
                    onTap: () => {editClicked = false},
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 30.0, right: 20.0, bottom: 30.0),
                      width: 80.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.green[500],
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.save,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
