import 'package:faker/faker.dart';
import 'package:gastos_app/src/models/user_model.dart';

class UserDataFixtures {
  final Map<String, dynamic> completeUser = <String, dynamic>{
    'avatarUrl': faker.lorem.word(),
    'id': faker.guid.random.string(50),
    'email': faker.internet.email(),
    'nickname': faker.person.firstName(),
    'phone': faker.phoneNumber.us(),
    'name': faker.person.name(),
  };

  final Map<String, dynamic> userWithoutOptionalFields = <String, dynamic>{
    'id': faker.guid.random.string(50),
    'email': faker.internet.email(),
    'name': faker.person.name(),
  };

  final UserModel completeUserModel = UserModel(
    email: faker.internet.email(),
    id: faker.guid.random.string(50),
    name: faker.person.name(),
    phone: faker.phoneNumber.us(),
    avatarUrl: faker.lorem.word(),
    nickname: faker.person.firstName(),
  );

  final UserModel partialUserModel = UserModel(
    email: faker.internet.email(),
    id: faker.guid.random.string(50),
    name: faker.person.name(),
  );
}
