import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gastos_app/src/modules/authentication/repositories/auth_repository_firebase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/auth_repository_fixtures.dart';

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

  final authRepositoryFixtures = AuthRepositoryFixtures();

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
      when(() => mockUserCredential.user!.uid)
          .thenReturn(authRepositoryFixtures.testData.id);
      when(() => mockFirebaseAuth.currentUser!
          .updateDisplayName(authRepositoryFixtures.testData.name)).thenAnswer(
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
          email: authRepositoryFixtures.testData.email,
          password: authRepositoryFixtures.testData.password,
        ),
      ).thenAnswer((_) async => mockUserCredential);

      final result = await authRepositoryFirebase.registerAccount(
        name: authRepositoryFixtures.testData.name,
        email: authRepositoryFixtures.testData.email,
        password: authRepositoryFixtures.testData.password,
      );

      expect(result, authRepositoryFixtures.testData.id);
    });
  });

  group(
    'Test Login',
    () {
      test(
        'login success',
        () async {
          when(() => mockUserCredential.user!.uid)
              .thenReturn(authRepositoryFixtures.testData.id);

          when(
            () => mockFirebaseAuth.signInWithEmailAndPassword(
              email: authRepositoryFixtures.testData.email,
              password: authRepositoryFixtures.testData.password,
            ),
          ).thenAnswer(
            (_) async => mockUserCredential,
          );

          final result = await authRepositoryFirebase.login(
            email: authRepositoryFixtures.testData.email,
            password: authRepositoryFixtures.testData.password,
          );

          expect(result.user!.uid, authRepositoryFixtures.testData.id);
        },
      );
    },
  );

  group(
    ' Test Recovery password',
    () {
      test(
        'Recovery Password success',
        () async {
          when(() => mockFirebaseAuth.sendPasswordResetEmail(
              email: authRepositoryFixtures.testData.email)).thenAnswer(
            (_) async {},
          );

          await authRepositoryFirebase.recoveryPassword(
              email: authRepositoryFixtures.testData.email);

          expectSync(
            () => authRepositoryFirebase.recoveryPassword(
                email: authRepositoryFixtures.testData.email),
            returnsNormally,
          );

          verify(() => mockFirebaseAuth.sendPasswordResetEmail(
              email: authRepositoryFixtures.testData.email)).called(2);
        },
      );
    },
  );

  group(
    ' Test Logout',
    () {
      test(
        'Logout success',
        () async {
          when(() => mockFirebaseAuth.signOut()).thenAnswer(
            (_) async {},
          );

          await authRepositoryFirebase.logout();

          expectSync(
            () => authRepositoryFirebase.logout(),
            returnsNormally,
          );

          verify(() => mockFirebaseAuth.signOut()).called(2);
        },
      );
    },
  );

  group(
    ' Test Logout',
    () {
      test(
        'Logout success',
        () async {
          when(() => mockFirebaseAuth.signOut()).thenAnswer(
            (_) async {},
          );

          await authRepositoryFirebase.logout();

          expectSync(
            () => authRepositoryFirebase.logout(),
            returnsNormally,
          );

          verify(() => mockFirebaseAuth.signOut()).called(2);
        },
      );
    },
  );

  group(
    ' Test currentUser getter',
    () {
      test(
        'getting current user',
        () async {
          final currentUser = authRepositoryFirebase.currentUser;

          expect(currentUser, equals(mockUser));
        },
      );
    },
  );

  group(
    ' Test update name',
    () {
      test(
        'update name test',
        () async {
          when(() => mockFirebaseAuth.currentUser!
                  .updateDisplayName(authRepositoryFixtures.testData.name))
              .thenAnswer(
            (_) async {},
          );

          await authRepositoryFirebase.updateName(
              name: authRepositoryFixtures.testData.name);

          expectSync(
            () => authRepositoryFirebase.updateName(
                name: authRepositoryFixtures.testData.name),
            returnsNormally,
          );

          verify(() => mockFirebaseAuth.currentUser!
                  .updateDisplayName(authRepositoryFixtures.testData.name))
              .called(2);
        },
      );
    },
  );

  group(
    ' Test update password',
    () {
      test(
        'update password test',
        () async {
          when(
            () => mockFirebaseAuth.currentUser!.updatePassword(
              authRepositoryFixtures.testData.password,
            ),
          ).thenAnswer(
            (_) async {},
          );

          await authRepositoryFirebase.updatePassword(
            password: authRepositoryFixtures.testData.password,
          );

          expectSync(
            () => authRepositoryFirebase.updatePassword(
              password: authRepositoryFixtures.testData.password,
            ),
            returnsNormally,
          );

          verify(
            () => mockFirebaseAuth.currentUser!.updatePassword(
              authRepositoryFixtures.testData.password,
            ),
          ).called(2);
        },
      );
    },
  );

  group(
    ' Test update photo url',
    () {
      test(
        'update photo url test',
        () async {
          when(() => mockFirebaseAuth.currentUser!
                  .updatePhotoURL(authRepositoryFixtures.testData.avatarUrl))
              .thenAnswer(
            (_) async {},
          );

          await authRepositoryFirebase.updatePhotoUrl(
              photoUrl: authRepositoryFixtures.testData.avatarUrl);

          expectSync(
            () => authRepositoryFirebase.updatePhotoUrl(
                photoUrl: authRepositoryFixtures.testData.avatarUrl),
            returnsNormally,
          );

          verify(() => mockFirebaseAuth.currentUser!
                  .updatePhotoURL(authRepositoryFixtures.testData.avatarUrl))
              .called(2);
        },
      );
    },
  );
}
