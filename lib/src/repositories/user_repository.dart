import 'package:gastos_app/src/models/user_model.dart';

abstract class UserRepository {
  Future<void> createUser({
    required String id,
    required String name,
    required String email,
    String? phone,
    String? avatarUrl,
  });

  Future<UserModel> getUserDataById({required String userId});
}
