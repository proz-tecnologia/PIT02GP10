import 'package:faker/faker.dart';

class UserRepositoryFixtures {
  final testData = UserRepositoryTestData(
    email: faker.internet.email(),
    id: faker.guid.random.string(50),
    name: faker.person.name(),
    nickname: faker.person.firstName(),
    avatarUrl: faker.lorem.word(),
    newName: faker.person.firstName(),
  );
}

class UserRepositoryTestData {
  final String email;
  final String id;
  final String name;
  final String nickname;
  final String avatarUrl;
  final String newName;

  UserRepositoryTestData({
    required this.email,
    required this.id,
    required this.name,
    required this.nickname,
    required this.avatarUrl,
    required this.newName,
  });
}
