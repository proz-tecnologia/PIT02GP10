import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';

class CostumTextField extends StatelessWidget {
  CostumTextField({super.key, required this.label});

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(20.0));
  String? label;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(fontSize: 18, color: AppColors.fontColor),
                fillColor: AppColors.secondaryColor,
                filled: true,
                border: OutlineInputBorder(borderRadius: _borderRadius)),
            keyboardType: TextInputType.name,
          )
        ],
      ),
    )
   );
  }
}
