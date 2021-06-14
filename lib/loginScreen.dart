import 'package:elixirlabs_mobileapp/Pages/routes.dart';
import 'package:elixirlabs_mobileapp/Options/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'dart:core';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import "bottomNavigationPages/home.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visa/auth-data.dart';
import 'package:visa/discord.dart';
import 'package:visa/engine/visa.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';

String baseUrl = "https://discord.com/api/oauth2/authorize";
final clientID = '799140079494496276';
final clientSecret = '7QZ0cVfqyHPCTitgIBkK3IhlDgYcjvbd';
String redirectURL = 'https://api.elixirlabs.xyz/discord_oauth?req=get_roles';

var id;
var profilePic;
var email;
var discordName;
var discordDiscriminator;
var role;
bool status;

//Login Widget
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

//Login Page Widget State
class _LoginState extends State<LoginPage> with SingleTickerProviderStateMixin {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool isLoggedIn = false;
  bool checkPressed = false;

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  navigateToHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        ModalRoute.withName("/LoginPage"));
  }

  saveToDB() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('userID', id);
    await sharedPreferences.setBool('firstTimeLoggedIn', true);
    firestoreInstance.collection("users").doc(id).set({
      "userID": id,
      "discordName": discordName + '#' + discordDiscriminator,
      "email": email,
      "role": role,
      "profilePic": profilePic,
    }).then((result) {
      print('User Saved in Firebase! User is a ' + role);
      var check = sharedPreferences.getString('userID');
      print(check);
    });
    navigateToHome();
  }

  //This Function handles the Oauth2 login process
  launchURL() {
    done(AuthData authData) async {
      id = authData.userID;
      profilePic = authData.profileImgUrl;
      email = authData.email;
      discordName = authData.userJson["username"];
      discordDiscriminator = authData.userJson["discriminator"];

      var usersRoles = await http
          .get('https://api.elixirlabs.xyz/discord_oauth?req=get_roles&id=$id');
      var roles = convert.jsonDecode(usersRoles.body);

      final snapshot =
          await firestoreInstance.collection("users").doc(id).get();

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      status = sharedPreferences.getBool('userLoggedIn');

      if (snapshot.exists) {
        if (discordName == 'SUPREMO' && discordDiscriminator == '1533') {
          print('Developer Signed In');
        }
        print('User Exists! Getting Info now..');
        await sharedPreferences.setBool('userLoggedIn', true);
        await sharedPreferences.setBool('firstTimeLoggedIn', false);
        await sharedPreferences.setString('userID', id);
        navigateToHome();
      } else {
        for (var i = 0; i < roles.length; i++) {
          var name = roles[i]["name"];
          if (name == 'Administrator') {
            role = 'Administrator';
            print(name);
            saveToDB();
            break;
          } else if (name.toString() == 'Friends & Family') {
            role = 'Friends & Family';
            print(name);
            saveToDB();
            break;
          } else if (name == 'Member') {
            role = 'Member';
            print(name);
            saveToDB();
            break;
          } else {
            print('Not A Member, ' + 'Role is: ' + name);
          }
          // switch (name) {
          //   case 'Administrator':
          //     role = 'Admin';
          //     saveToDB();
          //     continue;
          //   case 'Friends & Family':
          //     role = 'Friends & Family';
          //     saveToDB();
          //     break;
          //   case 'Member':
          //     role = 'Member';
          //     saveToDB();
          //     break;
          //   default:
          //     print('Not a Member');
          //     break;
          // }
        }
      }
    }

    return status == true
        ? navigateToHome()
        : Scaffold(
            appBar: AppBar(
              title: Text('Discord Login'),
              backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded, size: 25.0),
                  onPressed: () => Navigator.pop(context)),
            ),
            body: DiscordAuth().visa.authenticate(
                clientID: clientID,
                clientSecret: clientSecret,
                redirectUri: redirectURL,
                state: 'discordAuth',
                scope: 'identify',
                onDone: done));
  }

  @override
  Widget build(BuildContext context) {
    //Login View
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            WaveWidget(
              config: CustomConfig(
                gradients: [
                  [Colors.cyanAccent, Color(0x66FF9800)],
                  [Colors.cyan, Color(0x55FFEB3B)]
                ],
                durations: [10800, 6000],
                heightPercentages: [0.50, 0.52],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
              backgroundColor: Color.fromRGBO(18, 18, 18, 1),
              size: Size(
                double.infinity,
                double.infinity,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, right: 40.0, bottom: 20.0, top: 190.0),
                child: Column(
                  children: <Widget>[
                    //Logo Photo PNG
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          "assets/images/newElixirLogo.png",
                          fit: BoxFit.contain,
                          width: 150.0,
                        ),
                      ),
                    ),
                    // Padding(padding: const EdgeInsets.all(100.0)),
                    Expanded(
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onTap: () => {
                        checkPressed
                            ? Colors.white
                            : const Color.fromRGBO(18, 18, 18, 1.0),
                        setState(() {
                          checkPressed = !checkPressed;
                          // navigateToHome();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => launchURL()));
                        })
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(23, 23, 23, 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[900].withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 2,
                                  offset: Offset(0, 3)),
                            ]),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                CustomIcons.discord,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                              ),
                              Text("Login via Discord",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 130.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
