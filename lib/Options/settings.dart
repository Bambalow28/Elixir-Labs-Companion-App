import 'package:flutter/material.dart';

//User Settings Widget
class UserSettings extends StatefulWidget {
  @override
  _UserSettings createState() => _UserSettings();
}

//Spoof Browser Widget State
class _UserSettings extends State<UserSettings> {
  int navIndex;
  String appBarTitle = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 2.0, right: 15.0),
            child: GestureDetector(
              onTap: () => {print('Property of Elixir Labs. 2021')},
              child: Icon(
                Icons.help,
                size: 27.0,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).requestFocus(new FocusNode()),
        },
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.transparent,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          child: CircleAvatar(
                                            backgroundColor: Colors.grey[400],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey[600],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            // SizedBox(height: 10.0),
            // Container(
            //   padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            //   height: 60.0,
            //   child: TextField(
            //     controller: message,
            //     textCapitalization: TextCapitalization.words,
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.all(8.0),
            //       filled: true,
            //       fillColor: Color.fromRGBO(45, 45, 45, 1),
            //       hintText: 'Enter Message...',
            //       hintStyle: TextStyle(color: Colors.grey),
            //       suffixIcon: IconButton(
            //         onPressed: () => {print('Sent'), message.clear()},
            //         icon: Icon(
            //           Icons.send_rounded,
            //           color: Colors.blue[400],
            //         ),
            //         highlightColor: Colors.transparent,
            //         splashColor: Colors.transparent,
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(10.0))),
            //       focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(10.0))),
            //     ),
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
