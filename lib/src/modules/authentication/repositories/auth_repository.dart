abstract class AuthRepository {
  Future<void> registerAccount({
    required String name,
    required String email,
    String? phone,
    required String password,
  });

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> recoveryPassword({required String email});

  Future<void> logout();
}
