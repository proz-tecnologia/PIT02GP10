import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/models/expense_model.dart';
import 'package:gastos_app/src/modules/home/components/field_value_box.dart';
import 'package:gastos_app/src/shared/utils/currency_formatter.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  final List<ExpenseModel> expenses;

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  void initState() {
    widget.expenses.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.expenseColor,
          fontSize: 36,
        );

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                )),
            Text(
              "Despesas",
              style: textStyle,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final expense = widget.expenses[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.expenseColor,
                              ),
                              width: 20,
                              height: 20,
                              child: const Icon(
                                Icons.money_off,
                                size: 20,
                                color: AppColors.backgroundColor,
                              ),
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
                itemCount: widget.expenses.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
