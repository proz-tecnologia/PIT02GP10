abstract class EditProfileState {}

class EditProfileStateEmpty extends EditProfileState {}

class EditProfileStateLoading extends EditProfileState {
  EditProfileStateLoading();
}

class EditProfileStateSuccess extends EditProfileState {
  EditProfileStateSuccess();
}

class EditProfileStateError extends EditProfileState {
  EditProfileStateError(
    this.object,
  );
  final Object object;
}
