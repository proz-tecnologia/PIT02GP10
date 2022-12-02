import 'dart:convert';

class ExpenseModel {
  final String id;
  final String title;
  final double value;
  final DateTime createdAt;
  final String createdBy;
  ExpenseModel({
    required this.id,
    required this.title,
    required this.value,
    required this.createdAt,
    required this.createdBy,
  });

  ExpenseModel copyWith({
    String? id,
    String? title,
    double? value,
    DateTime? createdAt,
    String? createdBy,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExpenseModel(id: $id, title: $title, value: $value, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExpenseModel &&
        other.id == id &&
        other.title == title &&
        other.value == value &&
        other.createdAt == createdAt &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        value.hashCode ^
        createdAt.hashCode ^
        createdBy.hashCode;
  }
}
