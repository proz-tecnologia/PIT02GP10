import 'package:flutter/material.dart';
import 'package:gastos_app/src/mock/mocked_data.dart';
import 'package:gastos_app/src/modules/home/components/home_fa_button.dart';
import 'package:gastos_app/src/modules/home/components/profile_box/profile_currency_box.dart';
import 'package:gastos_app/src/modules/home/components/profits_and_expenses_resumed_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

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
                profits: MockedData.mockedProfits,
                expenses: MockedData.mockedExpenses,
                username: "usuário",
              ),
              ProfitsAndExpensesResumedList(
                profits: MockedData.mockedProfits,
                expenses: MockedData.mockedExpenses,
              ),
              // SizedBox para evitar que o FAB fique em cima da informação.
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
