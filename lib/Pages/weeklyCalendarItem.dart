import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Create Profile Widget
class WeeklyCalendarItem extends StatefulWidget {
  String itemTitle;
  String itemPrice;
  String releaseDate;
  String dayCheck;
  WeeklyCalendarItem(
      {Key key,
      this.itemTitle,
      this.itemPrice,
      this.releaseDate,
      this.dayCheck})
      : super(key: key);

  @override
  _WeeklyCalendarItem createState() => _WeeklyCalendarItem();
}

//Create Firebase Instance
final firestoreInstance = FirebaseFirestore.instance;

//Spoof Browser Widget State
class _WeeklyCalendarItem extends State<WeeklyCalendarItem> {
  String lowPrice;
  String highPrice;

  Future getItemData() async {
    await firestoreInstance
        .collection('weeklyCalendar')
        .doc('days')
        .collection(widget.dayCheck)
        .doc(widget.itemTitle)
        .get()
        .then((value) => {
              lowPrice = value.data()["lowestPrice"].toString(),
              highPrice = value.data()["highestPrice"].toString()
            });
  }

  @override
  void initState() {
    super.initState();
  }

  void sitesClicked() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              height: 380.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                  ),
                  color: Colors.grey[850]),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                      ),
                      color: Colors.blueGrey[600],
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.only(top: 15.0, left: 20.0, bottom: 15.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: GestureDetector(
                              onTap: () => {Navigator.pop(context)},
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 23.0,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Shop Name',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'URL',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[900].withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 0)),
                        ]),
                    alignment: Alignment.center,
                    child: Text(
                      'https://www.test.com',
                      style: TextStyle(color: Colors.grey[400], fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 50.0,
                          margin: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue[900].withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(0, 0)),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Shopify: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                color: Colors.white,
                                child: Icon(
                                  Icons.check_box_rounded,
                                  color: Colors.green[300],
                                  size: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          height: 50.0,
                          margin: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue[900].withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(0, 0)),
                              ]),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              padding: EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Account Required: ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: Icon(Icons.check_box_rounded,
                                        color: Colors.green[300]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    'RELEASE TIME',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '8:00AM EST',
                    style: TextStyle(
                        color: Colors.orange[300],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {print('Added to Quicktask')},
                          child: Container(
                            margin: EdgeInsets.only(left: 20.0, bottom: 30.0),
                            alignment: Alignment.center,
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple[500],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[900].withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 0)),
                                ]),
                            child: Text(
                              'Quicktask',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {print('URL Copied')},
                          child: Container(
                            margin: EdgeInsets.only(right: 20.0, bottom: 30.0),
                            alignment: Alignment.center,
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange[400],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[900].withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 0)),
                                ]),
                            child: Text(
                              'Copy URL',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center,
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(widget.itemTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: GestureDetector(
                onTap: () => {print('Alert Set!')},
                child: Icon(Icons.lightbulb)),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getItemData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
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
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 5.0, left: 10.0, right: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Image.asset(
                            'assets/images/jordanss.png',
                            fit: BoxFit.fill,
                            height: 130.0,
                          ),
                          // child: itemImageCheck() == false
                          //     ? Container(
                          //         alignment: Alignment.center,
                          //         height: 200.0,
                          //         child: Text(
                          //           'Image Not Available',
                          //           style: TextStyle(
                          //               color: Colors.grey,
                          //               fontWeight: FontWeight.bold,
                          //               fontStyle: FontStyle.italic,
                          //               fontSize: 20.0),
                          //           textAlign: TextAlign.center,
                          //         ))
                          //     : Image.network(
                          //         widget.itemImage,
                          //       ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: 20.0, bottom: 10.0, right: 20.0),
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                text: 'NAME: ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: widget.itemTitle,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20.0, bottom: 10.0, right: 20.0),
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                text: 'RETAIL PRICE: ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '\$' + widget.itemPrice,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                text: 'RELEASE DATE: ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: widget.releaseDate,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, bottom: 15.0),
                  alignment: Alignment.topLeft,
                  child: Text('Resell Predictions',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0)),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(36, 37, 38, 1),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        height: 127.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                '\$' + lowPrice,
                                style: TextStyle(
                                    color: Colors.red[300],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36.0),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Lowest Price',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(36, 37, 38, 1),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        height: 127.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                '\$' + highPrice,
                                style: TextStyle(
                                    color: Colors.green[300],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36.0),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Highest Price',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Sites',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => {sitesClicked()},
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 10.0, left: 10.0, right: 13.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey[400],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black45
                                                  .withOpacity(0.5),
                                              spreadRadius: 4,
                                              blurRadius: 2,
                                              offset: Offset(0, 0)),
                                        ]),
                                    height: 52.0,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 5.0),
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'SHOP NAME',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(bottom: 5.0),
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            '8:00AM EST',
                                            style: TextStyle(
                                                color: Colors.grey[300],
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => {sitesClicked()},
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 10.0, right: 10.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey[400],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black45
                                                  .withOpacity(0.5),
                                              spreadRadius: 4,
                                              blurRadius: 2,
                                              offset: Offset(0, 0)),
                                        ]),
                                    height: 52.0,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 5.0),
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'SHOP NAME',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(bottom: 5.0),
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            '8:00AM EST',
                                            style: TextStyle(
                                                color: Colors.grey[300],
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // body: Container(
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       colors: [
      //         Color.fromRGBO(23, 23, 23, 1),
      //         Color.fromRGBO(13, 13, 13, 1)
      //       ],
      //     ),
      //   ),
      //   child: Column(
      //     children: <Widget>[
      //       Row(
      //         children: <Widget>[
      //           Expanded(
      //             child: Container(
      //               alignment: Alignment.center,
      //               padding: EdgeInsets.only(
      //                   top: 20.0, bottom: 5.0, left: 10.0, right: 10.0),
      //               child: ClipRRect(
      //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //                 child: Image.asset(
      //                   'assets/images/jordanss.png',
      //                   fit: BoxFit.fill,
      //                   height: 130.0,
      //                 ),
      //                 // child: itemImageCheck() == false
      //                 //     ? Container(
      //                 //         alignment: Alignment.center,
      //                 //         height: 200.0,
      //                 //         child: Text(
      //                 //           'Image Not Available',
      //                 //           style: TextStyle(
      //                 //               color: Colors.grey,
      //                 //               fontWeight: FontWeight.bold,
      //                 //               fontStyle: FontStyle.italic,
      //                 //               fontSize: 20.0),
      //                 //           textAlign: TextAlign.center,
      //                 //         ))
      //                 //     : Image.network(
      //                 //         widget.itemImage,
      //                 //       ),
      //               ),
      //             ),
      //           ),
      //           Expanded(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 Container(
      //                   padding: EdgeInsets.only(
      //                       left: 20.0, bottom: 10.0, right: 20.0),
      //                   alignment: Alignment.topLeft,
      //                   child: RichText(
      //                     text: TextSpan(
      //                       text: 'NAME: ',
      //                       style: TextStyle(
      //                         color: Colors.grey,
      //                         fontSize: 12.0,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                       children: <TextSpan>[
      //                         TextSpan(
      //                           text: widget.itemTitle,
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 14.0),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   padding: EdgeInsets.only(
      //                       left: 20.0, bottom: 10.0, right: 20.0),
      //                   alignment: Alignment.topLeft,
      //                   child: RichText(
      //                     text: TextSpan(
      //                       text: 'PRICE: ',
      //                       style: TextStyle(
      //                         color: Colors.grey,
      //                         fontSize: 12.0,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                       children: <TextSpan>[
      //                         TextSpan(
      //                           text: '\$' + widget.itemPrice,
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 14.0),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   padding: EdgeInsets.only(left: 20.0, right: 20.0),
      //                   alignment: Alignment.topLeft,
      //                   child: RichText(
      //                     text: TextSpan(
      //                       text: 'RELEASE DATE: ',
      //                       style: TextStyle(
      //                         color: Colors.grey,
      //                         fontSize: 12.0,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                       children: <TextSpan>[
      //                         TextSpan(
      //                           text: widget.releaseDate,
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 14.0),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 20.0,
      //       ),
      //       Container(
      //         padding: EdgeInsets.only(left: 10.0, bottom: 15.0),
      //         alignment: Alignment.topLeft,
      //         child: Text('Resell Predictions',
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 22.0)),
      //       ),
      //       Row(
      //         children: <Widget>[
      //           Expanded(
      //             child: Container(
      //               margin: EdgeInsets.only(left: 10.0),
      //               decoration: BoxDecoration(
      //                 color: Color.fromRGBO(36, 37, 38, 1),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
      //                       spreadRadius: 2,
      //                       blurRadius: 4),
      //                 ],
      //                 borderRadius: BorderRadius.all(
      //                   Radius.circular(10),
      //                 ),
      //               ),
      //               height: 127.0,
      //               child: Stack(
      //                 children: <Widget>[
      //                   Container(
      //                     alignment: Alignment.center,
      //                     padding: EdgeInsets.only(bottom: 20.0),
      //                     child: Text(
      //                       '\$' + lowPrice,
      //                       style: TextStyle(
      //                           color: Colors.orange,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 36.0),
      //                     ),
      //                   ),
      //                   Container(
      //                     alignment: Alignment.bottomCenter,
      //                     padding: EdgeInsets.only(bottom: 10.0),
      //                     child: Text(
      //                       'Lowest Price',
      //                       style: TextStyle(
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 18.0),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             width: 10.0,
      //           ),
      //           Expanded(
      //             child: Container(
      //               margin: EdgeInsets.only(right: 10.0),
      //               decoration: BoxDecoration(
      //                 color: Color.fromRGBO(36, 37, 38, 1),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
      //                       spreadRadius: 2,
      //                       blurRadius: 4),
      //                 ],
      //                 borderRadius: BorderRadius.all(
      //                   Radius.circular(10),
      //                 ),
      //               ),
      //               height: 127.0,
      //               child: Stack(
      //                 children: <Widget>[
      //                   Container(
      //                     alignment: Alignment.center,
      //                     padding: EdgeInsets.only(bottom: 20.0),
      //                     child: Text(
      //                       '\$' + highPrice,
      //                       style: TextStyle(
      //                           color: Colors.orange,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 36.0),
      //                     ),
      //                   ),
      //                   Container(
      //                     alignment: Alignment.bottomCenter,
      //                     padding: EdgeInsets.only(bottom: 10.0),
      //                     child: Text(
      //                       'Highest Price',
      //                       style: TextStyle(
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 18.0),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 30.0,
      //       ),
      //       Container(
      //         alignment: Alignment.topLeft,
      //         padding: EdgeInsets.only(left: 10.0),
      //         child: Text(
      //           'Sites',
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold,
      //               fontSize: 22.0),
      //         ),
      //       ),
      //       Expanded(
      //         child: ListView.builder(
      //           scrollDirection: Axis.vertical,
      //           itemCount: 4,
      //           itemBuilder: (BuildContext context, int index) {
      //             return Column(
      //               children: <Widget>[
      //                 Row(
      //                   children: <Widget>[
      //                     Expanded(
      //                       child: GestureDetector(
      //                         onTap: () => {sitesClicked()},
      //                         child: Container(
      //                           margin: EdgeInsets.only(
      //                               top: 10.0, left: 10.0, right: 13.0),
      //                           decoration: BoxDecoration(
      //                               color: Colors.blueGrey[400],
      //                               borderRadius: BorderRadius.all(
      //                                 Radius.circular(10),
      //                               ),
      //                               boxShadow: [
      //                                 BoxShadow(
      //                                     color:
      //                                         Colors.black45.withOpacity(0.5),
      //                                     spreadRadius: 4,
      //                                     blurRadius: 2,
      //                                     offset: Offset(0, 0)),
      //                               ]),
      //                           height: 52.0,
      //                           child: Column(
      //                             children: <Widget>[
      //                               Container(
      //                                 padding: EdgeInsets.only(
      //                                     top: 10.0, bottom: 5.0),
      //                                 alignment: Alignment.topCenter,
      //                                 child: Text(
      //                                   'SHOP NAME',
      //                                   style: TextStyle(
      //                                       color: Colors.white,
      //                                       fontSize: 14.0,
      //                                       fontWeight: FontWeight.bold),
      //                                   textAlign: TextAlign.center,
      //                                 ),
      //                               ),
      //                               Expanded(
      //                                 child: SizedBox(),
      //                               ),
      //                               Container(
      //                                 padding: EdgeInsets.only(bottom: 5.0),
      //                                 alignment: Alignment.topCenter,
      //                                 child: Text(
      //                                   '8:00AM EST',
      //                                   style: TextStyle(
      //                                       color: Colors.grey[300],
      //                                       fontSize: 12.0,
      //                                       fontWeight: FontWeight.bold),
      //                                   textAlign: TextAlign.center,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     Expanded(
      //                       child: GestureDetector(
      //                         onTap: () => {sitesClicked()},
      //                         child: Container(
      //                           margin: EdgeInsets.only(top: 10.0, right: 10.0),
      //                           decoration: BoxDecoration(
      //                               color: Colors.blueGrey[400],
      //                               borderRadius: BorderRadius.all(
      //                                 Radius.circular(10),
      //                               ),
      //                               boxShadow: [
      //                                 BoxShadow(
      //                                     color:
      //                                         Colors.black45.withOpacity(0.5),
      //                                     spreadRadius: 4,
      //                                     blurRadius: 2,
      //                                     offset: Offset(0, 0)),
      //                               ]),
      //                           height: 52.0,
      //                           child: Column(
      //                             children: <Widget>[
      //                               Container(
      //                                 padding: EdgeInsets.only(
      //                                     top: 10.0, bottom: 5.0),
      //                                 alignment: Alignment.topCenter,
      //                                 child: Text(
      //                                   'SHOP NAME',
      //                                   style: TextStyle(
      //                                       color: Colors.white,
      //                                       fontSize: 14.0,
      //                                       fontWeight: FontWeight.bold),
      //                                   textAlign: TextAlign.center,
      //                                 ),
      //                               ),
      //                               Expanded(
      //                                 child: SizedBox(),
      //                               ),
      //                               Container(
      //                                 padding: EdgeInsets.only(bottom: 5.0),
      //                                 alignment: Alignment.topCenter,
      //                                 child: Text(
      //                                   '8:00AM EST',
      //                                   style: TextStyle(
      //                                       color: Colors.grey[300],
      //                                       fontSize: 12.0,
      //                                       fontWeight: FontWeight.bold),
      //                                   textAlign: TextAlign.center,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
