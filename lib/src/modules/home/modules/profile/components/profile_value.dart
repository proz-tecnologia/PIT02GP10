import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_themes.dart';

class ProfileValue extends StatelessWidget {
  const ProfileValue({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.fontColor,
          fontWeight: FontWeight.w500,
        );

    final valueTextStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.backgroundColor,
          fontWeight: FontWeight.w500,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: labelStyle,
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: AppThemes.defaultBorderRadius,
            border: Border.all(
              color: AppColors.primaryColor,
            ),
          ),
          child: Text(
            value,
            style: valueTextStyle,
          ),
        ),
      ],
    );
  }
}
