abstract class UserRepository {
  Future<void> createUser({
    required String id,
    required String name,
    required String email,
    String? phone,
    String? avatarUrl,
  });

  Future<void> getUserDataById({required String userId});
}
