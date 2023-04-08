import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterati_codeshastra/models/forumpost.dart' as f;

Future addPost(String text) async{
  try{
    final id = (FirebaseAuth.instance.currentUser?.uid).toString();
    final f.ForumPostEntry post = f.ForumPostEntry(
      username: id,
      dislikes: 0,
      likes: 0,
      text: text,
      time: DateTime.now().toString(),
    );

    final json = post.toJson();
    await FirebaseFirestore.instance.collection('posts').doc().set(json);
  }
  catch(e){
    print("$e");
  }
}

// Future<List<f.ForumPostEntry>> getPosts() async{
//   await FirebaseFirestore.instance.collection('posts').get().then(
//       querySnapshot => {
//       querySnapshot.docs.forEach(doc => {
//       markers.push(doc.data());
//       }
//   );
// }