import 'package:elixirlabs_mobileapp/Options/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:elixirlabs_mobileapp/Options/settings.dart';

//Create Profile Widget
class BrowserTask extends StatefulWidget {
  String taskName;
  BrowserTask({Key key, this.taskName}) : super(key: key);

  @override
  _BrowserTask createState() => _BrowserTask();
}

//Spoof Browser Widget State
class _BrowserTask extends State<BrowserTask> {
  InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(widget.taskName),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(CustomIcons.google)),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 200,
            padding: EdgeInsets.only(
                top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
            child: InAppWebView(
              // initialUrl: 'https://www.google.ca',
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, onPrimary: Colors.white),
                child: Icon(Icons.person),
                onPressed: () {
                  if (webView != null) {
                    webView.goBack();
                  }
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, onPrimary: Colors.white),
                child: Icon(Icons.bolt),
                onPressed: () {
                  if (webView != null) {
                    webView.goForward();
                  }
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan, onPrimary: Colors.white),
                child: IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.refresh),
                ),
                onPressed: () {
                  if (webView != null) {
                    webView.reload();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
