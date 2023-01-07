abstract class RegisterStates {}

class RegisterStateEmpty extends RegisterStates {}

class RegisterStateLoading extends RegisterStates {
  RegisterStateLoading();
}

class RegisterStateSuccess extends RegisterStates {
  RegisterStateSuccess();
}

class RegisterStateError extends RegisterStates {
  RegisterStateError(
    this.object,
  );
  final Object object;
}
