import 'package:flutter/material.dart';

class RowWithIconAndText extends StatelessWidget {
  const RowWithIconAndText({
    Key? key,
    required this.iconData,
    required this.iconColor,
    required this.text,
  }) : super(key: key);

  final IconData iconData;
  final Color iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        );

    return Row(
      children: [
        Icon(
          iconData,
          color: iconColor,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
