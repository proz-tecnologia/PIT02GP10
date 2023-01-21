abstract class RegisterState {}

class RegisterStateEmpty extends RegisterState {}

class RegisterStateLoading extends RegisterState {
  RegisterStateLoading();
}

class RegisterStateSuccess extends RegisterState {
  RegisterStateSuccess();
}

class RegisterStateError extends RegisterState {
  RegisterStateError(
    this.object,
  );
  final Object object;
}
