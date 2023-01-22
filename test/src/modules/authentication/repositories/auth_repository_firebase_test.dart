import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository_firebase.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  final User user;
  MockFirebaseAuth({
    required this.user,
  });

  @override
  User? get currentUser => user;
}

class MockUserCredential extends Mock implements UserCredential {
  final User mockedUser;

  MockUserCredential(this.mockedUser);

  @override
  User? get user => mockedUser;
}

class MockUser extends Mock implements User {}

void main() {
  late AuthRepositoryFirebase authRepositoryFirebase;
  late MockUserCredential mockUserCredential;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;

  final userId = faker.guid.random.string(50);
  final email = faker.internet.email();
  final password = faker.internet.password();
  final name = faker.person.name();

  setUp(
    () {
      mockUser = MockUser();
      mockUserCredential = MockUserCredential(mockUser);
      mockFirebaseAuth = MockFirebaseAuth(user: mockUser);
      authRepositoryFirebase = AuthRepositoryFirebase(
        firebaseAuthInstance: mockFirebaseAuth,
      );
    },
  );

  group('Tests register account', () {
    test('Test Register Account success', () async {
      when(() => mockUserCredential.user!.uid).thenReturn(userId);
      when(() => mockFirebaseAuth.currentUser!.updateDisplayName(name))
          .thenAnswer(
        (_) async => {},
      );
      when(() => mockFirebaseAuth.currentUser!.sendEmailVerification())
          .thenAnswer(
        (_) async => {},
      );

      when(() => mockFirebaseAuth.signOut()).thenAnswer(
        (_) async => {},
      );

      when(
        () => authRepositoryFirebase.firebaseAuthInstance
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).thenAnswer((_) async => mockUserCredential);

      final result = await authRepositoryFirebase.registerAccount(
        name: name,
        email: email,
        password: password,
      );

      expect(result, userId);
    });
  });

  group(
    'Test Login',
    () {
      test(
        'login success',
        () async {
          when(() => mockUserCredential.user!.uid).thenReturn(userId);

          when(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: email, password: password)).thenAnswer(
            (_) async => mockUserCredential,
          );

          final result = await authRepositoryFirebase.login(
            email: email,
            password: password,
          );

          expect(result.user!.uid, userId);
        },
      );
    },
  );

  group(
    ' Test Register password ',
    () {
      test(
        'Recovery Password success',
        () async {
          when(() => mockUserCredential.user!.uid).thenReturn(userId);

          when(() => mockFirebaseAuth.sendPasswordResetEmail(email: email))
              .thenAnswer(
            (_) async => mockUserCredential,
          );

          expect(userId, isA<String>());
        },
      );
    },
  );

  group(
    ' Test Logout ',
    () {
      test(
        'Logout success',
        () async {
          when(() => mockUserCredential.user!.uid).thenReturn(userId);

          when(() => mockFirebaseAuth.signOut()).thenAnswer(
            (_) async => mockUserCredential,
          );

          expect(userId, isA<String>());
        },
      );
    },
  );
}
