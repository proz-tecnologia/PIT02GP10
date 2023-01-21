import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gastos_app/src/models/user_model.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository_firebase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepositoryFirebase extends Mock
    implements AuthRepositoryFirebase {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  late MockAuthRepositoryFirebase mockAuthRepositoryFirebase;
  late UserModel user;
  setUp(
    () {
      mockAuthRepositoryFirebase = MockAuthRepositoryFirebase();
      user = UserModel(
        name: 'User',
        email: 'user@email.com',
        id: '1a2b3c4d5e',
      );
    },
  );

  group('Tests register account', () {
    test('Test Register Account success', () async {
      when(
        () => mockAuthRepositoryFirebase.registerAccount(
          name: 'User',
          email: 'user@email.com',
          password: 'user123',
        ),
      ).thenAnswer(
        (_) async => '123',
      );

      final result = await mockAuthRepositoryFirebase.registerAccount(
        name: 'User',
        email: 'user@email.com',
        password: 'user123',
      );

      expect(result, '123');
    });

    // test('Test Register Account failure', () async {
    //   when(
    //     () => mockAuthRepositoryFirebase.registerAccount(
    //       name: 'User',
    //       email: 'user@email.com',
    //       password: 'user@123',
    //     ),
    //   ).thenThrow(
    //     Exception(),
    //   );

    //   expect(
    //     () => mockAuthRepositoryFirebase.registerAccount(
    //       name: 'User',
    //       email: 'user@email.com',
    //       password: 'user@123',
    //     ),
    //     throwsException,
    //   );
    // });
  });
}
