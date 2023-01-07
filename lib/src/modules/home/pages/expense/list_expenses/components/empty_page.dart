import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    Key? key,
    required this.onCreateExpense,
  }) : super(key: key);

  final VoidCallback onCreateExpense;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.expenseColor,
          fontSize: 36,
        );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Nenhuma despesa cadastrada',
            style: textStyle?.copyWith(
              fontSize: 18,
              color: AppColors.fontColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          onPressed: onCreateExpense,
          backgroundColor: AppColors.expenseColor,
          child: const Text("Cadastrar despesa"),
        ),
      ],
    );
  }
}
