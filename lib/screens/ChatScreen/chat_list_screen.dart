import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/screens/ChatScreen/chat_screen.dart';


class Chat {
  final String id;
  final String name;
  final String lastMessage;

  Chat({required this.id, required this.name, required this.lastMessage});
}

class Message {
  final String text;
  final String sender;
  final DateTime timestamp;

  Message({required this.text, required this.sender, required this.timestamp});
}



class ChatScreen extends StatefulWidget {
  final Chat chat;

  ChatScreen({required this.chat});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Message> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = _messages[index];

                return ListTile(
                  title: Text(message.text),
                  subtitle: Text(message.sender),
                  trailing: Text(message.timestamp.toString()),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(hintText: 'Enter message...'),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      final Message message = Message(
        text: text,
        sender: 'Me', // or you could prompt the user to enter their name
        timestamp: DateTime.now(),
      );
      _messages.insert(0, message);
    });
  }
}



class ChatListScreen extends StatelessWidget {
  final List<Chat> chats;

  ChatListScreen({required this.chats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Chat chat = chats[index];

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chat: chat),
                ),
              );
            },
            leading: CircleAvatar(
              child: Text(chat.name[0]), // display first letter of name
            ),
            title: Text(chat.name),
            subtitle: Text(chat.lastMessage),
            trailing: Text('1:30 PM'), // display last message timestamp
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatBotScreen()));
        },
        child: Icon(Icons.message_outlined),
      ),
    );
  }
}
