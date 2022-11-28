import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/shared/components/effectless_inkwell.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    this.filledColor = AppColors.secondaryColor,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.controller,
    this.textInputAction = TextInputAction.done,
    this.validator,
  }) : super(key: key);

  final String label;
  final Color filledColor;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final BorderRadius _borderRadius = const BorderRadius.all(
    Radius.circular(32.0),
  );

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
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
      borderRadius: _borderRadius,
      borderSide: BorderSide(
        color: widget.filledColor,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            focusNode.hasPrimaryFocus ? widget.label : "",
            style: focusedLabelStyle,
          ),
          const SizedBox(height: 2),
          Stack(
            children: [
              TextFormField(
                onTap: () {
                  setState(() {
                    if (focusNode.hasPrimaryFocus) focusNode.unfocus();
                  });
                },
                controller: widget.controller,
                focusNode: focusNode,
                keyboardType: widget.textInputType,
                textInputAction: widget.textInputAction,
                validator: widget.validator,
                decoration: InputDecoration(
                  fillColor: widget.filledColor,
                  filled: true,
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
                ),
              ),
              if (!focusNode.hasPrimaryFocus)
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: EffectlessInkWell(
                    onTap: () {
                      setState(() {
                        if (!focusNode.hasPrimaryFocus) {
                          focusNode.requestFocus();
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        widget.label,
                        style: unfocusedLabelStyle,
                      ),
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
