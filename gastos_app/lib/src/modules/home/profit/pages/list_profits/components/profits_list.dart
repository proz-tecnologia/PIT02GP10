import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/models/profit_model.dart';
import 'package:gastos_app/src/shared/components/custom_refresh_indicator.dart';
import 'package:gastos_app/src/shared/utils/currency_formatter.dart';

import '../../../../components/field_value_box.dart';

class ProfitsList extends StatelessWidget {
  const ProfitsList({
    Key? key,
    required this.onRefresh,
    required this.profits,
  }) : super(key: key);

  final VoidCallback onRefresh;
  final List<ProfitModel> profits;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      backgroundColor: AppColors.profitColor,
      onRefresh: onRefresh,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final profit = profits[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      size: 20,
                      color: AppColors.profitColor,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FieldValueBox(
                        title: profit.title,
                        value: CurrencyFormatter.doubleToReais(
                          profit.value,
                        ),
                        date: profit.createdAt,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.profitColor,
                endIndent: 10,
                indent: 10,
                thickness: 2.0,
              ),
            ],
          );
        },
        itemCount: profits.length,
      ),
    );
  }
}
