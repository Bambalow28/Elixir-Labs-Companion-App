import 'package:elixirlabs_mobileapp/SettingsPopup/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/Pages/routes.dart';

//Create Profile Widget
class ShowDrawer extends StatefulWidget {
  @override
  _ShowDrawer createState() => _ShowDrawer();
}

//Spoof Browser Widget State
class _ShowDrawer extends State<ShowDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Container(
                  color: Color.fromRGBO(21, 21, 21, 1),
                  child: Column(
                    children: <Widget>[
                      DrawerHeader(
                        padding: EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 15.0),
                              width: 80.0,
                              height: 80.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.grey
                                  // image: new DecorationImage(
                                  //   fit: BoxFit.fill,
                                  //   image: new NetworkImage(
                                  //     "https://example.com/assets/images/john-doe.jpg",
                                  //   ),
                                  // ),
                                  ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'SUPREMO#1533',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Member Since 2019',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(21, 21, 21, 1),
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
                        onTap: () =>
                            {Navigator.of(context).push(barcodeRoute())},
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
                        onTap: () => {Navigator.of(context).push(chatRoute())},
                      ),
                      ListTile(
                        leading: Icon(Icons.attach_money_rounded,
                            color: Colors.white),
                        title: Text(
                          'Sponsors',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () =>
                            {Navigator.of(context).push(supportRoute())},
                      ),
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.white),
                        title: Text(
                          'Support',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () =>
                            {Navigator.of(context).push(supportRoute())},
                      ),
                      const Expanded(child: SizedBox()),

                      const Divider(height: 1.0, color: Colors.grey),
                      // ListTile(
                      //   title: Text(
                      //     'Beta 1.0',
                      //     style: TextStyle(color: Colors.grey),
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.grey,
                              ),
                              margin: EdgeInsets.only(bottom: 20.0, left: 40.0),
                              height: 50.0,
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.red[400],
                              ),
                              margin:
                                  EdgeInsets.only(bottom: 20.0, right: 40.0),
                              height: 50.0,
                              child: Icon(
                                Icons.exit_to_app_rounded,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ListTile(
                      //   leading: Icon(Icons.settings, color: Colors.white),
                      //   title: Text(
                      //     'Settings',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   onTap: () =>
                      //       {Navigator.of(context).push(profileRoute())},
                      // ),
                      // ListTile(
                      //   leading:
                      //       Icon(Icons.exit_to_app, color: Colors.red[400]),
                      //   title: Text(
                      //     'Log Out',
                      //     style: TextStyle(
                      //       color: Colors.red[400],
                      //     ),
                      //   ),
                      //   onTap: () => {
                      //     Navigator.of(context).pushReplacementNamed('/'),
                      //   },
                      // ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        // child: ListView(
        //   physics: NeverScrollableScrollPhysics(),
        //   padding: EdgeInsets.zero,
        //   children: <Widget>[
        //     DrawerHeader(
        //       padding: EdgeInsets.all(0.0),
        //       child: Container(
        //         alignment: Alignment.center,
        //         child: Text(
        //           'SUPREMO#1533',
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 20.0,
        //               fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //       decoration: BoxDecoration(
        //         color: Color.fromRGBO(21, 21, 21, 1),
        //       ),
        //     ),
        //     Container(
        //       color: Color.fromRGBO(21, 21, 21, 1),
        //       height: MediaQuery.of(context).size.height,
        //       child: Column(
        //         children: <Widget>[
        //           ListTile(
        //             leading: Icon(
        //               Icons.scanner,
        //               color: Colors.white,
        //             ),
        //             title: Text(
        //               'Barcode Scanner',
        //               style: TextStyle(color: Colors.white),
        //             ),
        //             onTap: () => {Navigator.of(context).push(barcodeRoute())},
        //           ),
        //           ListTile(
        //             leading: Icon(
        //               CustomIcons.chat,
        //               size: 18.0,
        //               color: Colors.white,
        //             ),
        //             title: Text(
        //               'Chat Room',
        //               style: TextStyle(
        //                 color: Colors.white,
        //               ),
        //             ),
        //             onTap: () => {Navigator.of(context).push(chatRoute())},
        //           ),
        //           ListTile(
        //             leading: Icon(Icons.person, color: Colors.white),
        //             title: Text(
        //               'Support',
        //               style: TextStyle(color: Colors.white),
        //             ),
        //             onTap: () => {Navigator.of(context).push(supportRoute())},
        //           ),
        //           ListTile(
        //             leading: Icon(Icons.settings, color: Colors.white),
        //             title: Text(
        //               'Settings',
        //               style: TextStyle(color: Colors.white),
        //             ),
        //             onTap: () => {Navigator.of(context).push(profileRoute())},
        //           ),
        //           Expanded(
        //             child: SizedBox(),
        //           ),
        //           ListTile(
        //             leading: Icon(Icons.power, color: Colors.white),
        //             title: Text(
        //               'Log Out',
        //               style: TextStyle(
        //                 color: Colors.white,
        //               ),
        //             ),
        //             onTap: () => {
        //               Navigator.of(context).pushReplacementNamed('/'),
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
