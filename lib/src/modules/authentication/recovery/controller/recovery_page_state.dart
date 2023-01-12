abstract class RecoveryPageState {}

class RecoveryPageStateEmpty extends RecoveryPageState {}

class RecoveryPageStateLoading extends RecoveryPageState {}

class RecoveryPageStateSuccess extends RecoveryPageState {}

class RecoveryPageStateError extends RecoveryPageState {
  final Object error;
  RecoveryPageStateError({
    required this.error,
  });
}
