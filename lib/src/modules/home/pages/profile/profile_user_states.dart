abstract class ProfileUserStates {}

class ProfileUserStateEmpty extends ProfileUserStates{}

class ProfileUserStateLoading extends ProfileUserStates {
  ProfileUserStateLoading();
}

class ProfileUserStateSuccess extends ProfileUserStates {
  ProfileUserStateSuccess();
}

class ProfileUserStateError extends ProfileUserStates {
  ProfileUserStateError(
    this.object,
  );
  final Object object;
}