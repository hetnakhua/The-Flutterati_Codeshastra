import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterati_codeshastra/models/user.dart' as u;

Future addUser(String name, String email, String id, String collegeName,
    String dateOfBirth) async {
  final docUser = FirebaseFirestore.instance.collection("users").doc(id);
  final u.User user = u.User(
    name: name,
    email: email,
    id: id,
    collegeName: collegeName,
    dateOfBirth: dateOfBirth,
    userScore: 0.5,
  );
  final json = user.toJson();

  await docUser.set(json);
}
