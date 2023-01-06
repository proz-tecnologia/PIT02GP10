abstract class CreateProfitPageState {}

class CreateProfitPageStatePageEmpty extends CreateProfitPageState {}

class CreateProfitPageStateLoading extends CreateProfitPageState {
  CreateProfitPageStateLoading();
}

class CreateProfitPageStateSuccess extends CreateProfitPageState {
  CreateProfitPageStateSuccess();
}

class CreateProfitPageStateError extends CreateProfitPageState {
  CreateProfitPageStateError(
    this.object,
  );
  final Object object;
}
