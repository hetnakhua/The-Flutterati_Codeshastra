// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Account {
  final String name;
  final String bankName;
  final double amount;
  final String number;
  final int initialAmount;
  Account({
    required this.name,
    required this.bankName,
    required this.amount,
    required this.number,
    required this.initialAmount,
  });

  Account copyWith({
    String? name,
    String? bankName,
    double? amount,
    String? number,
    int? initialAmount,
  }) {
    return Account(
      name: name ?? this.name,
      bankName: bankName ?? this.bankName,
      amount: amount ?? this.amount,
      number: number ?? this.number,
      initialAmount: initialAmount ?? this.initialAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'bankName': bankName,
      'amount': amount,
      'number': number,
      'initialAmount': initialAmount,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      name: map['name'] as String,
      bankName: map['bankName'] as String,
      amount: map['amount'] as double,
      number: map['number'] as String,
      initialAmount: map['initialAmount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(name: $name, bankName: $bankName, amount: $amount, number: $number, initialAmount: $initialAmount)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.bankName == bankName &&
        other.amount == amount &&
        other.number == number &&
        other.initialAmount == initialAmount;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        bankName.hashCode ^
        amount.hashCode ^
        number.hashCode ^
        initialAmount.hashCode;
  }
}
