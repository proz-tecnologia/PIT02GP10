import 'package:flutter/material.dart';
import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/models/profit_model.dart';
import 'package:gastos_app/src/modules/home/components/home_fa_button.dart';
import 'package:gastos_app/src/modules/home/components/profile_box/profile_currency_box.dart';
import 'package:gastos_app/src/modules/home/components/profits_and_expenses_resumed_list.dart';
import 'package:gastos_app/src/shared/components/custom_refresh_indicator.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
    required this.profits,
    required this.expenses,
    required this.username,
    required this.onRefresh,
  }) : super(key: key);

  final List<ProfitModel> profits;
  final List<ExpenseModel> expenses;
  final String username;
  final VoidCallback onRefresh;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomRefreshIndicator(
          onRefresh: widget.onRefresh,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: false,
            children: [
              const SizedBox(height: 7),
              ProfileCurrencyBox(
                profits: widget.profits,
                expenses: widget.expenses,
                username: widget.username,
              ),
              ProfitsAndExpensesResumedList(
                profits: widget.profits,
                expenses: widget.expenses,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: HomeFAButton(
            onRefresh: widget.onRefresh,
          ),
        ),
      ],
    );
  }
}
