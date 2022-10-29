import 'package:flutter/material.dart';
import 'package:gastos_app/src/shared/utils/date_formatter.dart';

class FieldValueBox extends StatelessWidget {
  const FieldValueBox({
    Key? key,
    required this.title,
    required this.value,
    required this.date,
  }) : super(key: key);

  final String title;
  final String value;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        );

    return Row(
      children: [
        Text(
          "$title: $value",
          style: textStyle,
        ),
        const Spacer(),
        Text(
          DateFormatter.formattedWithMonthName(date),
          style: textStyle,
        ),
      ],
    );
  }
}
