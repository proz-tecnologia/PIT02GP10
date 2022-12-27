import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/shared/components/custom_refresh_indicator.dart';
import 'package:gastos_app/src/shared/utils/currency_formatter.dart';

import '../../../../components/field_value_box.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    Key? key,
    required this.onRefresh,
    required this.expenses,
  }) : super(key: key);

  final VoidCallback onRefresh;
  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      backgroundColor: AppColors.expenseColor,
      onRefresh: onRefresh,
      child: ListView.builder(
        shrinkWrap: false,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      size: 20,
                      color: AppColors.expenseColor,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FieldValueBox(
                        title: expense.title,
                        value: CurrencyFormatter.doubleToReais(
                          expense.value,
                        ),
                        date: expense.createdAt,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.expenseColor,
                endIndent: 10,
                indent: 10,
                thickness: 2.0,
              ),
            ],
          );
        },
        itemCount: expenses.length,
      ),
    );
  }
}
