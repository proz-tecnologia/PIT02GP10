import 'dart:convert';

class AppErrorModel {
  final String message;
  final int statusCode;
  AppErrorModel({
    required this.message,
    required this.statusCode,
  });

  AppErrorModel copyWith({
    String? message,
    int? statusCode,
  }) {
    return AppErrorModel(
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'statusCode': statusCode,
    };
  }

  factory AppErrorModel.fromMap(Map<String, dynamic> map) {
    return AppErrorModel(
      message: map['message'] ?? '',
      statusCode: map['statusCode']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppErrorModel.fromJson(String source) =>
      AppErrorModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppErrorModel(message: $message, statusCode: $statusCode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppErrorModel &&
        other.message == message &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode => message.hashCode ^ statusCode.hashCode;
}
