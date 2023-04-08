import 'package:flutter/cupertino.dart';
import 'package:telephony/telephony.dart';
import 'package:flutter/material.dart';
import 'package:readsms/readsms.dart';

backgrounMessageHandler(SmsMessage message) async {
  for (int i = 0; i < 10; i++) {
    print(message.body);
  }
  //Vibration.vibrate(duration: 500);
}

class SmsScreen extends StatefulWidget {
  @override
  _SmsScreenState createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  String sms = "Start";
  Telephony telephony = Telephony.instance;
  Readsms plugin = Readsms();

  @override
  void initState() {
    // TODO: implement initState
    plugin.read();
    plugin.smsStream.listen((event) {
      print("I am here");
      setState(() {
        sms = event.body;
        print("SMS body" + event.body);
        // sender = event.sender;
        // time = event.timeReceived.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    telephony.listenIncomingSms(
      onBackgroundMessage: backgrounMessageHandler,
      onNewMessage: (SmsMessage message) {
        print("I am here");
        print(message.address); //+977981******67, sender nubmer
        print(message.body); //sms text
        print(message.date); //1659690242000, timestamp
        setState(() {
          sms = message.body.toString();
        });
      },
      listenInBackground: true,
    );
    return Scaffold(
        appBar: AppBar(
            title: Text("Listen Incoming SMS in Flutter"),
            backgroundColor: Colors.red),
        body: Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recieved SMS Text:",
                  style: TextStyle(fontSize: 30),
                ),
                Divider(),
                Text(
                  "SMS Text:",
                  style: TextStyle(fontSize: 20),
                ),
                Text(sms)
              ],
            )));
  }
}
