import 'package:gastos_app/src/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> create({
    required String email,
    required String password,
    String? phone,
    String? avatarUrl,
    required String name,
  });
  Future<List<UserModel>?> listAll();
  Future<UserModel?> findByEmail({required String email});
  Future<UserModel> updatePassword({
    required String email,
    required String newPassword,
  });

  List<String> listToJson({required List<UserModel> users}) {
    return users.map((e) => e.toJson()).toList();
  }
}
