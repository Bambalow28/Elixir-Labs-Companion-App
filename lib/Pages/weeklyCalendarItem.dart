import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';

//Create Profile Widget
class WeeklyCalendarItem extends StatefulWidget {
  @override
  _WeeklyCalendarItem createState() => _WeeklyCalendarItem();
}

//Spoof Browser Widget State
class _WeeklyCalendarItem extends State<WeeklyCalendarItem> {
  InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text('Item Name'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      ),
      body: Container(
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
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(
                  'assets/images/jordanss.png',
                  fit: BoxFit.fill,
                  height: 200.0,
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
            Container(
              padding: EdgeInsets.only(left: 20.0, bottom: 10.0, right: 20.0),
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
                      text: 'Item Name',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, bottom: 10.0, right: 20.0),
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  text: 'PRICE: ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Item Price',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, bottom: 10.0, right: 20.0),
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  text: 'TIME OF RELEASE: ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Date',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
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
                            color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
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
                            'N/A',
                            style: TextStyle(
                                color: Colors.orange,
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
                            color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
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
                            'N/A',
                            style: TextStyle(
                                color: Colors.orange,
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
                                        color: Colors.black45.withOpacity(0.5),
                                        spreadRadius: 4,
                                        blurRadius: 2,
                                        offset: Offset(0, 0)),
                                  ]),
                              height: 52.0,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 10.0, bottom: 5.0),
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
                                      'Time: ' + '8:00AM EST',
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
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0, right: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey[400],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45.withOpacity(0.5),
                                        spreadRadius: 4,
                                        blurRadius: 2,
                                        offset: Offset(0, 0)),
                                  ]),
                              height: 52.0,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 10.0, bottom: 5.0),
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
                                      'Time: ' + '8:00AM EST',
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
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
