import 'package:flutter/material.dart';

//Create Profile Widget
class BrowserTask extends StatefulWidget {
  @override
  _BrowserTask createState() => _BrowserTask();
}

//Spoof Browser Widget State
class _BrowserTask extends State<BrowserTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text('Browser Task'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        // actions: <Widget>[
        //   PopupMenuButton<String>(
        //       icon: Icon(Icons.chat_bubble_outline),
        //       itemBuilder: (BuildContext context) {
        //         return Constants.options.map((String choice) {
        //           return PopupMenuItem<String>(
        //             value: choice,
        //             child: Text(choice),
        //           );
        //         }).toList();
        //       }),
        // ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Profiles',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue, width: 1.0)),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
