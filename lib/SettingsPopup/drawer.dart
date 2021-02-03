import 'package:flutter/material.dart';

Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Welcome,',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
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
      ),