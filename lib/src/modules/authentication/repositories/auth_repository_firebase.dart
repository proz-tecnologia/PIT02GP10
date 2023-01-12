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
    final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await firebaseAuthInstance.currentUser!.updateDisplayName(name);
    await firebaseAuthInstance.currentUser!.sendEmailVerification();

    await firebaseAuthInstance.signOut();
  }

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    final user = await firebaseAuthInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }

  @override
  Future<void> recoveryPassword({
    required String email,
  }) async {
    return await firebaseAuthInstance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> logout() async {
    await firebaseAuthInstance.signOut();
  }

  @override
  User? get currentUser => firebaseAuthInstance.currentUser;
}
