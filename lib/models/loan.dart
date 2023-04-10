// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Loan {
  final int daysLeft;
  final int totalAmount;
  final String categoryName;
  final int emiPerMonth;
  Loan({
    required this.daysLeft,
    required this.totalAmount,
    required this.categoryName,
    required this.emiPerMonth,
  });

  Loan copyWith({
    int? daysLeft,
    int? totalAmount,
    String? categoryName,
    int? emiPerMonth,
  }) {
    return Loan(
      daysLeft: daysLeft ?? this.daysLeft,
      totalAmount: totalAmount ?? this.totalAmount,
      categoryName: categoryName ?? this.categoryName,
      emiPerMonth: emiPerMonth ?? this.emiPerMonth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'daysLeft': daysLeft,
      'totalAmount': totalAmount,
      'categoryName': categoryName,
      'emiPerMonth': emiPerMonth,
    };
  }

  factory Loan.fromMap(Map<String, dynamic> map) {
    return Loan(
      daysLeft: map['daysLeft'] as int,
      totalAmount: map['totalAmount'] as int,
      categoryName: map['categoryName'] as String,
      emiPerMonth: map['emiPerMonth'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loan.fromJson(String source) =>
      Loan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Loan(daysLeft: $daysLeft, totalAmount: $totalAmount, categoryName: $categoryName, emiPerMonth: $emiPerMonth)';
  }

  @override
  bool operator ==(covariant Loan other) {
    if (identical(this, other)) return true;

    return other.daysLeft == daysLeft &&
        other.totalAmount == totalAmount &&
        other.categoryName == categoryName &&
        other.emiPerMonth == emiPerMonth;
  }

  @override
  int get hashCode {
    return daysLeft.hashCode ^
        totalAmount.hashCode ^
        categoryName.hashCode ^
        emiPerMonth.hashCode;
  }
}
