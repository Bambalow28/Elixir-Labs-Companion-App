import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/drawer.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Supreme Bot Widget
class BarcodeScanner extends StatefulWidget {
  @override
  _BarcodeScan createState() => _BarcodeScan();
}

//Spoof Browser Widget State
class _BarcodeScan extends State<BarcodeScanner> {
  int navIndex = 2;
  String appBarTitle = "Barcode Scanner";
  bool progressStatus = true;
  String barcodeData = '';
  String itemName = '';
  String itemDescr = '';
  String itemImage = '';
  Map<String, dynamic> barcodeItem;

  getScannedBarcode() async {
    String barcodeAPIURL =
        'https://api.barcodelookup.com/v2/products?barcode=$barcodeData&formatted=y&key=y65xwlx48d5v98os3dej0s9oqma8ik';

    var res = await http.get(barcodeAPIURL);

    this.setState(() {
      progressStatus = false;

      try {
        barcodeItem = convert.jsonDecode(res.body);
        itemName = barcodeItem['products'][0]['product_name'];
        itemDescr = barcodeItem['products'][0]['description'];
        itemImage = barcodeItem['products'][0]['images'][0];
      } catch (e) {
        itemName = 'Not Available';
        itemDescr = 'Not Avilable';
      }
    });
  }

  scannedBarcode() async {
    await FlutterBarcodeScanner.scanBarcode(
            '#FF0000', 'Cancel', true, ScanMode.BARCODE)
        .then((value) => setState(() => barcodeData = value));
    return getScannedBarcode();
  }

  //Option Menu Action
  void choiceAction(String choice) {
    if (choice == BarcodeSelection.ScanBarcode) {
      scannedBarcode();
    }
  }

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
          appBarTitle = "Supreme";
          break;

        case 3:
          Navigator.of(context).push(profileRoute());
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ShowDrawer(),
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(Icons.save),
              itemBuilder: (BuildContext context) {
                return BarcodeSelection.options.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: navigationBarTapped,
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        iconSize: 25.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
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
                Icons.person_outline,
                color: Colors.white,
              ),
              label: (''))
        ],
      ),
      body: progressStatus
          ? Center(
              child: Text(
                'Scan A Barcode',
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
            )
          : Center(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        itemImage,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 600.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Item Barcode: " + barcodeData,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      "Item Name: " + itemName,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      "Item Description: " + itemDescr,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: SpeedDial(
        overlayColor: Colors.grey,
        overlayOpacity: 0.0,
        backgroundColor: Colors.cyan,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: Icon(Icons.scanner),
              label: "Scan",
              backgroundColor: Colors.amber,
              onTap: () async => {
                    scannedBarcode(),
                  }),
          SpeedDialChild(
              child: Icon(Icons.save),
              label: "Saved Barcodes",
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
