import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/authentication/authentication_routes.dart';
import 'package:gastos_app/src/modules/home/controllers/home_page_controller.dart';
import 'package:gastos_app/src/modules/home/home_routes.dart';
import 'package:gastos_app/src/modules/home/pages/expense/list_expenses/components/empty_page.dart';
import 'package:gastos_app/src/modules/home/pages/expense/list_expenses/components/error_page.dart';
import 'package:gastos_app/src/modules/home/pages/expense/list_expenses/components/expenses_list.dart';
import 'package:gastos_app/src/modules/home/pages/expense/list_expenses/controllers/expense_list_page_controller.dart';
import 'package:gastos_app/src/modules/home/pages/expense/list_expenses/controllers/expense_list_page_state.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';

class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpenseListPage> createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
  final expensesPageController = Modular.get<ExpenseListPageController>();

  @override
  void initState() {
    expensesPageController.getExpensesList();
    expensesPageController.expensesPageStateNotifier.addListener(() {
      if (expensesPageController.state is ExpenseListPageStateError) {
        final state = expensesPageController.state as ExpenseListPageStateError;
        if (state.shouldLogout) {
          Modular.to.pop();
          Modular.to.pushReplacementNamed(AuthenticationRoutes.splash);
        }
      }
    });
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
              child: ValueListenableBuilder<ExpenseListPageState>(
                builder: (context, state, _) {
                  if (state is ExpenseListPageStateSuccess) {
                    return ExpensesList(
                      onRefresh: expensesPageController.getExpensesList,
                      expenses: state.expensesList,
                    );
                  } else if (state is ExpenseListPageStateLoading) {
                    return const Center(
                      child: CustomLoadingIcon(
                        valueColor: AppColors.expenseColor,
                      ),
                    );
                  } else if (state is ExpenseListPageStateError) {
                    return ErrorPage(
                      onTryAgain: expensesPageController.getExpensesList,
                    );
                  }
                  return EmptyPage(
                    onCreateExpense: () {
                      Modular.to.pushNamed(HomeRoutes.createExpense).then(
                        (value) {
                          if (value == true) {
                            Modular.get<HomePageController>().loadData();
                            Modular.to.pop();
                          }
                        },
                      );
                    },
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
