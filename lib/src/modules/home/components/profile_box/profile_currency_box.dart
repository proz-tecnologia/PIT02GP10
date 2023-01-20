import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/models/profit_model.dart';
import 'package:gastos_app/src/modules/home/components/profile_box/income_outcome_box.dart';
import 'package:gastos_app/src/shared/components/image_network_builder.dart';
import 'package:gastos_app/src/shared/utils/currency_formatter.dart';

class ProfileCurrencyBox extends StatelessWidget {
  const ProfileCurrencyBox({
    Key? key,
    required this.username,
    this.avatarUrl,
    required this.profits,
    required this.expenses,
  }) : super(key: key);

  final String username;
  final String? avatarUrl;
  final List<ProfitModel> profits;
  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    final usernameStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        );

    final balanceStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.backgroundColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        );

    const decoration = BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );

    final totalOutcome = expenses.fold(
      0.0,
      (total, element) => total + element.value,
    );
    final totalIncome = profits.fold(
      0.0,
      (total, element) => total + element.value,
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: decoration,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (avatarUrl != null)
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(500)),
                    child: SizedBox(
                      height: 70,
                      child: ImageNetworkBuilder(avatarUrl!),
                    ),
                  ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Olá, $username!",
                        style: usernameStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        CurrencyFormatter.doubleToReais(
                          totalIncome - totalOutcome,
                        ),
                        style: balanceStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          IncomeOutcomeBox(
            incomeValue: totalIncome,
            outcomeValue: totalOutcome,
          ),
        ],
      ),
    );
  }
}
