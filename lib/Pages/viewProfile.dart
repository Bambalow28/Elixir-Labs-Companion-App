import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  bool saveBtnClicked = false;

  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController zip = new TextEditingController();
  TextEditingController phoneNum = new TextEditingController();
  TextEditingController state = new TextEditingController();
  TextEditingController country = new TextEditingController();
  String cardNum = 'N/A';
  String expDate = 'N/A';

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;
  getProfilesCreated() async {
    await firestoreInstance
        .collection("profiles")
        .doc(widget.profileName)
        .get()
        .then((profile) {
      firstName.text = profile.data()["firstName"];
      lastName.text = profile.data()["lastName"];
      address.text = profile.data()["address"];
      zip.text = profile.data()["zipcode"];
      phoneNum.text = profile.data()["phoneNumber"];
      state.text = profile.data()["state"];
      country.text = profile.data()["country"];
      cardNum = profile.data()["cardNumber"];
      expDate = profile.data()["expDate"];
    });
  }

  void saveEditedInfo() {
    saveBtnClicked = true;
  }

  @override
  void initState() {
    super.initState();
    getProfilesCreated();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(widget.profileName),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      ),
      body: FutureBuilder(
        future: getProfilesCreated(),
        builder: (BuildContext context, snapshot) {
          return Center(
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
                        child: Text(cardNum,
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0)),
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
                                child: Text(expDate,
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
                          controller: firstName,
                          enabled: editClicked == true ? true : false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(45, 45, 45, 1),
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
                          style: TextStyle(
                              color: editClicked == true
                                  ? Colors.white
                                  : Colors.grey),
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
                          controller: lastName,
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
                          style: TextStyle(
                              color: editClicked == true
                                  ? Colors.white
                                  : Colors.grey),
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
                              controller: address,
                              enabled: editClicked == true ? true : false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(45, 45, 45, 1),
                                hintText: 'Address',
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                              ),
                              style: TextStyle(
                                  color: editClicked == true
                                      ? Colors.white
                                      : Colors.grey),
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
                              controller: zip,
                              enabled: editClicked == true ? true : false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(45, 45, 45, 1),
                                hintText: 'Zip Code',
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                              ),
                              style: TextStyle(
                                  color: editClicked == true
                                      ? Colors.white
                                      : Colors.grey),
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
                        controller: phoneNum,
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
                        style: TextStyle(
                            color: editClicked == true
                                ? Colors.white
                                : Colors.grey),
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
                              controller: state,
                              enabled: editClicked == true ? true : false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(45, 45, 45, 1),
                                hintText: 'State',
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                              ),
                              style: TextStyle(
                                  color: editClicked == true
                                      ? Colors.white
                                      : Colors.grey),
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
                              controller: country,
                              enabled: editClicked == true ? true : false,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(45, 45, 45, 1),
                                  hintText: 'Country',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)))),
                              style: TextStyle(
                                  color: editClicked == true
                                      ? Colors.white
                                      : Colors.grey),
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
                          })
                        },
                        child: Container(
                          width: 80.0,
                          height: 60.0,
                          margin: EdgeInsets.only(
                              top: 30.0, left: 20.0, bottom: 30.0),
                          decoration: BoxDecoration(
                              color: editClicked == true
                                  ? Colors.red[400]
                                  : Colors.blue[600],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                editClicked == true ? Icons.cancel : Icons.edit,
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
                        onTap: () => {
                          setState(() {
                            saveEditedInfo();
                          })
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 30.0, right: 20.0, bottom: 30.0),
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
          );
        },
      ),
    );
  }
}
