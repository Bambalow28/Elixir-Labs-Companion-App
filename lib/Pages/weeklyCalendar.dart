import 'package:elixirlabs_mobileapp/Pages/weeklyDaysClicked.dart';
import 'package:elixirlabs_mobileapp/Options/drawer.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:intl/intl.dart';

//Weekly Calendar Widget
class WeeklyCalendar extends StatefulWidget {
  @override
  _WeeklyCalendar createState() => _WeeklyCalendar();
}

//Spoof Browser Widget State
class _WeeklyCalendar extends State<WeeklyCalendar> {
  static final DateTime now = DateTime.now();
  static final DateFormat dateFormatter = DateFormat('MMMM dd, yyyy');
  final String dateFormatted = dateFormatter.format(now);
  int navIndex;

  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  void navigationBarTapped(int index) {
    setState(() {
      navIndex = index;

      switch (navIndex) {
        case 0:
          Navigator.of(context).push(homeRoute());
          break;

        case 1:
          Navigator.of(context).push(spoofBrowserRoute());
          break;

        case 2:
          Navigator.of(context).push(supremeBotRoute());
          break;

        case 3:
          Navigator.of(context).push(profileRoute());
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print(dateFormatted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: ShowDrawer(),
      appBar: AppBar(
        title: Text('Weekly Calendar'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: navigationBarTapped,
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        iconSize: 27.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                color: Colors.white,
              ),
              label: ('')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
                color: Colors.white,
              ),
              label: ('')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              label: ('')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: (''))
        ],
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
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              child: Text(
                'This Week',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 5.0, left: 15.0, bottom: 20.0),
              child: Text(
                'Today: ' + dateFormatted,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 150.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DaysClicked(day: 'Monday')))
                          },
                          child: Container(
                              height: 100.0,
                              margin: EdgeInsets.only(left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 2.0,
                                        offset: Offset(0, 0))
                                  ]),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Monday',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DaysClicked(day: 'Tuesday')))
                          },
                          child: Container(
                              height: 100.0,
                              margin: EdgeInsets.only(left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 2.0,
                                        offset: Offset(0, 0))
                                  ]),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Tuesday',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DaysClicked(day: 'Wednesday')))
                          },
                          child: Container(
                              height: 100.0,
                              margin: EdgeInsets.only(left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 2.0,
                                        offset: Offset(0, 0))
                                  ]),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Wednesday',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DaysClicked(day: 'Thursday')))
                          },
                          child: Container(
                              height: 100.0,
                              margin: EdgeInsets.only(left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 2.0,
                                        offset: Offset(0, 0))
                                  ]),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Thursday',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DaysClicked(day: 'Friday')))
                          },
                          child: Container(
                              height: 100.0,
                              margin: EdgeInsets.only(left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 2.0,
                                        offset: Offset(0, 0))
                                  ]),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Friday',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DaysClicked(day: 'Saturday')))
                          },
                          child: Container(
                              height: 100.0,
                              margin: EdgeInsets.only(left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 2.0,
                                        offset: Offset(0, 0))
                                  ]),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Saturday',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DaysClicked(day: 'Sunday')))
                      },
                      child: Container(
                          height: 80.0,
                          margin:
                              EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45.withOpacity(0.5),
                                    spreadRadius: 2.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 0))
                              ]),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sunday',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    )
                  ],
                ),
                // child: ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   itemCount: days.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return GestureDetector(
                //         onTap: () => {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) =>
                //                           DaysClicked(day: days[index])))
                //             },
                //         child: Column(
                //           children: <Widget>[
                //             Container(
                //               width: MediaQuery.of(context).size.width - 10,
                //               margin: EdgeInsets.only(
                //                   top: 5.0,
                //                   left: 5.0,
                //                   right: 5.0,
                //                   bottom: 10.0),
                //               height: 60.0,
                //               decoration: BoxDecoration(
                //                   color: Colors.grey[850],
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(20.0)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                         color: Colors.black38.withOpacity(0.5),
                //                         spreadRadius: 2,
                //                         blurRadius: 4,
                //                         offset: Offset(0, 0)),
                //                   ]),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: <Widget>[
                //                   Row(
                //                     children: <Widget>[
                //                       Expanded(
                //                         child: Container(
                //                           padding: EdgeInsets.only(left: 15.0),
                //                           alignment: Alignment.topLeft,
                //                           child: Text(
                //                             days[index],
                //                             style: TextStyle(
                //                                 color: Colors.white,
                //                                 fontSize: 20.0,
                //                                 fontWeight: FontWeight.bold),
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   // Expanded(
                //                   //   child: GestureDetector(
                //                   //     onTap: () => {
                //                   //       Navigator.of(context)
                //                   //           .push(weeklyCalendarItemRoute())
                //                   //     },
                //                   //     child: Container(
                //                   //       margin:
                //                   //           EdgeInsets.only(left: 5.0, right: 5.0),
                //                   //       width:
                //                   //           MediaQuery.of(context).size.width - 20,
                //                   //       height: 50.0,
                //                   //       child: ListView.builder(
                //                   //         scrollDirection: Axis.horizontal,
                //                   //         itemCount: days.length,
                //                   //         itemBuilder:
                //                   //             (BuildContext context, int index) {
                //                   //           return Column(
                //                   //             children: <Widget>[
                //                   //               Container(
                //                   //                 width: 140.0,
                //                   //                 margin: EdgeInsets.only(
                //                   //                     top: 5.0,
                //                   //                     left: 5.0,
                //                   //                     right: 5.0,
                //                   //                     bottom: 10.0),
                //                   //                 height: 140.0,
                //                   //                 decoration: BoxDecoration(
                //                   //                   color: Colors.blueGrey[500],
                //                   //                   borderRadius: BorderRadius.all(
                //                   //                       Radius.circular(20.0)),
                //                   //                 ),
                //                   //                 child: Column(
                //                   //                   children: <Widget>[
                //                   //                     Container(
                //                   //                       padding: EdgeInsets.only(
                //                   //                           top: 15.0,
                //                   //                           left: 10.0,
                //                   //                           right: 10.0),
                //                   //                       alignment:
                //                   //                           Alignment.topCenter,
                //                   //                       child: ClipRRect(
                //                   //                         borderRadius:
                //                   //                             BorderRadius.all(
                //                   //                                 Radius.circular(
                //                   //                                     10)),
                //                   //                         child: Image.asset(
                //                   //                           "assets/images/jordanss.png",
                //                   //                           width: MediaQuery.of(
                //                   //                                   context)
                //                   //                               .size
                //                   //                               .width,
                //                   //                           height: 70.0,
                //                   //                           fit: BoxFit.fill,
                //                   //                         ),
                //                   //                       ),
                //                   //                     ),
                //                   //                     Expanded(
                //                   //                       child: SizedBox(),
                //                   //                     ),
                //                   //                     Stack(
                //                   //                       children: <Widget>[
                //                   //                         Container(
                //                   //                           padding:
                //                   //                               EdgeInsets.only(
                //                   //                                   left: 13.0,
                //                   //                                   bottom: 20.0),
                //                   //                           alignment:
                //                   //                               Alignment.topLeft,
                //                   //                           child: Text(
                //                   //                             'Name: ' +
                //                   //                                 'Supreme Drop',
                //                   //                             style: TextStyle(
                //                   //                                 color:
                //                   //                                     Colors.white,
                //                   //                                 fontSize: 12.0,
                //                   //                                 fontWeight:
                //                   //                                     FontWeight
                //                   //                                         .bold),
                //                   //                           ),
                //                   //                         ),
                //                   //                         Container(
                //                   //                           padding:
                //                   //                               EdgeInsets.only(
                //                   //                                   top: 30.0,
                //                   //                                   left: 13.0),
                //                   //                           child: Text(
                //                   //                             "Time: " +
                //                   //                                 '8:00AM EST',
                //                   //                             textAlign:
                //                   //                                 TextAlign.center,
                //                   //                             style: TextStyle(
                //                   //                               fontSize: 12.0,
                //                   //                               color: Colors
                //                   //                                   .grey[300],
                //                   //                             ),
                //                   //                           ),
                //                   //                         ),
                //                   //                       ],
                //                   //                     ),
                //                   //                   ],
                //                   //                 ),
                //                   //               ),
                //                   //             ],
                //                   //           );
                //                   //         },
                //                   //       ),
                //                   //     ),
                //                   //   ),
                //                   // ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ));
                //   },
                // ),
              ),
            ),
          ],
        ),
        // Expanded(
        //               child: Container(
        //                 margin:
        //                     EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
        //                 height: MediaQuery.of(context).size.height - 500,
        //                 child:
        //               ),
        //             ),
      ),
    );
  }
}
