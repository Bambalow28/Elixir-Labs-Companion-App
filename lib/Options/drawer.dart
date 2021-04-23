import 'package:elixirlabs_mobileapp/Options/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elixirlabs_mobileapp/Options/settings.dart';

//Create Profile Widget
class ShowDrawer extends StatefulWidget {
  @override
  _ShowDrawer createState() => _ShowDrawer();
}

//Create Firebase Instance
final firestoreInstance = FirebaseFirestore.instance;

//Create SharedPreferences Instance
SharedPreferences sharedPreferences;

//Spoof Browser Widget State
class _ShowDrawer extends State<ShowDrawer> {
  var discordName;
  var profilePic;
  var role;
  var userID;

//Fetch User Data from Firebase
  Future getProfileInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    userID = sharedPreferences.getString('userID');
    await firestoreInstance.collection("users").doc(userID).get().then((info) {
      setState(() {
        discordName = info.data()["discordName"];
        profilePic = info.data()["profilePic"];
        role = info.data()["role"];
      });
    });
  }

  logOutClicked() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('userLoggedIn', false);
    Navigator.of(context).push(loginRoute());
  }

  @override
  void initState() {
    super.initState();
    getProfileInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return discordName != null
              ? SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Container(
                        color: Color.fromRGBO(30, 30, 30, 1),
                        child: Column(
                          children: <Widget>[
                            DrawerHeader(
                              padding: EdgeInsets.all(0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(bottom: 15.0),
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                      image: new DecorationImage(
                                        fit: BoxFit.contain,
                                        image: new NetworkImage(
                                          profilePic,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      discordName,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      role,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(height: 1.0, color: Colors.grey),
                            ListTile(
                              leading: Icon(
                                Icons.scanner,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Barcode Scanner',
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () => {
                                Navigator.pop(context),
                                Navigator.of(context).push(barcodeRoute())
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.calendar_today_rounded,
                                  color: Colors.white),
                              title: Text(
                                "Weekly Calendar",
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () => {
                                Navigator.pop(context),
                                Navigator.of(context)
                                    .push(weeklyCalendarRoute())
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                CustomIcons.chat,
                                size: 18.0,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Chat Room',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () => {
                                Navigator.pop(context),
                                Navigator.of(context).push(chatRoute())
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.attach_money_rounded,
                                  color: Colors.white),
                              title: Text(
                                'Sponsors',
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () => {
                                Navigator.pop(context),
                                Navigator.of(context).push(sponsorsRoute())
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.person, color: Colors.white),
                              title: Text(
                                'Support',
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () => {
                                Navigator.pop(context),
                                Navigator.of(context).push(supportRoute())
                              },
                            ),
                            role == 'Friends & Family'
                                ? ListTile(
                                    leading: Icon(
                                        Icons.admin_panel_settings_rounded,
                                        color: Colors.orange[300]),
                                    title: Text(
                                      'Admin Options',
                                      style:
                                          TextStyle(color: Colors.orange[300]),
                                    ),
                                    onTap: () => {
                                      Navigator.pop(context),
                                      Navigator.of(context)
                                          .push(adminHomeRoute())
                                    },
                                  )
                                : ListTile(
                                    leading: Icon(Icons.person,
                                        color: Colors.transparent),
                                    title: Text(
                                      '',
                                      style:
                                          TextStyle(color: Colors.transparent),
                                    ),
                                    onTap: () => {print(role)},
                                  ),
                            const Expanded(child: SizedBox()),
                            Container(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.pop(context),
                                  Navigator.of(context).push(reportIssue())
                                },
                                child: Text(
                                  'Report App Issue',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.underline),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const Divider(height: 1.0, color: Colors.grey),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    // Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserSettings()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Colors.grey[700],
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom: 20.0, left: 40.0),
                                    height: 50.0,
                                    child: Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => {logOutClicked()},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.red[500],
                                      ),
                                      margin: EdgeInsets.only(
                                          bottom: 20.0, right: 40.0),
                                      height: 50.0,
                                      child: Icon(
                                        Icons.exit_to_app_rounded,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Color.fromRGBO(30, 30, 30, 1),
                );
        },
      ),
    );
  }
}
