import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterati_codeshastra/models/user.dart' as u;

Future addUser(String name, String email, String id, String location, int age,
    String gender, int phone) async {
  final docUser = FirebaseFirestore.instance.collection("users").doc(id);
  final u.User user = u.User(
    name: name,
    email: email,
    id: id,
    location: location,
    age: age,
    gender: gender,
    phone: phone,
    rating: 0,
    activity_status: 0,
  );
  final json = user.toJson();

  await docUser.set(json);
}
