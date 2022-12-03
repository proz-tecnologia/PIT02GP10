import 'package:flutter/material.dart';
import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/models/profit_model.dart';
import 'package:gastos_app/src/models/user_model.dart';
import 'package:gastos_app/src/modules/home/components/home_fa_button.dart';
import 'package:gastos_app/src/modules/home/components/profile_box/profile_currency_box.dart';
import 'package:gastos_app/src/modules/home/components/profits_and_expenses_resumed_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.profits,
    required this.expenses,
    required this.loggedUser,
  }) : super(key: key);

  final List<ProfitModel> profits;
  final List<ExpenseModel> expenses;
  final UserModel loggedUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 7),
              ProfileCurrencyBox(
                profits: profits,
                expenses: expenses,
                username: loggedUser.name,
              ),
              ProfitsAndExpensesResumedList(
                profits: profits,
                expenses: expenses,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        const Positioned(
          bottom: 10,
          right: 10,
          child: HomeFAButton(),
        ),
      ],
    );
  }
}
