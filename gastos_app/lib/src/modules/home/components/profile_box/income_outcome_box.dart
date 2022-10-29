import 'package:flutter/material.dart';

import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/home/components/profile_box/row_with_icon_and_text.dart';
import 'package:gastos_app/src/shared/utils/currency_formatter.dart';

class IncomeOutcomeBox extends StatelessWidget {
  const IncomeOutcomeBox({
    Key? key,
    required this.incomeValue,
    required this.outcomeValue,
  }) : super(key: key);

  final double incomeValue;
  final double outcomeValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RowWithIconAndText(
          iconColor: AppColors.yellow,
          iconData: Icons.arrow_upward,
          text: CurrencyFormatter.doubleToReais(incomeValue),
        ),
        RowWithIconAndText(
          iconColor: AppColors.orange,
          iconData: Icons.arrow_downward,
          text: CurrencyFormatter.doubleToReais(outcomeValue),
        ),
      ],
    );
  }
}
