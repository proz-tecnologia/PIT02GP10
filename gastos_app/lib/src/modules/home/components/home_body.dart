import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/models/profit_model.dart';
import 'package:gastos_app/src/models/user_model.dart';
import 'package:gastos_app/src/modules/home/components/home_fa_button.dart';
import 'package:gastos_app/src/modules/home/components/profile_box/profile_currency_box.dart';
import 'package:gastos_app/src/modules/home/components/profits_and_expenses_resumed_list.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
    required this.profits,
    required this.expenses,
    required this.loggedUser,
    required this.onRefresh,
  }) : super(key: key);

  final List<ProfitModel> profits;
  final List<ExpenseModel> expenses;
  final UserModel loggedUser;
  final VoidCallback onRefresh;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Future<void> _refresh() async {
    widget.onPopBack();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          edgeOffset: 2,
          displacement: 2,
          strokeWidth: 2,
          color: AppColors.fontColor,
          backgroundColor: AppColors.primaryColor,
          onRefresh: _refresh,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: false,
            children: [
              const SizedBox(height: 7),
              ProfileCurrencyBox(
                profits: widget.profits,
                expenses: widget.expenses,
                username: widget.loggedUser.name,
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
          bottom: 10,
          right: 10,
          child: HomeFAButton(
            onPopBack: onPopBack,
          ),
        ),
      ],
    );
  }
}
