import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_themes.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    Key? key,
    this.onDateChange,
    this.validator,
    this.filledColor = AppColors.secondaryColor,
    this.pickerFontColor,
    required this.label,
  }) : super(key: key);

  final void Function(DateTime date)? onDateChange;
  final String? Function(String?)? validator;
  final Color filledColor;
  final Color? pickerFontColor;
  final String label;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final focusNode = FocusNode();
  final controller = TextEditingController();
  late Color pickerFontColor;

  @override
  void initState() {
    pickerFontColor = widget.pickerFontColor ??
        AppColors.foregroundColorBasedOnBackground(
          widget.filledColor,
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final valueTextStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.backgroundColor,
          fontWeight: FontWeight.w500,
        );

    final focusedLabelStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.fontColor,
          fontWeight: FontWeight.w500,
        );

    final unfocusedLabelStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.backgroundColor,
          fontWeight: FontWeight.w500,
        );

    final outlineBorder = OutlineInputBorder(
      borderRadius: AppThemes.defaultBorderRadius,
      borderSide: BorderSide(
        color: widget.filledColor,
      ),
    );
    return Theme(
      data: Theme.of(context).copyWith(
        dialogBackgroundColor: pickerFontColor.computeLuminance() > 0.5
            ? AppColors.backgroundColor
            : AppColors.fontColor,
        textButtonTheme: TextButtonThemeData(
          style: Theme.of(context).textButtonTheme.style?.copyWith(
                foregroundColor: MaterialStateProperty.all(widget.filledColor),
              ),
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              surface: widget.filledColor,
              onPrimary: AppColors.fontColor,
              outline: Colors.transparent,
              primary: widget.filledColor,
              onSurface: pickerFontColor,
            ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              focusNode.hasPrimaryFocus || controller.text.isNotEmpty
                  ? widget.label
                  : "",
              style: focusedLabelStyle,
            ),
          ),
          const SizedBox(height: 2),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.filledColor,
                  borderRadius: AppThemes.defaultBorderRadius,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: DateTimePicker(
                        focusNode: focusNode,
                        locale: const Locale("pt", "BR"),
                        calendarTitle: widget.label,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        confirmText: "Confirmar",
                        cancelText: "Cancelar",
                        style: valueTextStyle,
                        onChanged: (date) {
                          if (widget.onDateChange != null) {
                            widget.onDateChange!(DateTime.parse(date));
                          }
                          setState(() {});
                        },
                        controller: controller,
                        validator: widget.validator,
                        onSaved: (date) {},
                        cursorColor: AppColors.backgroundColor,
                        decoration: InputDecoration(
                          border: outlineBorder,
                          enabledBorder: outlineBorder,
                          focusedBorder: outlineBorder,
                          disabledBorder: outlineBorder.copyWith(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          errorBorder: outlineBorder.copyWith(
                            borderSide: const BorderSide(
                              color: AppColors.errorColor,
                            ),
                          ),
                          hoverColor: AppColors.primaryColor,
                          fillColor: AppColors.primaryColor,
                          focusColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.backgroundColor,
                      size: 24,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              if (!focusNode.hasPrimaryFocus && controller.text.isEmpty)
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      widget.label,
                      style: unfocusedLabelStyle,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
