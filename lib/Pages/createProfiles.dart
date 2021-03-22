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
  String firstName = 'N/A';
  String lastName = 'N/A';
  String address = 'N/A';
  String zip = 'N/A';
  String phoneNum = 'N/A';
  String state = 'N/A';
  String country = 'N/A';
  String cardNum = 'N/A';
  String cardName = 'N/A';
  String expDate = 'N/A';

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;

  getProfilesCreated() async {
    profileName = [];
    await firestoreInstance.collection("profiles").get().then((querySnapshot) {
      querySnapshot.docs.forEach((profile) {
        var profileData = profile.id;
        profileName.add(profileData);
        firstName = profile.data()["firstName"];
        lastName = profile.data()["lastName"];
        cardNum = profile.data()["cardNumber"];
      });
    });
  }

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
        child: FutureBuilder(
          future: getProfilesCreated(),
          builder: (BuildContext context, snapshot) {
            return profileName != null
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: profileName == null ? 0 : profileName.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(profileName[index]),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            profileName.removeAt(index);
                          });

                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                            "Task Deleted",
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          )));
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
                                              profileName: profileName[index],
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
                                      padding: EdgeInsets.only(
                                          top: 10.0, left: 20.0),
                                      child: Text(
                                        profileName[index],
                                        style: TextStyle(
                                            color: Colors.cyan[400],
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        firstName + ' ' + lastName,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        cardNum,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.0,
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
                  )
                : Center(
                    child: Text(
                    'No Profiles Found',
                    style: TextStyle(color: Colors.grey, fontSize: 20.0),
                  ));
          },
        ),
      ),
    );
  }
}
