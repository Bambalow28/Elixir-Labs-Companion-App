import 'package:flutter/material.dart';

//Create Profile Widget
class CreateProfile extends StatefulWidget {
  @override
  _CreateProfile createState() => _CreateProfile();
}

//Spoof Browser Widget State
class _CreateProfile extends State<CreateProfile> {
  int navIndex = 1;
  String appBarTitle = "Spoof Browser";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text('Profiles'),
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
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
