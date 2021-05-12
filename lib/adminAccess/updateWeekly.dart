import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:elixirlabs_mobileapp/Pages/weeklyCalendarItem.dart';

//View News Page Widget
class UpdateWeekly extends StatefulWidget {
  @override
  _UpdateWeekly createState() => _UpdateWeekly();
}

//View News Widget State
class _UpdateWeekly extends State<UpdateWeekly> {
  String appBarTitle = "Weekly Calendar";
  DateTime todayDate = DateTime.now();
  var releaseDate;
  var daySelected;
  List<String> daySelect = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  TextEditingController itemName = new TextEditingController();
  TextEditingController itemPrice = new TextEditingController();
  TextEditingController linkURL = new TextEditingController();
  TextEditingController lowPrice = new TextEditingController();
  TextEditingController highPrice = new TextEditingController();
  TextEditingController storeName = new TextEditingController();
  TextEditingController storeLink = new TextEditingController();
  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;

  //Show DatePicker for Selecting Release Date
  Future<Null> selectDate(BuildContext context) async {
    final DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2040));

    if (selectedDate != null) {
      setState(() {
        todayDate = selectedDate;

        final DateFormat formatDate = DateFormat('MMMM dd, yyyy');
        final String newSelectedDate = formatDate.format(todayDate);
        releaseDate = newSelectedDate;
        print(releaseDate);
      });
    }
  }

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
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1.5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: StreamBuilder(
                            stream: firestoreInstance
                                .collection("profiles")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error',
                                        style: TextStyle(color: Colors.grey)));
                              }
                              return Container(
                                width: 280.0,
                                margin:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[300],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(left: 20.0),
                                          child: Text(
                                            'Day: ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10.0, bottom: 10.0, right: 20.0),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 2.0,
                                                style: BorderStyle.solid,
                                                color: Colors.white54),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                      ),
                                      child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return DropdownButtonHideUnderline(
                                            child: Container(
                                              width: 130.0,
                                              margin: EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: DropdownButton<String>(
                                                hint: Text(
                                                  'Select',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                dropdownColor: Colors.grey[850],
                                                value: daySelected,
                                                style: TextStyle(
                                                    color: Colors.white),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    daySelected = newValue;
                                                  });
                                                },
                                                items: daySelect
                                                    .map((String value) {
                                                  return DropdownMenuItem(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 15.0, top: 20.0),
                        child: Text(
                          'Posted Releases',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      daySelected != null
                          ? StreamBuilder(
                              stream: firestoreInstance
                                  .collection('weeklyCalendar')
                                  .doc('days')
                                  .collection(daySelected)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  print('Something Went Wrong');
                                }

                                if (!snapshot.hasData) {
                                  return Center(
                                      child: Text('No Data Found',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0)));
                                } else {
                                  final itemReleases = snapshot.data.docs;
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 300.0,
                                    margin:
                                        EdgeInsets.only(left: 5.0, right: 5.0),
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: itemReleases.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        String itemName =
                                            itemReleases[index]['itemName'];
                                        String itemPrice =
                                            itemReleases[index]['itemPrice'];
                                        String itemReleaseDate =
                                            itemReleases[index]["releaseDate"];

                                        return Column(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () => {
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             UpcomingReleaseInfo(
                                                //               itemName: itemName,
                                                //               itemPrice: itemPrice,
                                                //               itemReleaseDate:
                                                //                   itemReleaseDate,
                                                //               itemImage: itemImage,
                                                //             ))),
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () => {
                                                      //Test
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10.0,
                                                          right: 10.0,
                                                          top: 10.0),
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[800],
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1)
                                                                  .withOpacity(
                                                                      0.5),
                                                              spreadRadius: 2,
                                                              blurRadius: 4),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 90.0,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.0,
                                                                      bottom:
                                                                          5.0),
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: RichText(
                                                                  text:
                                                                      TextSpan(
                                                                text:
                                                                    'ITEM NAME: ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                children: <
                                                                    TextSpan>[
                                                                  TextSpan(
                                                                    text:
                                                                        itemName,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0),
                                                                  ),
                                                                ],
                                                              ))),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10.0,
                                                                    bottom:
                                                                        5.0),
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: RichText(
                                                                text: TextSpan(
                                                              text: 'PRICE: ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                  text: "\$" +
                                                                      itemPrice,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0),
                                                                ),
                                                              ],
                                                            )),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10.0),
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: RichText(
                                                                text: TextSpan(
                                                              text:
                                                                  'RELEASE DATE: ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                  text:
                                                                      itemReleaseDate,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0),
                                                                ),
                                                              ],
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                }
                              })
                          : Center(
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 300.0,
                                  child: Text(
                                    'No Releases Found',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ))),
                      SizedBox(
                        height: 10.0,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 2.0,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                            left: 15.0, top: 10.0, bottom: 10.0),
                        child: Text(
                          'Add New Releases ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: TextField(
                                textCapitalization: TextCapitalization.words,
                                controller: itemName,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(45, 45, 45, 1),
                                  hintText: 'Item Name',
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
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(right: 10.0),
                            width: 140.0,
                            child: TextField(
                              textCapitalization: TextCapitalization.words,
                              controller: itemPrice,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      '\$',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16.0),
                                    )),
                                prefixIconConstraints:
                                    BoxConstraints(minWidth: 0, minHeight: 0),
                                filled: true,
                                fillColor: Color.fromRGBO(45, 45, 45, 1),
                                hintText: 'Retail',
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
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10.0),
                              width: 140.0,
                              child: TextField(
                                textCapitalization: TextCapitalization.words,
                                controller: lowPrice,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        '\$',
                                        style: TextStyle(
                                            color: Colors.red[300],
                                            fontSize: 16.0),
                                      )),
                                  prefixIconConstraints:
                                      BoxConstraints(minWidth: 0, minHeight: 0),
                                  filled: true,
                                  fillColor: Color.fromRGBO(45, 45, 45, 1),
                                  hintText: 'Lowest Price',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(right: 10.0, top: 10.0),
                              child: TextField(
                                textCapitalization: TextCapitalization.words,
                                controller: highPrice,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        '\$',
                                        style: TextStyle(
                                            color: Colors.green[300],
                                            fontSize: 16.0),
                                      )),
                                  prefixIconConstraints:
                                      BoxConstraints(minWidth: 0, minHeight: 0),
                                  filled: true,
                                  fillColor: Color.fromRGBO(45, 45, 45, 1),
                                  hintText: 'Highest Price',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: GestureDetector(
                            onTap: () => {print('Show Photo Library')},
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: 10.0, top: 10.0, right: 10.0),
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30.0))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.image,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      'Image',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )),
                          )),
                          Expanded(
                              child: GestureDetector(
                            onTap: () => {selectDate(context)},
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: 5.0, top: 10.0, right: 10.0),
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.indigo[300],
                                    borderRadius: BorderRadius.all(
                                        (Radius.circular(30.0)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.calendar_today_rounded,
                                        color: Colors.white),
                                    SizedBox(width: 5.0),
                                    Text(
                                      'Release Date',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )),
                          )),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                            left: 15.0, top: 10.0, bottom: 10.0),
                        child: Text(
                          'Links',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0),
                        child: TextField(
                          controller: storeName,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(45, 45, 45, 1),
                            hintText: 'Store Name',
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
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: 250.0,
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: TextField(
                                controller: storeLink,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(45, 45, 45, 1),
                                  hintText: 'Enter URL',
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
                          GestureDetector(
                            onTap: () => {print('Add Time Picker')},
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Icon(Icons.more_time_rounded,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                            onTap: () => {print('Add Link')},
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              margin: EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.green[300],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300.0,
                        margin:
                            EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            // String itemName = data[index]["name"];
                            // String itemImage = data[index]["image"];
                            // String itemPrice = data[index]["price"];
                            // String itemReleaseDate = data[index]["releaseDate"];

                            return Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             UpcomingReleaseInfo(
                                    //               itemName: itemName,
                                    //               itemPrice: itemPrice,
                                    //               itemReleaseDate:
                                    //                   itemReleaseDate,
                                    //               itemImage: itemImage,
                                    //             ))),
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                            bottom: 10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[500],
                                          boxShadow: [
                                            BoxShadow(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1)
                                                        .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 4),
                                          ],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100.0,
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 5.0,
                                                  left: 12.0,
                                                  right: 12.0),
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Item Name: ' +
                                                          'Jordan 1',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          firestoreInstance
                              .collection('weeklyCalendar')
                              .doc('days')
                              .collection(daySelected)
                              .doc(itemName.text)
                              .set({
                            "Day": daySelected,
                            "itemName": itemName.text,
                            "itemPrice": itemPrice.text,
                            "releaseDate": releaseDate.toString(),
                            "lowestPrice": lowPrice.text,
                            "highestPrice": highPrice.text,
                          }).then((value) => print('Item Added!')),
                          itemName.clear(),
                          itemPrice.clear(),
                          lowPrice.clear(),
                          highPrice.clear(),
                          storeName.clear(),
                          storeLink.clear()
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 15.0, top: 10.0, right: 15.0),
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: Colors.green[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Add Item',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
