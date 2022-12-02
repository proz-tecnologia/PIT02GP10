import 'dart:convert';

class ProfitModel {
  final String title;
  final double value;
  final DateTime createdAt;
  ProfitModel({
    required this.title,
    required this.value,
    required this.createdAt,
  });

  ProfitModel copyWith({
    String? title,
    double? value,
    DateTime? createdAt,
  }) {
    return ProfitModel(
      title: title ?? this.title,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'value': value,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ProfitModel.fromMap(Map<String, dynamic> map) {
    return ProfitModel(
      title: map['title'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfitModel.fromJson(String source) =>
      ProfitModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProfitModel(title: $title, value: $value, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfitModel &&
        other.title == title &&
        other.value == value &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => title.hashCode ^ value.hashCode ^ createdAt.hashCode;
}
