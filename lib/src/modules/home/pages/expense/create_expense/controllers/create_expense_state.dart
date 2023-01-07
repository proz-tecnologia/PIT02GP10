abstract class CreateExpensePageState {}

class CreateExpensePageStateEmpty extends CreateExpensePageState {}

class CreateExpensePageStateLoading extends CreateExpensePageState {
  CreateExpensePageStateLoading();
}

class CreateExpensePageStateSuccess extends CreateExpensePageState {
  CreateExpensePageStateSuccess();
}

class CreateExpensePageStateError extends CreateExpensePageState {
  CreateExpensePageStateError(
    this.object,
  );
  final Object object;
}
