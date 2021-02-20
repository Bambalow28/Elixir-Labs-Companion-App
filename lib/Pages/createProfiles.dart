import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/createProfilePage.dart';

//Create Profile Widget
class CreateProfile extends StatefulWidget {
  @override
  _CreateProfile createState() => _CreateProfile();
}

//Spoof Browser Widget State
class _CreateProfile extends State<CreateProfile> {
  int navIndex = 1;
  String appBarTitle = "Profiles";
  bool billingInfo = true;
  bool billingVisible = false;

  void profilePressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person_add),
                title: Text('Create Profile'),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateProfilePage())),
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      appBar: AppBar(
        title: Text('Profiles'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(Icons.person),
              itemBuilder: (BuildContext context) {
                profilePressed();
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Profiles',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
