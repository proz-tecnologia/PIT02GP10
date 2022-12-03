import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
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
    final incomeOutcomeStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_upward,
            color: AppColors.profitColor,
          ),
          const SizedBox(width: 5),
          Text(
            CurrencyFormatter.doubleToReais(incomeValue),
            style: incomeOutcomeStyle,
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.arrow_downward,
            color: AppColors.expenseColor,
          ),
          const SizedBox(width: 5),
          Text(
            CurrencyFormatter.doubleToReais(outcomeValue),
            style: incomeOutcomeStyle,
          ),
        ],
      ),
    );
  }
}
