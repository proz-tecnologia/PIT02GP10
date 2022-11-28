import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';

class CreateProfitPage extends StatelessWidget {
  const CreateProfitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          color: AppColors.profitColor,
          fontSize: 32,
        );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ),
              Text(
                "Novo ganho",
                style: textStyle,
              ),
              const SizedBox(height: 40),
              const CustomTextField(
                label: "Valor do ganho",
                filledColor: AppColors.profitColor,
              ),
              const CustomTextField(
                label: "Descrição",
                filledColor: AppColors.profitColor,
              ),
              const CustomTextField(
                label: "Data do Recebimento",
                filledColor: AppColors.profitColor,
                suffixIcon: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.backgroundColor,
                ),
              ),
              const SizedBox(height: 80),
              SizedBox(
                width: 110,
                child: CustomElevatedButton(
                  backgroundColor: AppColors.profitColor,
                  foregroundColor: AppColors.backgroundColor,
                  onPressed: () {},
                  child: Text(
                    "Finalizar",
                    style: textStyle?.copyWith(
                      fontSize: 16,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
