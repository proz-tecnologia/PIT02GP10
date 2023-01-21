import 'package:gastos_app/src/models/profit_model.dart';

abstract class ProfitListPageState {}

class ProfitPageStateEmpty extends ProfitListPageState {}

class ProfitPageStateLoading extends ProfitListPageState {}

class ProfitPageStateSuccess extends ProfitListPageState {
  final List<ProfitModel> profitsList;

  ProfitPageStateSuccess({
    required this.profitsList,
  });
}

class ProfitPageStateError extends ProfitListPageState {
  final String? error;
  final bool shouldLogout;

  ProfitPageStateError({
    this.error,
    this.shouldLogout = false,
  });
}
