import 'package:finances/models/object_id.dart';

class UserModel extends ObjectId {
  final String name;
  final String surname;
  final String email;
  final String password;
  final String? avatarUrl;
  final String walletId;

  UserModel({
    required super.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    this.avatarUrl,
    required this.walletId,
    required super.createdAt,
  });
}
