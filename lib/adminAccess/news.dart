import 'package:flutter/material.dart';

//View News Page Widget
class ViewNews extends StatefulWidget {
  @override
  _ViewNews createState() => _ViewNews();
}

//View News Widget State
class _ViewNews extends State<ViewNews> {
  String appBarTitle = "News";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
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
        child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Text(
            'Air Jordan 1',
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}
