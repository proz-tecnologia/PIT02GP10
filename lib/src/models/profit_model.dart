import 'dart:convert';

class ProfitModel {
  final String title;
  final double value;
  final DateTime createdAt;
  final String createdBy;
  ProfitModel({
    required this.title,
    required this.value,
    required this.createdAt,
    required this.createdBy,
  });

  ProfitModel copyWith({
    String? title,
    double? value,
    DateTime? createdAt,
    String? createdBy,
  }) {
    return ProfitModel(
      title: title ?? this.title,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'value': value,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory ProfitModel.fromMap(Map<String, dynamic> map) {
    return ProfitModel(
      title: map['title'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfitModel.fromJson(String source) =>
      ProfitModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfitModel(title: $title, value: $value, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfitModel &&
        other.title == title &&
        other.value == value &&
        other.createdAt == createdAt &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        value.hashCode ^
        createdAt.hashCode ^
        createdBy.hashCode;
  }
}
