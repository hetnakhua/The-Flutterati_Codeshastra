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
  late List<Income> incomesList;
  late List<Expense> expensesList;
  @override
  void onInit() {
    // TODO: implement onInit
    getCurrentUserData();
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
