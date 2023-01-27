import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gastos_app/src/models/user_model.dart';

import '../../fixtures/user_data_fixtures.dart';

void main() {
  group(
    'User Model Test',
    () {
      final userFixture = UserDataFixtures();

      test('UserModel fromMap with all data', () {
        final userMap = userFixture.completeUser;

        final user = UserModel.fromMap(userMap);

        expect(user.email, equals(userMap['email']));
        expect(user.nickname, equals(userMap['nickname']));
        expect(user.avatarUrl, equals(userMap['avatarUrl']));
        expect(user.name, equals(userMap['name']));
        expect(user.phone, equals(userMap['phone']));
      });

      test(
        'UserModel fromMap when optional fields is not provided',
        () {
          final userMap = userFixture.userWithoutOptionalFields;

          final user = UserModel.fromMap(userMap);

          expect(user.email, equals(userMap['email']));
          expect(user.nickname, isNull);
          expect(user.avatarUrl, isNull);
          expect(user.name, equals(userMap['name']));
          expect(user.phone, isNull);
        },
      );

      test(
        'Map generated when using toMap from a complete user',
        () {
          final user = userFixture.completeUserModel;

          final userMap = user.toMap();

          expect(userMap['name'], equals(user.name));
          expect(userMap['nickname'], equals(user.nickname));
          expect(userMap['avatarUrl'], equals(user.avatarUrl));
          expect(userMap['email'], equals(user.email));
          expect(userMap['phone'], equals(user.phone));
          expect(userMap['id'], equals(user.id));
        },
      );

      test(
        'Map generated when using toMap from a partial user',
        () {
          final user = userFixture.partialUserModel;

          final userMap = user.toMap();

          expect(userMap['name'], equals(user.name));
          expect(userMap['nickname'], isNull);
          expect(userMap['avatarUrl'], isNull);
          expect(userMap['email'], equals(user.email));
          expect(userMap['phone'], isNull);
          expect(userMap['id'], equals(user.id));
        },
      );

      test('UserModel fromJson with all data', () {
        final userMap = userFixture.completeUser;

        final userJson = jsonEncode(userMap);

        final user = UserModel.fromJson(userJson);

        expect(user.email, equals(userMap['email']));
        expect(user.nickname, equals(userMap['nickname']));
        expect(user.avatarUrl, equals(userMap['avatarUrl']));
        expect(user.name, equals(userMap['name']));
        expect(user.phone, equals(userMap['phone']));
      });

      test('UserModel toJson with all data', () {
        final user = userFixture.completeUserModel;

        final json = user.toJson();

        expect(json, isA<String>());
        expect(json.contains(user.name), isTrue);
      });

      test('UserModel copyWith providing a name', () {
        final user = userFixture.completeUserModel;

        final newName = faker.person.name();

        final copiedUser = user.copyWith(name: newName);

        expect(copiedUser.name, equals(newName));
      });
      test('UserModel copyWith changing a email', () {
        final user = userFixture.completeUserModel;

        final newEmail = faker.internet.email();

        final copiedUser = user.copyWith(email: newEmail);

        expect(copiedUser.email, equals(newEmail));
      });

      test('UserModel copyWith providing all data', () {
        final user = userFixture.completeUserModel;

        final newName = faker.person.name();
        final newEmail = faker.internet.email();
        final newId = faker.guid.random.string(50);
        final newAvatarUrl = faker.lorem.word();
        final newPhone = faker.phoneNumber.us();
        final newNickname = faker.person.name();

        final copiedUser = user.copyWith(
          avatarUrl: newAvatarUrl,
          email: newEmail,
          id: newId,
          name: newName,
          phone: newPhone,
          nickname: newNickname,
        );

        expect(copiedUser.name, equals(newName));
        expect(copiedUser.email, equals(newEmail));
        expect(copiedUser.nickname, equals(newNickname));
        expect(copiedUser.phone, equals(newPhone));
        expect(copiedUser.id, equals(newId));
        expect(copiedUser.avatarUrl, equals(newAvatarUrl));
      });

      test('UserModel toString', () {
        final user = userFixture.completeUserModel;

        final userString = user.toString();

        expect(userString.contains(user.name), isTrue);
      });

      test('UserModel operator ==', () {
        final user = userFixture.completeUserModel;

        final secondUser = userFixture.completeUserModel;

        expect(user == secondUser, isTrue);
      });
      test('UserModel operator == test when user is not equal', () {
        final user = userFixture.completeUserModel;

        final secondUser = userFixture.partialUserModel;

        expect(user == secondUser, isFalse);
      });

      test('UserModel operator == test when nickname is not equal', () {
        final user = userFixture.completeUserModel;

        final secondUser = userFixture.completeUserModel.copyWith(
          nickname: faker.person.name(),
        );

        expect(user == secondUser, isFalse);
      });

      test('UserModel hashCode', () {
        final user = userFixture.completeUserModel;

        final hashCode = user.hashCode;

        expect(hashCode, isA<int>());
      });

      test('UserModel constructor', () {
        final email = faker.internet.email();
        final name = faker.person.name();
        final id = faker.guid.random.string(50);

        final user = UserModel(email: email, id: id, name: name);

        expect(user.email, equals(email));
        expect(user.name, equals(name));
        expect(user.id, equals(id));
      });
    },
  );
}
