import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';

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
          PopupMenuButton<String>(
              icon: Icon(CustomIcons.google),
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
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 200,
            padding: EdgeInsets.only(
                top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
            child: InAppWebView(
              initialUrl: 'https://www.google.ca',
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.person),
                color: Colors.blue,
                onPressed: () {
                  if (webView != null) {
                    webView.goBack();
                  }
                },
              ),
              RaisedButton(
                color: Colors.green,
                child: Icon(Icons.bolt),
                onPressed: () {
                  if (webView != null) {
                    webView.goForward();
                  }
                },
              ),
              RaisedButton(
                color: Colors.cyan,
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
