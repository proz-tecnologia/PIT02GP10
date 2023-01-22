import 'package:gastos_app/src/models/user_model.dart';

abstract class ProfilePageState {}

class ProfilePageStateEmpty extends ProfilePageState {}

class ProfilePageStateLoading extends ProfilePageState {}

class ProfilePageStateSuccess extends ProfilePageState {
  final UserModel user;
  ProfilePageStateSuccess({
    required this.user,
  });
}

class ProfilePageStateError extends ProfilePageState {
  final Object error;
  ProfilePageStateError({
    required this.error,
  });
}
