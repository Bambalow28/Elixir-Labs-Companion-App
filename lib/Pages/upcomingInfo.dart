import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Create Profile Widget
class UpcomingReleaseInfo extends StatefulWidget {
  String itemName;
  String itemPrice;
  String itemReleaseDate;
  String itemImage;
  UpcomingReleaseInfo(
      {Key key,
      this.itemName,
      this.itemPrice,
      this.itemReleaseDate,
      this.itemImage})
      : super(key: key);

  @override
  _UpcomingReleaseInfo createState() => _UpcomingReleaseInfo();
}

//Spoof Browser Widget State
class _UpcomingReleaseInfo extends State<UpcomingReleaseInfo> {
  bool likeButton = false;
  bool dislikeButton = false;
  int likeCount = 0;
  int dislikeCount = 0;

  //Create Firebase Instance
  final firestoreInstance = FirebaseFirestore.instance;

  getItemReleases() async {
    await firestoreInstance.collection("itemReleases").get().then((item) {
      likeCount = item.docs[0].data()["Liked"];
      dislikeCount = item.docs[0].data()["Dislikes"];
    });
  }

  //Function to Check Whether Price is Available
  void checkPrice() {
    if (widget.itemPrice.isEmpty) {
      widget.itemPrice = 'N/A';
    }
  }

  void hypeStatus() {
    if (likeButton == true) {
      firestoreInstance
          .collection("Item Releases")
          .doc(widget.itemName)
          .update({
        "Liked": FieldValue.increment(1),
      }).then((check) {
        print('Liked Registered Successfully');
        likeButton = false;
      });
    } else if (dislikeButton == true) {
      dislikeButton = false;
      firestoreInstance
          .collection("Item Releases")
          .doc(widget.itemName)
          .update({"Dislikes": FieldValue.increment(1)}).then((check) {
        print('Dislike Registered Successfully');
        dislikeButton = false;
      });
    }
  }

  @override
  void initState() {
    this.getItemReleases();
    this.checkPrice();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool itemImageCheck() {
      if (widget.itemImage ==
          'https://images.solecollector.com/complex/image/upload/v1557176412/SC_Logo_Globe_TM_Blue_20190506-01-01-01_urcggx.svg') {
        return false;
      } else {
        return true;
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      appBar: AppBar(
        title: Text('Upcoming Release Info'),
        backgroundColor: const Color.fromRGBO(38, 38, 38, 1.0),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: itemImageCheck() == false
                  ? Container(
                      alignment: Alignment.center,
                      height: 200.0,
                      child: Text(
                        'Image Not Available',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ))
                  : Image.network(
                      widget.itemImage,
                    ),
            ),
          ),
          FutureBuilder(
            future: getItemReleases(),
            builder: (BuildContext context, snapshot) {
              return Column(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, bottom: 10.0, right: 20.0),
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'NAME: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.itemName,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, bottom: 10.0, right: 20.0),
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'PRICE: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.itemPrice,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, bottom: 10.0, right: 20.0),
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'RELEASE DATE: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.itemReleaseDate,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0, bottom: 15.0),
                    alignment: Alignment.topLeft,
                    child: Text('Resell Predictions',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0)),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(36, 37, 38, 1),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 1)
                                      .withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          height: 127.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                  'N/A',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36.0),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  'Lowest Price',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(36, 37, 38, 1),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 1)
                                      .withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          height: 127.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                  'N/A',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36.0),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  'Highest Price',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Text(
                      'Hype Status',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => {
                          setState(() {
                            likeButton = true;
                            hypeStatus();
                          })
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10.0, right: 13.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(39, 165, 96, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          width: 140.0,
                          height: 52.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15.0),
                                child: Icon(
                                  Icons.thumb_up,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  likeCount != null
                                      ? likeCount.toString()
                                      : '0',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          setState(() {
                            dislikeButton = true;
                            hypeStatus();
                          })
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(231, 76, 60, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          width: 140.0,
                          height: 52.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15.0),
                                child: Icon(
                                  Icons.thumb_down,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  dislikeCount != null
                                      ? dislikeCount.toString()
                                      : '0',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
