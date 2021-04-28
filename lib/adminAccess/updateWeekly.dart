import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//View News Page Widget
class UpdateWeekly extends StatefulWidget {
  @override
  _UpdateWeekly createState() => _UpdateWeekly();
}

//View News Widget State
class _UpdateWeekly extends State<UpdateWeekly> {
  String appBarTitle = "Weekly Calendar";
  var profileSelected;
  var resetProfileSelected;
  List<String> profileSelect = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () => {print('Save Article')},
              child: Icon(Icons.bookmark_rounded),
            ),
          )
        ],
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
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: StreamBuilder(
                  stream: firestoreInstance.collection("profiles").snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text('Error',
                              style: TextStyle(color: Colors.grey)));
                    }
                    return Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 2.0,
                                style: BorderStyle.solid,
                                color: Colors.blueGrey[600]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          return DropdownButtonHideUnderline(
                            child: Container(
                              width: 150.0,
                              margin: EdgeInsets.only(left: 8.0, right: 8.0),
                              child: DropdownButton<String>(
                                hint: Text(
                                  'Select Day',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                dropdownColor: Colors.grey[850],
                                value: profileSelected,
                                style: TextStyle(color: Colors.white),
                                onChanged: (newValue) {
                                  setState(() {
                                    profileSelected = newValue;
                                    print(profileSelected);
                                  });
                                },
                                items: profileSelect.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
