import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'package:flutterati_codeshastra/util/re_use.dart';

class ForumDetailPage extends StatefulWidget {
  @override
  _ForumDetailPageState createState() => new _ForumDetailPageState();
}

var ForumPostArr = [
  ForumPostEntry("Rohan", "5 hours ago", 5 , 0 , "Hello,\n\nAs an experienced financial advisor I believe NFTs are a risky investment."),
  ForumPostEntry("Maya", "23 Hours ago", 1 , 0 , "You can try investing in NFTs but don't spend too much money on it."),
  ForumPostEntry("Varun", "1 day ago", 1 , 0 , "There are multiple investment options, keep a varied portfolio."),
  ForumPostEntry("Ram", "2 days ago", 1 , 0 , "Invest in NFTs but don't take too much risk."),
];

class _ForumDetailPageState extends State<ForumDetailPage> {
  @override
  Widget build(BuildContext context) {
    var questionSection = Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new Text(
            "Should I invest in NFTs?",
            textScaleFactor: 1.5,
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconWithText(Icons.laptop_mac, "Investing", iconColor: Colors.green,),
                new IconWithText(
                  Icons.check_circle,
                  "Answered",
                  iconColor: Colors.green,
                ),
                new IconWithText(Icons.remove_red_eye, "54", iconColor: Colors.green,)
              ],
            ),
          ),
          new Divider()
        ],
      ),
    );

    var responses = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) => new ForumPost(ForumPostArr[index]),
          itemCount: ForumPostArr.length,
        )
    );

    TextEditingController _comment = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: 5),
        child: TextField(
          controller: _comment,
          obscureText: false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: black),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: white),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'Comment',
            fillColor: Colors.grey[150],
            filled: true,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          questionSection,
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: responses,
              ))
        ],
      ),
    );
  }
}

class ForumPostEntry{
  final String username;
  final String hours;
  final int likes;
  final int dislikes;
  final String text;

  ForumPostEntry(this.username, this.hours, this.likes, this.dislikes, this.text);
}

class ForumPost extends StatelessWidget {
  final ForumPostEntry entry;

  ForumPost(this.entry);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 5.0, right: 5, left: 5, bottom: 15),
      decoration: new BoxDecoration(
        color: outerSpaceGrey,
        borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: outerSpaceGrey,
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0)),
            ),
            child: new Row(
              children: <Widget>[
                new Icon(
                  Icons.person,
                  size: 50.0,
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                          entry.username
                      ),
                      new Text(
                          entry.hours
                      ),
                    ],
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_up),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Text(entry.likes.toString()),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_down),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                      child: new Text(entry.dislikes.toString()),
                    ),
                  ],
                )
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 2.0,right: 2.0,bottom: 2.0),
            padding: const EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
                color: Colors.black54,
                borderRadius: const BorderRadius.only(bottomLeft :const Radius.circular(20.0),bottomRight :const Radius.circular(20.0))
            ),
            child: new Text(entry.text),
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color iconColor;

  IconWithText(this.iconData, this.text, {required this.iconColor});
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Icon(
            this.iconData,
            color: this.iconColor,
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(this.text),
          ),
        ],
      ),
    );
  }
}
