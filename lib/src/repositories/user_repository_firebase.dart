import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gastos_app/src/models/app_error_model.dart';
import 'package:gastos_app/src/models/user_model.dart';
import 'package:gastos_app/src/repositories/user_repository.dart';

class UserRepositoryFirebase implements UserRepository {
  CollectionReference get _firestore => FirebaseFirestore.instance.collection(
        'users',
      );

  @override
  Future<void> createUser({
    required String id,
    required String name,
    required String email,
    String? phone,
    String? avatarUrl,
  }) async {
    final user = UserModel(
      email: email,
      id: id,
      name: name,
      avatarUrl: avatarUrl,
      phone: phone,
    );

    try {
      await _firestore.add(user.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUserDataById({required String userId}) async {
    try {
      final response = await _firestore.where('id', isEqualTo: userId).get();

      if (response.docs.isNotEmpty) {
        final docs = response.docs;

        final userData = docs.first;

        final user = UserModel.fromMap(userData.data() as Map<String, dynamic>);

        return user;
      }

      throw AppErrorModel(message: 'Usuário não encontrado', statusCode: 404);
    } catch (e) {
      rethrow;
    }
  }
}
