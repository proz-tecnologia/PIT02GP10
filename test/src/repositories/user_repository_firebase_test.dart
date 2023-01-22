import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gastos_app/src/firebase/firebase_collections.dart';
import 'package:gastos_app/src/models/app_error_model.dart';
import 'package:gastos_app/src/repositories/user_repository_firebase.dart';

import '../../fixtures/user_repository_fixtures.dart';

void main() {
  final instance = FakeFirebaseFirestore();

  final userRepository = UserRepositoryFirebase(
    collection: instance.collection(FirebaseCollection.users),
  );

  final userRepositoryFixtures = UserRepositoryFixtures();

  tearDown(() {
    instance
        .collection(FirebaseCollection.users)
        .snapshots()
        .forEach((querySnapshot) {
      for (final docSnapshot in querySnapshot.docs) {
        docSnapshot.reference.delete();
      }
    });
  });
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
          expect(user.name, equals(userRepositoryFixtures.testData.name));
          expect(user.email, equals(userRepositoryFixtures.testData.email));
        },
      );
    },
  );

  group(
    'User Repository Get User By Id Test',
    () {
      test(
        'Get user by id when user is not created',
        () async {
          try {
            await userRepository.getUserDataById(
              userId: userRepositoryFixtures.testData.id,
            );
          } catch (e) {
            expect(e, isA<AppErrorModel>());
          }

          await expectLater(
            () => userRepository.getUserDataById(
              userId: userRepositoryFixtures.testData.id,
            ),
            throwsA(isA<AppErrorModel>()),
          );
        },
      );
    },
  );

  group(
    'User Repository update nickname test',
    () {
      test(
        'Update nickname test',
        () async {
          await userRepository.createUser(
            id: userRepositoryFixtures.testData.id,
            name: userRepositoryFixtures.testData.name,
            email: userRepositoryFixtures.testData.email,
          );

          final user = await userRepository.getUserDataById(
            userId: userRepositoryFixtures.testData.id,
          );

          expect(user.name, equals(userRepositoryFixtures.testData.name));
          expect(user.nickname, isNull);

          // await userRepository.updateNickname(
          //   userId: userRepositoryFixtures.testData.id,
          //   nickname: userRepositoryFixtures.testData.nickname,
          // );

          // final updatedUser = await userRepository.getUserDataById(
          //   userId: userRepositoryFixtures.testData.id,
          // );

          // expect(
          //   updatedUser.nickname,
          //   equals(userRepositoryFixtures.testData.nickname),
          // );
        },
      );

      test(
        'Update nickname test when user doesnt exist',
        () async {
          await expectLater(
            () => userRepository.updateNickname(
              userId: userRepositoryFixtures.testData.id,
              nickname: userRepositoryFixtures.testData.nickname,
            ),
            throwsA(isA<AppErrorModel>()),
          );
        },
      );
    },
  );

  // group(
  //   'User Repository update name test',
  //   () {
  //     test(
  //       'Update name test',
  //       () async {
  //         await userRepository.createUser(
  //           id: userRepositoryFixtures.testData.id,
  //           name: userRepositoryFixtures.testData.name,
  //           email: userRepositoryFixtures.testData.email,
  //         );

  //         final user = await userRepository.getUserDataById(
  //           userId: userRepositoryFixtures.testData.id,
  //         );

  //         expect(
  //           user.name,
  //           equals(userRepositoryFixtures.testData.name),
  //         );

  //         await userRepository.updateUserName(
  //           userId: userRepositoryFixtures.testData.id,
  //           name: userRepositoryFixtures.testData.newName,
  //         );

  //         final updatedUser = await userRepository.getUserDataById(
  //           userId: userRepositoryFixtures.testData.id,
  //         );

  //         expect(
  //           updatedUser.name,
  //           equals(userRepositoryFixtures.testData.newName),
  //         );
  //       },
  //     );

  //     test(
  //       'Update name test when user doesnt exist',
  //       () async {
  //         await expectLater(
  //           () => userRepository.updateUserName(
  //             userId: userRepositoryFixtures.testData.id,
  //             name: userRepositoryFixtures.testData.name,
  //           ),
  //           throwsA(isA<AppErrorModel>()),
  //         );
  //       },
  //     );
  //   },
  // );
}
