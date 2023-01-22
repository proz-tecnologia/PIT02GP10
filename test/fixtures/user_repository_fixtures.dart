import 'package:faker/faker.dart';

class UserRepositoryFixtures {
  final testData = UserRepositoryTestData(
    email: faker.internet.email(),
    id: faker.guid.random.string(50),
    name: faker.person.name(),
  );
}

class UserRepositoryTestData {
  final String email;
  final String id;
  final String name;
  UserRepositoryTestData({
    required this.email,
    required this.id,
    required this.name,
  });
}
