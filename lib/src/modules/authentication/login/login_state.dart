abstract class LoginState {}

class LoginStateEmpty extends LoginState {}

class LoginStateLoading extends LoginState {
  LoginStateLoading();
}

class LoginStateSuccess extends LoginState {
  LoginStateSuccess();
}

class LoginStateError extends LoginState {
  LoginStateError(
    this.object,
  );
  final Object object;
}
