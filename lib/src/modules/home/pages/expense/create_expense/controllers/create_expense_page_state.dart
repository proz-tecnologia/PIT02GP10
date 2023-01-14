abstract class CreateExpensePageState {}

class CreateExpensePageStateEmpty extends CreateExpensePageState {}

class CreateExpensePageStateLoading extends CreateExpensePageState {
  CreateExpensePageStateLoading();
}

class CreateExpensePageStateSuccess extends CreateExpensePageState {
  CreateExpensePageStateSuccess();
}

class CreateExpensePageStateError extends CreateExpensePageState {
  CreateExpensePageStateError({
    this.error,
    this.shouldLogout = false,
  });
  final Object? error;
  final bool shouldLogout;
}
