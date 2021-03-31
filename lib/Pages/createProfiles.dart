import 'package:elixirlabs_mobileapp/Pages/viewProfile.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/createProfilePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Create Profile Widget
class CreateProfile extends StatefulWidget {
  @override
  _CreateProfile createState() => _CreateProfile();
}

//Spoof Browser Widget State
class _CreateProfile extends State<CreateProfile> {
  String appBarTitle = "Profiles";
  bool billingInfo = true;
  bool billingVisible = false;
  List<String> profileName = [];
  Future getData;

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;

  void createProfilePressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreateProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Profiles'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
                onTap: () => {createProfilePressed()},
                child: Icon(Icons.person_add_alt_1)),
          ),
        ],
      ),
      body: Container(
        // margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
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
        child: StreamBuilder(
          stream: firestoreInstance.collection("profiles").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final profileList = snapshot.data.docs;

              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: profileList.length,
                itemBuilder: (BuildContext context, int index) {
                  String test = profileList[index]["cardNumber"];

                  return Dismissible(
                    key: Key(profileList[index]["profileName"]),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() async {
                        profileName.removeAt(index);
                        await firestoreInstance
                            .collection("profiles")
                            .doc(profileList[index][["profileName"]])
                            .delete()
                            .then(
                              (check) =>
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                "Profile Deleted",
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.center,
                              ))),
                            )
                            .catchError(
                              (error) =>
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                "Something Went Wrong",
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.center,
                              ))),
                            );
                      });
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.delete,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewProfile(
                                          profileName: profileList[index]
                                              ["profileName"],
                                        ))),
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 20.0, left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[900],
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 1)
                                        .withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            height: 100.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 20.0),
                                  child: Text(
                                    profileList[index]["profileName"],
                                    style: TextStyle(
                                        color: Colors.cyan[400],
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    profileList[index]["firstName"] +
                                        ' ' +
                                        profileList[index]["lastName"],
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding:
                                      EdgeInsets.only(left: 20.0, bottom: 5.0),
                                  child: Text(
                                    profileList[index]["cardNumber"] == null
                                        ? 'Not Available'
                                        : profileList[index]["cardNumber"],
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
