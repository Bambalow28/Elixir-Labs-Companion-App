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
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Elixir Labs HQ',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.orange,
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/cover.jpg'))
            ),
          ),
          ListTile(
            leading: Icon(Icons.scanner),
            title: Text('Barcode Scanner'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BarcodeScanner()))
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Support'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BarcodeScanner()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BarcodeScanner()))
            },
          ),
          ListTile(
            leading: Icon(Icons.power),
            title: Text('Log Out'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BarcodeScanner()))
            },
          ),
        ],
      ),
    );
  }
}
