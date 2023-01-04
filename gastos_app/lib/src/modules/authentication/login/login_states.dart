abstract class LoginStates{}

class LoginStateEmpty extends LoginStates{}

class LoginStateLoading extends LoginStates{
  LoginStateLoading();
}

class LoginStateSuccess extends LoginStates {
  LoginStateSuccess();
}

class LoginStateError extends LoginStates {
  LoginStateError(
    this.object,
  );
  final Object object;
}
