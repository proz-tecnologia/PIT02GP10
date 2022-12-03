import 'package:gastos_app/src/models/profit_model.dart';
import 'package:gastos_app/src/models/user_model.dart';

abstract class ProfitsPageState {}

class ProfitPageStateEmpty extends ProfitsPageState {}

class ProfitPageStateLoading extends ProfitsPageState {}

class ProfitPageStateSuccess extends ProfitsPageState {
  final List<ProfitModel> profitsList;
  final UserModel loggedUser;

  ProfitPageStateSuccess({
    required this.profitsList,
    required this.loggedUser,
  });
}

class ProfitPageStateError extends ProfitsPageState {
  final String error;

  ProfitPageStateError({
    required this.error,
  });
}
