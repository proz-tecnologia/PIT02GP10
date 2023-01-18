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

  Future<void> updateUserName({
    required String userId,
    required String name,
  });

  Future<void> updateNickname({
    required String userId,
    required String nickname,
  });

  Future<void> updatePhone({
    required String userId,
    required String phone,
  });
}
