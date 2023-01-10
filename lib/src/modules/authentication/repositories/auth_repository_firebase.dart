import 'package:firebase_auth/firebase_auth.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository.dart';

class AuthRepositoryFirebase implements AuthRepository {
  final FirebaseAuth firebaseAuthInstance;
  AuthRepositoryFirebase({
    required this.firebaseAuthInstance,
  });

  @override
  Future<void> registerAccount({
    required String name,
    required String email,
    String? phone,
    required String password,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await firebaseAuthInstance.currentUser!.updateDisplayName(name);
    await firebaseAuthInstance.currentUser!.sendEmailVerification();
  }

  // @override
  // User? hasUser() => authentication.currentUser;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await firebaseAuthInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> recoveryPassword({
    required String email,
  }) async {
    return await firebaseAuthInstance.sendPasswordResetEmail(email: email);
  }

  @override
  saveLoggedUser(void response) {}

  @override
  changePassword({
    required String newPassword,
    required String token,
    required String email,
  }) {}

  @override
  generateRecoveryToken({required String email}) {}

  @override
  validateToken({required String code, required String email}) {}

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
