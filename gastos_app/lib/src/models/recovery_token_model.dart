import 'dart:convert';

class RecoveryTokenModel {
  final int code;
  final String userEmail;
  final DateTime createdAt;
  RecoveryTokenModel({
    required this.code,
    required this.userEmail,
    required this.createdAt,
  });

  RecoveryTokenModel copyWith({
    int? code,
    String? userEmail,
    DateTime? createdAt,
  }) {
    return RecoveryTokenModel(
      code: code ?? this.code,
      userEmail: userEmail ?? this.userEmail,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'userEmail': userEmail,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory RecoveryTokenModel.fromMap(Map<String, dynamic> map) {
    return RecoveryTokenModel(
      code: map['code']?.toInt() ?? 0,
      userEmail: map['userEmail'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecoveryTokenModel.fromJson(String source) =>
      RecoveryTokenModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'RecoveryTokenModel(code: $code, userEmail: $userEmail, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecoveryTokenModel &&
        other.code == code &&
        other.userEmail == userEmail &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => code.hashCode ^ userEmail.hashCode ^ createdAt.hashCode;
}
