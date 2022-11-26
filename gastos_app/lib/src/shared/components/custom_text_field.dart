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
    Radius.circular(20.0),
  );

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final focusedLabelStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.fontColor,
        );

    final unfocusedLabelStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.backgroundColor,
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
                  fillColor: AppColors.secondaryColor,
                  filled: true,
                  border: OutlineInputBorder(borderRadius: _borderRadius),
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
