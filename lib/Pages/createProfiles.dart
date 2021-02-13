import 'package:flutter/material.dart';

//Create Profile Widget
class CreateProfile extends StatefulWidget {
  @override
  _CreateProfile createState() => _CreateProfile();
}

//Spoof Browser Widget State
class _CreateProfile extends State<CreateProfile> {
  int navIndex = 1;
  String appBarTitle = "Spoof Browser";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text('Profiles'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        // actions: <Widget>[
        //   PopupMenuButton<String>(
        //       icon: Icon(Icons.chat_bubble_outline),
        //       itemBuilder: (BuildContext context) {
        //         return Constants.options.map((String choice) {
        //           return PopupMenuItem<String>(
        //             value: choice,
        //             child: Text(choice),
        //           );
        //         }).toList();
        //       }),
        // ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 300.0,
            padding: EdgeInsets.only(left: 10, right: 10.0, top: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Profile Name',
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 1.0)),
              ),
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10.0, top: 20.0),
            child: Text(
              'Personal Info',
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
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.cyan, width: 1.0)),
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
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.cyan, width: 1.0)),
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
                        decoration: InputDecoration(
                          hintText: 'Address',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.cyan, width: 1.0)),
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
                        decoration: InputDecoration(
                          hintText: 'Zip Code',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.cyan, width: 1.0)),
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'State',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.cyan, width: 1.0)),
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
                        decoration: InputDecoration(
                          hintText: 'Country',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.cyan, width: 1.0)),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Card Information',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Card Number',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Colors.white, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.cyan, width: 1.0)),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Name on Card',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 1.0)),
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
                            decoration: InputDecoration(
                              hintText: 'Exp Date (MM/YY)',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.cyan, width: 1.0)),
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
                            decoration: InputDecoration(
                              hintText: 'Security Code',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.cyan, width: 1.0)),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
