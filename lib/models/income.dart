// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Income {
  final String Source;
  final int amount;
  final DateTime Date;
  Income({
    required this.Source,
    required this.amount,
    required this.Date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Source': Source,
      'amount': amount,
      'Date': Date.millisecondsSinceEpoch,
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      Source: map['Source'] as String,
      amount: map['amount'] as int,
      Date: DateTime.fromMillisecondsSinceEpoch(map['Date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Income.fromJson(String source) =>
      Income.fromMap(json.decode(source) as Map<String, dynamic>);
}
