import 'package:elixirlabs_mobileapp/SettingsPopup/drawer.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';
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
  int navIndex = 0;
  String appBarTitle = "Barcode Scanner";
  bool progressStatus = true;
  String barcodeData = '';
  String sneakerData = '';
  String itemName = '';
  String itemDescr = '';
  String itemImage = '';
  bool itemCheck = true;
  Map<String, dynamic> barcodeItem = {};
  Map<String, dynamic> sneakerItem = {};
  TextEditingController size = new TextEditingController();
  TextEditingController boughtPrice = new TextEditingController();

  //Function that gets barcode result from an API and gets another result from another Sneaker Database API
  getSneakerData() async {
    String sneakerURL =
        'https://api.thesneakerdatabase.com/v1/sneakers?limit=10&name=$itemName';

    var sneakerDataResponse = await http.get(sneakerURL);

    try {
      sneakerItem = convert.jsonDecode(sneakerDataResponse.body);
      print(sneakerItem);
    } catch (e) {
      print(e);
    }
  }

  //Function that gets the result of the Barcode Scanner
  getScannedBarcode() async {
    String barcodeAPIURL =
        'https://api.barcodelookup.com/v2/products?barcode=$barcodeData&formatted=y&key=y65xwlx48d5v98os3dej0s9oqma8ik';

    var barcodeDataReponse = await http.get(barcodeAPIURL);

    this.setState(() {
      progressStatus = false;

      try {
        barcodeItem = convert.jsonDecode(barcodeDataReponse.body);
        itemName = barcodeItem['products'][0]['product_name'];
        itemDescr = barcodeItem['products'][0]['description'];
        itemImage = barcodeItem['products'][0]['images'][0];
        size.text = barcodeItem['products'][0]['title'];
        // getSneakerData();
      } catch (e) {
        itemName = 'Not Available';
        itemDescr = 'Not Avilable';
      }
    });
  }

  //Function that reads the data of a Barcode
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

  //Bottom Navigation Bar
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

  //Show Scanner Options
  void scannerClicked() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30.0),
                  topRight: const Radius.circular(30.0),
                ),
                color: Colors.blueGrey[800]),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () => {scannedBarcode(), Navigator.pop(context)},
                        child: Container(
                          height: 90.0,
                          margin: EdgeInsets.only(top: 20.0, left: 20.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.green[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.scanner_rounded,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                    Text(
                                      'Scan A Barcode',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            {Navigator.of(context).push(savedItemsRoute())},
                        child: Container(
                          height: 90.0,
                          margin: EdgeInsets.only(top: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.cyan[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.shopping_bag,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                    Text(
                                      'Saved Items',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
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
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ShowDrawer(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: GestureDetector(
                onTap: () => {scannerClicked()},
                child: Icon(Icons.qr_code_scanner)),
          ),
        ],
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
      body: progressStatus
          ? Container(
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
              child: Center(
                child: Text(
                  'Scan A Barcode',
                  style: TextStyle(color: Colors.grey, fontSize: 20.0),
                ),
              ))
          : Center(
              child: Container(
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
                child: itemName == 'Not Available'
                    ? Container(
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
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Show Item Being Added to The System',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        children: <Widget>[
                          // Expanded(
                          //       child: Container(
                          //         padding: EdgeInsets.only(
                          //             top: 20.0, left: 10.0, right: 10.0),
                          //         child: ClipRRect(
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(10)),
                          //           child: Image.network(
                          //             itemImage,
                          //             width: MediaQuery.of(context).size.width,
                          //             height:
                          //                 MediaQuery.of(context).size.height -
                          //                     600.0,
                          //             fit: BoxFit.fitHeight,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                top: 20.0,
                                bottom: 10.0,
                                left: 20.0,
                                right: 20.0),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              child: Image.network(
                                itemImage,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height - 600.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            // alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(
                                top: 20.0, left: 10.0, right: 10.0),
                            child: Column(
                              children: <Widget>[
                                Container(
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
                                          text: itemName,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
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
                                          text: '\$ 90',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
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
                                          text: 'Jan 23, 2006',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'STYLE ID: ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'testing123',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Add Item',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 28.0),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: TextField(
                                          textCapitalization:
                                              TextCapitalization.words,
                                          controller: size,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor:
                                                Color.fromRGBO(45, 45, 45, 1),
                                            hintText: 'Size',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                          ),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: TextField(
                                          textCapitalization:
                                              TextCapitalization.words,
                                          controller: boughtPrice,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor:
                                                Color.fromRGBO(45, 45, 45, 1),
                                            hintText: '\$ Bought Price',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                          ),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Container(
                                  height: 60.0,
                                  width: MediaQuery.of(context).size.width,
                                  margin:
                                      EdgeInsets.only(left: 30.0, right: 30.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Colors.blue[400]),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.add,
                                          size: 25.0,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          "Add Item",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
    );
  }
}
