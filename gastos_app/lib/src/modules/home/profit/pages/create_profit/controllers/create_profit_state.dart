abstract class CreateProfitStates {}

class CreateProfitStateEmpty extends CreateProfitStates {}

class CreateProfitStateLoading extends CreateProfitStates {
  CreateProfitStateLoading();
}

class CreateProfitStateSuccess extends CreateProfitStates {
  CreateProfitStateSuccess();
}

class CreateProfitStateError extends CreateProfitStates {
  CreateProfitStateError(
    this.object,
  );
  final Object object;
}
