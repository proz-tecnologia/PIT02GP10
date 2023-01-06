import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/models/profit_model.dart';
import 'package:gastos_app/src/modules/home/components/field_value_box.dart';
import 'package:gastos_app/src/shared/utils/currency_formatter.dart';
import 'package:gastos_app/src/shared/utils/date_formatter.dart';

class ProfitsAndExpensesResumedList extends StatelessWidget {
  const ProfitsAndExpensesResumedList({
    Key? key,
    required this.profits,
    required this.expenses,
  }) : super(key: key);

  final List<ProfitModel> profits;
  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        );

    final monthStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 22,
        );

    profits.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    expenses.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final resumedProfits = [];
    final resumedExpenses = [];

    if (profits.length >= 3) {
      resumedProfits.addAll([
        profits.elementAt(0),
        profits.elementAt(1),
        profits.elementAt(2),
      ]);
    } else {
      resumedProfits.addAll(profits);
    }
    if (expenses.length >= 3) {
      resumedExpenses.addAll([
        expenses.elementAt(0),
        expenses.elementAt(1),
        expenses.elementAt(2),
      ]);
    } else {
      resumedExpenses.addAll(expenses);
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(DateFormatter.monthName(DateTime.now()), style: monthStyle),
        const SizedBox(height: 20),
        const Divider(),
        InkWell(
          onTap: () {
            // Modular.to.pushNamed(AppRoutes.listProfit);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ganhos:",
                    style:
                        titleTextStyle?.copyWith(color: AppColors.profitColor),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ...resumedProfits
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                      top: 10,
                                    ),
                                    child: FieldValueBox(
                                      title: e.title,
                                      value: CurrencyFormatter.doubleToReais(
                                        e.value,
                                      ),
                                      date: e.createdAt,
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        InkWell(
          onTap: () {
            // Modular.to.pushNamed(AppRoutes.listExpense);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Despesas:",
                    style:
                        titleTextStyle?.copyWith(color: AppColors.expenseColor),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ...resumedExpenses
                              .map((element) => Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                      top: 10,
                                    ),
                                    child: FieldValueBox(
                                      title: element.title,
                                      value: CurrencyFormatter.doubleToReais(
                                        element.value,
                                      ),
                                      date: element.createdAt,
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
