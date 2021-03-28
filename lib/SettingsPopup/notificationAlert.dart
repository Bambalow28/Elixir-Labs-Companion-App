import 'package:flutter/material.dart';

//Create Profile Widget
class NotificationAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      color: Colors.transparent,
      type: MaterialType.canvas,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              width: MediaQuery.of(context).size.width,
              height: 65.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color(0xff36B37E)),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Task Deleted',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Icon(
                        Icons.done_rounded,
                        color: Colors.white,
                        size: 30.0,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
