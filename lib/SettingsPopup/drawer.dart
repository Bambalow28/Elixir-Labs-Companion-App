import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/barcodeScan/barcode.dart';

//Create Profile Widget
class ShowDrawer extends StatefulWidget {
  @override
  _ShowDrawer createState() => _ShowDrawer();
}

//Spoof Browser Widget State
class _ShowDrawer extends State<ShowDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'SUPREMO#1533',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(21, 21, 21, 1),
            ),
          ),
          Container(
            color: Color.fromRGBO(21, 21, 21, 1),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.scanner,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Barcode Scanner',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BarcodeScanner()))
                  },
                ),
                ListTile(
                  leading: Icon(
                    CustomIcons.chat,
                    size: 18.0,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Chat Room',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BarcodeScanner()))
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text(
                    'Support',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BarcodeScanner()))
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BarcodeScanner()))
                  },
                ),
                ListTile(
                  leading: Icon(Icons.power, color: Colors.white),
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () => {
                    Navigator.of(context).pushReplacementNamed('/'),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
