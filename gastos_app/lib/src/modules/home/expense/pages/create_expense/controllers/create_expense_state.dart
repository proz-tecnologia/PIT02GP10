abstract class CreateExpenseStates {}

class CreateExpenseStateEmpty extends CreateExpenseStates {}

class CreateExpenseStateLoading extends CreateExpenseStates {
  CreateExpenseStateLoading();
}

class CreateExpenseStateSuccess extends CreateExpenseStates {
  CreateExpenseStateSuccess();
}

class CreateExpenseStateError extends CreateExpenseStates {
  CreateExpenseStateError(
    this.object,
  );
  final Object object;
}
