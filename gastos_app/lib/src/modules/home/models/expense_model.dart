import 'dart:convert';

class ExpenseModel {
  final String title;
  final double value;
  final DateTime createdAt;
  ExpenseModel({
    required this.title,
    required this.value,
    required this.createdAt,
  });

  ExpenseModel copyWith({
    String? title,
    double? value,
    DateTime? createdAt,
  }) {
    return ExpenseModel(
      title: title ?? this.title,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'value': value,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      title: map['title'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ExpenseModel(title: $title, value: $value, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExpenseModel &&
        other.title == title &&
        other.value == value &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => title.hashCode ^ value.hashCode ^ createdAt.hashCode;
}

final mockedExpenses = [
  ExpenseModel(
    title: "Padaria",
    value: 30.0,
    createdAt: DateTime(2022, 10, 12),
  ),
  ExpenseModel(
    title: "Farmácia",
    value: 68.90,
    createdAt: DateTime(2022, 10, 21),
  ),
  ExpenseModel(
    title: "Jantar",
    value: 150.0,
    createdAt: DateTime(2022, 10, 22),
  ),
];
