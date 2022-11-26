import 'package:flutter/material.dart';

import 'package:gastos_app/src/core/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.filledColor,
    this.suffixIcon,
    this.textInputType,
  }) : super(key: key);

  final String label;
  final Color? filledColor;
  final Widget? suffixIcon;
  final TextInputType? textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(20.0));

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {
            if (focusNode.hasFocus) focusNode.unfocus();
            setState(() {});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(focusNode.hasFocus ? widget.label : ""),
              Stack(
                children: [
                  TextFormField(
                    focusNode: focusNode,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: AppColors.fontColor,
                        ),
                        fillColor: AppColors.secondaryColor,
                        filled: true,
                        border:
                            OutlineInputBorder(borderRadius: _borderRadius)),
                    keyboardType: widget.textInputType,
                  ),
                  if (!focusNode.hasFocus)
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Center(child: Text(widget.label)),
                    ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
