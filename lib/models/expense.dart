// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Expense {
  final DateTime time;
  final int amount;
  final String category;
  final double lat;
  final double lng;
  Expense({
    required this.time,
    required this.amount,
    required this.category,
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.millisecondsSinceEpoch,
      'amount': amount,
      'category': category,
      'lat': lat,
      'lng': lng,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      amount: map['amount'] as int,
      category: map['category'] as String,
      lat: map['lat'] as double,
      lng: map['lng'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source) as Map<String, dynamic>);
}
