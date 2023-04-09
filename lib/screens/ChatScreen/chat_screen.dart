import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

import 'messages.dart';


class ChatBotScreen extends StatefulWidget {
  ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatBotScreen> {
  // create instance of dialog flowtter 
  late DialogFlowtter dialogFlowtter;
  // define text editing controller
  TextEditingController _controller = TextEditingController();

  // list of messages 
  List<Map<String, dynamic>> messages = [
    // {'message': "Hi there, how can help you?"},
  ];


  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
     setState(() {
        addMessage(Message(text: DialogText(text: const ["hi there, how can i help you?"])));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Bot"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages,)),
            Container(
              color: Colors.grey.withOpacity(0.6),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.black),
                    ),

                  ),
                  IconButton(onPressed: (){
                    sendMessage(_controller.text);
                    _controller.clear();
                  }, icon: Icon(Icons.send), color: Colors.blue,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}