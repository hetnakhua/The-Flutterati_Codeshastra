import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/services/forumdb.dart';
import 'package:flutterati_codeshastra/util/re_use.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController _post = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(child: inputText('Post', 'Enter post', _post, false)),
          TextButton(onPressed: ()
              async {
                await addPost(_post.text);
              }, child: Text('Add'))
        ],
      );
  }
}
