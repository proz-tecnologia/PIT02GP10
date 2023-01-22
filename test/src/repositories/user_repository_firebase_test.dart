import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gastos_app/src/repositories/user_repository_firebase.dart';

import '../../fixtures/user_repository_fixtures.dart';

void main() {
  final instance = FakeFirebaseFirestore();

  final userRepository = UserRepositoryFirebase(
    collection: instance.collection('users'),
  );

  final userRepositoryFixtures = UserRepositoryFixtures();
  group(
    'User Repository Create User Test',
    () {
      test(
        'Create user test',
        () async {
          await userRepository.createUser(
            id: userRepositoryFixtures.testData.id,
            name: userRepositoryFixtures.testData.name,
            email: userRepositoryFixtures.testData.email,
          );

          final user = await userRepository.getUserDataById(
            userId: userRepositoryFixtures.testData.id,
          );

          expect(user.id, equals(userRepositoryFixtures.testData.id));
        },
      );
    },
  );
}
