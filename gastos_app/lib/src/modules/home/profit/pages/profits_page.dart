import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/home/components/field_value_box.dart';
import 'package:gastos_app/src/modules/home/models/profit_model.dart';
import 'package:gastos_app/src/shared/utils/currency_formatter.dart';

class ProfitsPage extends StatefulWidget {
  const ProfitsPage({
    Key? key,
    required this.profits,
  }) : super(key: key);

  final List<ProfitModel> profits;

  @override
  State<ProfitsPage> createState() => _ProfitsPageState();
}

class _ProfitsPageState extends State<ProfitsPage> {
  @override
  void initState() {
    widget.profits.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.profitColor,
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
              "Ganhos",
              style: textStyle,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final profit = widget.profits[index];
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
                itemCount: widget.profits.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
