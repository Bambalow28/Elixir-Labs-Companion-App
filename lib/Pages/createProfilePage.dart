import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Create Profile Page Widget
class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePage createState() => _CreateProfilePage();
}

//Create Profile Widget State
class _CreateProfilePage extends State<CreateProfilePage> {
  int navIndex = 1;
  String appBarTitle = "Create Profile";
  bool billingInfo = true;
  bool billingVisible = false;

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;

  //Textfield Controllers
  TextEditingController profileName = new TextEditingController();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController zipCode = new TextEditingController();
  TextEditingController phoneNum = new TextEditingController();
  TextEditingController state = new TextEditingController();
  TextEditingController country = new TextEditingController();
  TextEditingController cardNumber = new TextEditingController();
  TextEditingController cardName = new TextEditingController();
  TextEditingController expDate = new TextEditingController();
  TextEditingController cvv = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Profiles'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
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
                  width: 300.0,
                  padding: EdgeInsets.only(left: 10, right: 10.0, top: 20.0),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: profileName,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(45, 45, 45, 1),
                      hintText: 'Profile Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                          controller: lastName,
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
                              controller: address,
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
                              controller: zipCode,
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
                        controller: phoneNum,
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
                              controller: state,
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
                              controller: country,
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
                        'Payment Details',
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
                        keyboardType: TextInputType.number,
                        controller: cardNumber,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(45, 45, 45, 1),
                          hintText: 'Card Number',
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
                    SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10.0),
                          child: TextField(
                            textCapitalization: TextCapitalization.words,
                            controller: cardName,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(45, 45, 45, 1),
                              hintText: 'Name on Card',
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
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: expDate,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color.fromRGBO(45, 45, 45, 1),
                                    hintText: 'Exp Date (MM/YY)',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
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
                                  keyboardType: TextInputType.number,
                                  controller: cvv,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color.fromRGBO(45, 45, 45, 1),
                                    hintText: 'Security Code',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
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
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 40.0, left: 30.0, right: 30.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color.fromRGBO(0, 169, 191, 1),
                    child: FlatButton(
                      focusColor: Colors.transparent,
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () => {
                        firestoreInstance
                            .collection("profiles")
                            .doc(profileName.text)
                            .set({
                          "profileName": profileName.text,
                          "firstName": firstName.text,
                          "lastName": lastName.text,
                          "address": address.text,
                          "zipcode": zipCode.text,
                          "phoneNumber": phoneNum.text,
                          "state": state.text,
                          "country": country.text,
                          "cardNumber": cardNumber.text,
                          "cardName": cardName.text,
                          "expDate": expDate.text,
                          "securityCode": cvv.text
                        })
                      },
                      child: Text("Save Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
