import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterati_codeshastra/models/expense.dart';
import 'package:flutterati_codeshastra/models/income.dart';
import 'package:flutterati_codeshastra/models/user.dart' as User;

import 'package:get/get.dart';

class HomeController extends GetxController {
  final user = FirebaseAuth.instance.currentUser!;
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final userCollection = FirebaseFirestore.instance.collection('users');
  late User.User currentUser;

  @override
  void onInit() {
    // TODO: implement onInit
    getCurrentUserData();
    getLeaderboard();
    super.onInit();
  }

  Future getCurrentUserData() async {
    try {
      DocumentSnapshot ds = await userCollection.doc(uid).get();
      currentUser = User.User.fromFirestore(ds);
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Income>> getUserIncomeDetails() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("Income")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Income.fromMap(doc.data())).toList());
  }

  Stream<List<Expense>> getUserExpenseDetails() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("Expenses")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Expense.fromMap(doc.data())).toList());
  }

  getLeaderboard() async {
    log("I am here");
    final usersListStream = FirebaseFirestore.instance
        .collection("users")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => User.User.fromFirestore(doc)).toList());
    log("I should be here");
    List<User.User> usersList = await usersListStream.expand((user) {
      log("I should be here too");
      return user;
    }).toList();
    log("I should be here too 2");
    List<int> totalIncome = List.filled(usersList.length, 0);
    List<int> totalExpense = List.filled(usersList.length, 0);
    List<double> score = List.filled(usersList.length, 0);
    for (int i = 0; i < usersList.length; i++) {
      final uid = usersList[i].id;
      final incomeListStream = getUserIncomeDetails();
      final incomeList =
          await incomeListStream.expand((element) => element).toList();
      for (int j = 0; j < incomeList.length; j++) {
        totalIncome[i] += incomeList[i].amount;
      }
      print("Total income of user $i is ${totalIncome[i]}");
      final expenseListStream = getUserExpenseDetails();
      final expenseList =
          await expenseListStream.expand((element) => element).toList();
      for (int k = 0; k < expenseList.length; k++) {
        totalExpense[k] += expenseList[k].amount;
      }
      print("Total expense of user $i is ${totalExpense[i]}");
      score[i] = 1 - (totalIncome[i] / totalExpense[i]);
      usersList[i].userScore = score[i];
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update(usersList[i].toJson());
    }
    return FirebaseFirestore.instance.collection("users").snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => User.User.fromFirestore(doc)).toList());
  }

  addExpense({required Expense expense, String? docid}) async {
    if (docid == null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection("Expenses")
          .doc()
          .set(expense.toMap());
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(docid)
          .update(expense.toMap());
    }
  }

  addIncome({required Income income, String? docid}) async {
    if (docid == null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection("Income")
          .doc()
          .set(income.toMap());
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(docid)
          .update(income.toMap());
    }
  }
}
