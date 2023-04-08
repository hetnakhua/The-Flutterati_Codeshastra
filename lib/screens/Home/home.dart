import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/screens/ChatScreen/chat_list_screen.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final chats = <Chat>[
    Chat(id: "Abhishek", name: "Abhishek Sinha", lastMessage: "hello"),
    Chat(id: "sjdlf", name: "Vatsal Shah", lastMessage: "bye"),e
    Chat(id: "het", name: "HEt Sinha", lastMessage: "??"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatListScreen(chats: chats,)
    );
  }
}
