import 'package:flutter/material.dart';
import 'package:elixirlabs_mobileapp/SettingsPopup/settings.dart';

//Create Profile Widget
class UpcomingReleaseInfo extends StatefulWidget {
  @override
  _UpcomingReleaseInfo createState() => _UpcomingReleaseInfo();
}

//Spoof Browser Widget State
class _UpcomingReleaseInfo extends State<UpcomingReleaseInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text('Upcoming Release Info'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      ),
      body: Text('Item Info'),
    );
  }
}
