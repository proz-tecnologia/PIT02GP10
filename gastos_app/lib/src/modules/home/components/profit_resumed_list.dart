import 'package:flutter/material.dart';
import 'package:gastos_app/src/modules/home/components/field_value_box.dart';
import 'package:gastos_app/src/modules/home/models/profit_model.dart';
import 'package:gastos_app/src/shared/utils/currency_formatter.dart';

class ProfitResumedList extends StatelessWidget {
  const ProfitResumedList({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        );

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ganhos:",
                style: titleTextStyle,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ...mockedProfits
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
                InkWell(
                  onTap: onTap,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 26,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
