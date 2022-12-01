import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/home/profit/controllers/create_profit_controller.dart';
import 'package:gastos_app/src/shared/components/custom_date_picker.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';
import 'package:validatorless/validatorless.dart';

class CreateProfitPage extends StatefulWidget {
  const CreateProfitPage({super.key});

  @override
  State<CreateProfitPage> createState() => _CreateProfitPageState();
}

class _CreateProfitPageState extends State<CreateProfitPage> {
  final formKey = GlobalKey<FormState>();
  final createProfitController = CreateProfitController();

  final valueController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? chosenDate;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          color: AppColors.profitColor,
          fontSize: 32,
        );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                CustomTextField(
                  label: "Valor do ganho",
                  filledColor: AppColors.profitColor,
                  controller: valueController,
                  validator: Validatorless.multiple([
                    Validatorless.required("Necessário informar um ganho"),
                  ]),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Descrição",
                  filledColor: AppColors.profitColor,
                  controller: descriptionController,
                  validator: Validatorless.multiple([
                    Validatorless.required("Necessário informar uma descrição"),
                  ]),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomDatePicker(
                    label: "Data de recebimento",
                    onDateChange: (date) {
                      chosenDate = date;
                    },
                    validator: Validatorless.multiple([
                      Validatorless.required("Necessário informar uma data"),
                    ]),
                    filledColor: AppColors.profitColor,
                  ),
                ),
                const SizedBox(height: 150),
                ValueListenableBuilder<CreateProfitStates>(
                  valueListenable:
                      createProfitController.createProfitStateNotifier,
                  builder: (context, state, _) {
                    return SizedBox(
                      width: 110,
                      child: CustomElevatedButton(
                        backgroundColor: AppColors.profitColor,
                        foregroundColor: AppColors.backgroundColor,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            createProfitController.createProfit(
                              title: descriptionController.text,
                              value: double.parse("2.00"),
                            );
                          }
                        },
                        child: state == CreateProfitStates.loading
                            ? const CircularProgressIndicator()
                            : Text(
                                "Finalizar",
                                style: textStyle?.copyWith(
                                  fontSize: 16,
                                  color: AppColors.backgroundColor,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
