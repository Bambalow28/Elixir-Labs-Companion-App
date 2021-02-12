import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zendesk/zendesk.dart';

const ZendeskAccountKey = 'SM1FWmfqgGJYK0Sy8oUKZQ2oMfBw0Zum';

class Supprt extends StatefulWidget {
  @override
  _Supprt createState() => new _Supprt();
}

class _Supprt extends State<Supprt> {
  final Zendesk zendesk = Zendesk();

  @override
  void initState() {
    super.initState();
    initZendesk();
  }

  // Zendesk is asynchronous, so we initialize in an async method.
  Future<void> initZendesk() async {
    zendesk.init(ZendeskAccountKey).then((r) {
      print('init finished');
    }).catchError((e) {
      print('failed with error $e');
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // But we aren't calling setState, so the above point is rather moot now.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Support Center'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              if (Platform.isIOS)
                RaisedButton(
                  child: Text('Start Chat'),
                  onPressed: () async {
                    zendesk
                        .startChat(
                      iosNavigationBarColor: Colors.cyan,
                      iosNavigationTitleColor: Colors.black,
                    )
                        .then((r) {
                      print('startChat finished');
                    }).catchError((e) {
                      print('error $e');
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
