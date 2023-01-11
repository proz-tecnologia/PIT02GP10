import 'package:gastos_app/src/models/profit_model.dart';

abstract class ProfitListPageState {}

class ProfitPageStateEmpty extends ProfitListPageState {}

class ProfitPageStateLoading extends ProfitListPageState {}

class ProfitPageStateSuccess extends ProfitListPageState {
  final List<ProfitModel> profitsList;
  // final UserModel loggedUser;

  ProfitPageStateSuccess({
    required this.profitsList,
    // required this.loggedUser,
  });
}

class ProfitPageStateError extends ProfitListPageState {
  final String error;

  ProfitPageStateError({
    required this.error,
  });
}
