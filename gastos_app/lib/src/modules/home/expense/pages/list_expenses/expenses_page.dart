import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/home/expense/pages/list_expenses/components/empty_page.dart';
import 'package:gastos_app/src/modules/home/expense/pages/list_expenses/components/error_page.dart';
import 'package:gastos_app/src/modules/home/expense/pages/list_expenses/components/expenses_list.dart';
import 'package:gastos_app/src/modules/home/expense/pages/list_expenses/controllers/expenses_page_controller.dart';
import 'package:gastos_app/src/modules/home/expense/pages/list_expenses/expenses_page_states.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final expensesPageController = ExpensesPageController();

  @override
  void initState() {
    expensesPageController.getExpensesList();
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
                onPressed: () {
                  Modular.to.pop();
                },
              ),
            ),
            Text(
              "Despesas",
              style: textStyle,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ValueListenableBuilder<ExpensesPageState>(
                builder: (context, state, _) {
                  if (state is ExpensePageStateSuccess) {
                    return ExpensesList(
                      onRefresh: expensesPageController.getExpensesList,
                      expenses: state.expensesList,
                    );
                  } else if (state is ExpensePageStateLoading) {
                    return const Center(
                      child: CustomLoadingIcon(
                        valueColor: AppColors.profitColor,
                      ),
                    );
                  } else if (state is ExpensePageStateError) {
                    return ErrorPage(
                      onTryAgain: expensesPageController.getExpensesList,
                    );
                  }
                  return EmptyPage(
                    onCreateExpense: () {},
                  );
                },
                valueListenable:
                    expensesPageController.expensesPageStateNotifier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
