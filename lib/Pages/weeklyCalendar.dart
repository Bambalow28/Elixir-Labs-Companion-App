import 'package:elixirlabs_mobileapp/SettingsPopup/drawer.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Weekly Calendar Widget
class WeeklyCalendar extends StatefulWidget {
  @override
  _WeeklyCalendar createState() => _WeeklyCalendar();
}

//Spoof Browser Widget State
class _WeeklyCalendar extends State<WeeklyCalendar> {
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
        // margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
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
                'March 13, 2021',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 150.0,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 10,
                          margin: EdgeInsets.only(
                              top: 10.0, left: 5.0, right: 5.0, bottom: 10.0),
                          height: 150.0,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: Offset(0, 0)),
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 10.0, left: 15.0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  days[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
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
