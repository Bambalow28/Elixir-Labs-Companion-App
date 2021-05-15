import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elixirlabs_mobileapp/Pages/weeklyCalendarItem.dart';

//Weekly Calendar Widget
class DaysClicked extends StatefulWidget {
  String day;
  DaysClicked({Key key, this.day}) : super(key: key);

  @override
  _DaysClicked createState() => _DaysClicked();
}

//Spoof Browser Widget State
class _DaysClicked extends State<DaysClicked> {
  int navIndex;
  var itemName;
  var itemPrice;
  var releaseDate;

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;

  // //Fetch Releases
  // getReleasesInfo() async {
  //   await firestoreInstance
  //       .collection('weeklyCalendar')
  //       .doc('days')
  //       .collection(widget.day)
  //       .get()
  //       .then((value) => value.docs.forEach((element) {
  //             itemName = element["itemName"];
  //             itemPrice = element["itemPrice"];
  //           }));
  // }

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
      appBar: AppBar(
        title: Text(widget.day),
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
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              alignment: Alignment.topLeft,
              child: Text(
                "Today's Releases",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: StreamBuilder(
              stream: firestoreInstance
                  .collection('weeklyCalendar')
                  .doc('days')
                  .collection(widget.day)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print('Something Went Wrong');
                }

                if (!snapshot.hasData) {
                  return Center(
                      child: Text('No Data Found',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)));
                } else {
                  final itemReleases = snapshot.data.docs;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: itemReleases.length,
                      itemBuilder: (BuildContext context, int index) {
                        String itemName = itemReleases[index]['itemName'];
                        String itemPrice = itemReleases[index]['itemPrice'];
                        String itemReleaseDate =
                            itemReleases[index]['releaseDate'];

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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WeeklyCalendarItem(
                                                      itemTitle: itemName,
                                                      itemPrice: itemPrice,
                                                      releaseDate:
                                                          itemReleaseDate,
                                                      dayCheck: widget.day)))
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 10.0, right: 10.0, top: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 1)
                                                  .withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 4),
                                        ],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height: 90.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              padding: EdgeInsets.only(
                                                  left: 10.0, bottom: 5.0),
                                              alignment: Alignment.topLeft,
                                              child: RichText(
                                                  text: TextSpan(
                                                text: 'ITEM NAME: ',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: itemName,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.0),
                                                  ),
                                                ],
                                              ))),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10.0, bottom: 5.0),
                                            alignment: Alignment.topLeft,
                                            child: RichText(
                                                text: TextSpan(
                                              text: 'PRICE: ',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '\$' + itemPrice,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.0),
                                                ),
                                              ],
                                            )),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            alignment: Alignment.topLeft,
                                            child: RichText(
                                                text: TextSpan(
                                              text: 'RELEASE DATE: ',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: itemReleaseDate,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.0),
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
              },
            ))
          ],
        ),
      ),
    );
  }
}
