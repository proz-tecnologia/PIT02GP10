import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/modules/home/expense/pages/create_expense/controllers/create_expense_controller.dart';
import 'package:gastos_app/src/shared/components/custom_date_picker.dart';
import 'package:gastos_app/src/shared/components/custom_elevated_button.dart';
import 'package:gastos_app/src/shared/components/custom_loading_icon.dart';
import 'package:gastos_app/src/shared/components/custom_text_field.dart';
import 'package:validatorless/validatorless.dart';

class CreateExpensePage extends StatefulWidget {
  const CreateExpensePage({super.key});

  @override
  State<CreateExpensePage> createState() => _CreateExpensePageState();
}

class _CreateExpensePageState extends State<CreateExpensePage> {
  final createExpenseController = CreateExpenseController();

  final formKey = GlobalKey<FormState>();

  final valueController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ',',
    thousandSeparator: '.',
  );
  final descriptionController = TextEditingController();
  DateTime? chosenDate;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          color: AppColors.expenseColor,
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
                    onPressed: () {
                      Modular.to.pop();
                    },
                  ),
                ),
                Text(
                  "Nova despesa",
                  style: textStyle,
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                    label: "Valor da despesa",
                    filledColor: AppColors.expenseColor,
                    controller: valueController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: Validatorless.multiple([
                      Validatorless.required("Necessário informar um valor"),
                      (String? value) {
                        if (value == null || value == "R\$ 0,00") {
                          return "Digite um valor válido";
                        }
                        return null;
                      },
                    ]),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                    label: "Descrição",
                    filledColor: AppColors.expenseColor,
                    controller: descriptionController,
                    textInputAction: TextInputAction.next,
                    validator: Validatorless.required(
                      "Necessário informar uma descrição",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomDatePicker(
                    label: "Data de vencimento",
                    onDateChange: (date) {
                      chosenDate = date;
                    },
                    validator: Validatorless.required(
                      "Necessário informar uma data",
                    ),
                    filledColor: AppColors.expenseColor,
                  ),
                ),
                const SizedBox(height: 150),
                ValueListenableBuilder<CreateExpenseStates>(
                  valueListenable:
                      createExpenseController.createExpenseStateNotifier,
                  builder: (context, state, _) {
                    return SizedBox(
                      width: 110,
                      child: CustomElevatedButton(
                        backgroundColor: AppColors.expenseColor,
                        foregroundColor: AppColors.backgroundColor,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            createExpenseController.createExpense(
                              title: descriptionController.text,
                              value: valueController.numberValue,
                              createdAt: chosenDate!,
                            );
                          }
                        },
                        child: state == CreateExpenseStates.loading
                            ? const CustomLoadingIcon(
                                size: 16,
                              )
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
