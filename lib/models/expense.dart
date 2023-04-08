// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Expense {
  final String name;
  final String description;
  final DateTime time;
  final int accountId;
  final int categoryId;
  Expense({
    required this.name,
    required this.description,
    required this.time,
    required this.accountId,
    required this.categoryId,
  });

  Expense copyWith({
    String? name,
    String? description,
    DateTime? time,
    int? accountId,
    int? categoryId,
  }) {
    return Expense(
      name: name ?? this.name,
      description: description ?? this.description,
      time: time ?? this.time,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'time': time.millisecondsSinceEpoch,
      'accountId': accountId,
      'categoryId': categoryId,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      name: map['name'] as String,
      description: map['description'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      accountId: map['accountId'] as int,
      categoryId: map['categoryId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Expense(name: $name, description: $description, time: $time, accountId: $accountId, categoryId: $categoryId)';
  }

  @override
  bool operator ==(covariant Expense other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.time == time &&
        other.accountId == accountId &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        time.hashCode ^
        accountId.hashCode ^
        categoryId.hashCode;
  }
}
