import 'package:faker/faker.dart';

class AuthRepositoryFixtures {
  final testData = AuthRepositoryTestData(
    avatarUrl: faker.lorem.word(),
    id: faker.guid.random.string(50),
    email: faker.internet.email(),
    password: faker.internet.password(),
    name: faker.person.name(),
  );
}

class AuthRepositoryTestData {
  final String avatarUrl;
  final String name;
  final String password;
  final String email;
  final String id;

  AuthRepositoryTestData({
    required this.avatarUrl,
    required this.name,
    required this.password,
    required this.email,
    required this.id,
  });
}
