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
  bool billingInfo = true;
  bool billingVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Profiles'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(Icons.person), itemBuilder: (BuildContext context) {}),
        ],
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
                  padding: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Text(
                    'Shipping Information',
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
                              textCapitalization: TextCapitalization.words,
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
                    Container(
                        alignment: Alignment.topLeft,
                        child: Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.grey),
                          child: CheckboxListTile(
                            activeColor: Colors.grey,
                            title: Text(
                              "Billing same as Shipping Information",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                            ),
                            value: billingInfo,
                            onChanged: (newValue) {
                              setState(() {
                                billingInfo = newValue;
                                billingVisible = true;

                                if (billingInfo && billingVisible == true) {
                                  billingInfo = false;
                                  billingInfo = newValue;
                                  billingVisible = false;
                                }
                              });
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        )),
                    Visibility(
                      visible: billingVisible,
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0, top: 20.0),
                            child: Text(
                              'Billing Address',
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
                                    textCapitalization:
                                        TextCapitalization.words,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromRGBO(45, 45, 45, 1),
                                      hintText: 'First Name',
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
                                    textCapitalization:
                                        TextCapitalization.words,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromRGBO(45, 45, 45, 1),
                                      hintText: 'Last Name',
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
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: TextField(
                                    textCapitalization:
                                        TextCapitalization.words,
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
                                    textCapitalization:
                                        TextCapitalization.words,
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
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: TextField(
                                    textCapitalization:
                                        TextCapitalization.words,
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
                                    textCapitalization:
                                        TextCapitalization.words,
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
                        ],
                      ),
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
                        setState(() {
                          print('Saved');
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
