import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:elixirlabs_mobileapp/Options/drawer.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

//Create Profile Widget
class SponsorsPage extends StatefulWidget {
  @override
  _SponsorsPage createState() => _SponsorsPage();
}

//Spoof Browser Widget State
class _SponsorsPage extends State<SponsorsPage> {
  int navIndex;
  String appBarTitle = "Sponsors";
  String sponsorName = 'Ashburn Proxies';
  String sponsorLink = 'https://www.ashburnproxies.com';

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

  sponsorLinkClicked(BuildContext context) {
    print('test');
    return Scaffold(
        appBar: AppBar(
          title: Text(sponsorName),
          backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded, size: 25.0),
              onPressed: () => Navigator.pop(context)),
        ),
        body: Builder(builder: (BuildContext context) {
          return InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(sponsorLink)),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: ShowDrawer(),
      appBar: AppBar(
        title: Text(appBarTitle),
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
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: sponsorLinkClicked(context)))
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width - 50,
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'assets/images/ashburn.jpg',
                                fit: BoxFit.fill,
                              ),
                            )),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        sponsorName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 20.0),
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'TWITTER: ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '@AshburnProxies',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          bottom: 5.0, right: 5.0),
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'WEBSITE: ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: sponsorLink,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0),
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
